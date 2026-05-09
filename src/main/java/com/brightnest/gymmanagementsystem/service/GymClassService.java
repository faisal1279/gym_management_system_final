package com.brightnest.gymmanagementsystem.service;

import com.brightnest.gymmanagementsystem.model.User;
import com.brightnest.gymmanagementsystem.model.blog.Blog;
import com.brightnest.gymmanagementsystem.model.blog.BlogImage;
import com.brightnest.gymmanagementsystem.model.gymClass.ClassImage;
import com.brightnest.gymmanagementsystem.model.gymClass.ClassSchedule;
import com.brightnest.gymmanagementsystem.model.gymClass.GymClass;
import com.brightnest.gymmanagementsystem.model.trainer.Trainer;
import com.brightnest.gymmanagementsystem.repository.ClassImageRepository;
import com.brightnest.gymmanagementsystem.repository.GymClassRepository;
import com.brightnest.gymmanagementsystem.repository.TrainerRepository;
import com.brightnest.gymmanagementsystem.repository.UserRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class GymClassService {

    private final GymClassRepository gymClassRepository;
    private final TrainerRepository trainerRepository;
    private final UserRepository userRepository;
    private final ClassImageRepository classImageRepository;

    private static final long MAX_COVER_SIZE = 5 * 1024 * 1024; // 5MB
    private static final long MAX_IMAGE_SIZE = 5 * 1024 * 1024; // 5MB


@Transactional
public void createClass(
        String name,
        String level,
        int duration,
        int capacity,
        String shortDesc,
        String description,
        MultipartFile coverImage,
        MultipartFile[] images,
        UUID trainerId,
//        List<DayOfWeek> days,
//        List<LocalTime> startTimes,
//        List<LocalTime> endTimes,
        boolean active,
        String email
){

    // ✅ ADMIN VALIDATION
    User user = userRepository.findByEmail(email);

    if(user == null){
        throw new RuntimeException("User not found");
    }

    if(!"ROLE_ADMIN".equals(user.getRole())){
        throw new RuntimeException("Only admin can create class");
    }

    // ✅ CREATE CLASS
    GymClass gymClass = new GymClass();

    gymClass.setName(name);
    gymClass.setLevel(level);
    gymClass.setDuration(duration);
    gymClass.setCapacity(capacity);
    gymClass.setShortDescription(shortDesc);
    gymClass.setDescription(description);
    gymClass.setActive(active);
    gymClass.setCreatedAt(LocalDateTime.now());

    //  TRAINER SET
    if(trainerId != null){
        Trainer trainer = trainerRepository.findById(trainerId)
                .orElseThrow(() -> new RuntimeException("Trainer not found"));

        gymClass.setTrainer(trainer);
    }

    //  SAVE FIRST
    GymClass saved = gymClassRepository.save(gymClass);

    //  SAVE SCHEDULE (IMPORTANT FIX)
//    saveSchedules(saved, days, startTimes, endTimes);

    //  MUST SAVE AGAIN (schedule persist hobe)
    gymClassRepository.save(saved);

    //  IMAGE UPLOAD
    try{
        saveCoverImage(saved, coverImage);
        saveImages(saved, images);
    }catch (Exception e){
        throw new RuntimeException("Image upload failed: " + e.getMessage());
    }
}

    //  Get All Active Classes (Home Page)
    public List<GymClass> getAllActiveClasses(){
        return gymClassRepository.findByActiveTrueOrderByCreatedAtDesc();
    }

    public List<GymClass> getAllClasses(){
        return gymClassRepository.findAll();
    }

    //  Get Single Class (Details Page)
    public GymClass getClassById(UUID id){
        return gymClassRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Class not found"));
    }

    //  Delete Class (Soft Delete)
    public void deleteClass(UUID id,String email){
        validateAdmin(email);
        GymClass gymClass = getClassById(id);
        gymClass.setActive(false);
        gymClassRepository.save(gymClass);
    }

    //  Update Class
//    public void updateClass(
//            UUID id,
//            String name,
//            String level,
//            int duration,
//            int capacity,
//            String shortDesc,
//            String description,
//            MultipartFile coverImage,
//            List<MultipartFile> images,
//            UUID trainerId,
//
//            List<DayOfWeek> days,
//            List<LocalTime> startTimes,
//            List<LocalTime> endTimes,
//
//            String email
//    ){
//
//        validateAdmin(email);
//
//        GymClass gymClass = getClassById(id);
//
//        gymClass.setName(name);
//        gymClass.setLevel(level);
//        gymClass.setDuration(duration);
//        gymClass.setCapacity(capacity);
//        gymClass.setShortDescription(shortDesc);
//        gymClass.setDescription(description);
//
//        // Trainer update
//        if(trainerId != null){
//            Trainer trainer = trainerRepository.findById(trainerId)
//                    .orElseThrow(() -> new RuntimeException("Trainer not found"));
//
//            gymClass.setTrainer(trainer);
//        }
//
//        // ✅ Schedule Update
//        saveSchedules(gymClass, days, startTimes, endTimes);
//
//        GymClass saved = gymClassRepository.save(gymClass);
//
//        try{
//            if(coverImage != null && !coverImage.isEmpty()){
//                saveCoverImage(saved, coverImage);
//            }
//
//            saveImages(saved, images);
//
//        }catch (Exception e){
//            throw new RuntimeException("Image upload failed");
//        }
//
//    }


    private void validateAdmin(String email){
        User user = userRepository.findByEmail(email);

        if(user == null)
            throw new RuntimeException("User not found");

        if(!"ROLE_ADMIN".equals(user.getRole()))
            throw new RuntimeException("Access denied");
    }


    private String sanitizeFileName(String fileName) {

        if (fileName == null) return "file";

        return fileName
                .replaceAll("[^a-zA-Z0-9\\.\\-]", "_"); // remove unsafe chars
    }

    private void saveCoverImage(GymClass gymClass, MultipartFile file) throws Exception {

        if (file == null || file.isEmpty()) return;

        // ✅ Size validation (5MB)
        if (file.getSize() > 5 * 1024 * 1024) {
            throw new RuntimeException("Cover image must be less than 5MB");
        }

        String uploadDir = "uploads/classes/";
        Files.createDirectories(Paths.get(uploadDir));

        String fileName = UUID.randomUUID() + "_" + sanitizeFileName(file.getOriginalFilename());

        Path path = Paths.get(uploadDir, fileName);

        // ✅ Stream-based write (better)
        try (InputStream is = file.getInputStream()) {
            Files.copy(is, path, StandardCopyOption.REPLACE_EXISTING);
        }

        gymClass.setCoverImage(fileName);
        gymClassRepository.save(gymClass);
    }

    private void saveImages(GymClass gymClass, MultipartFile[] images) throws Exception {

        if (images == null || images.length==0) return;

        String uploadDir = "uploads/classes/";
        Files.createDirectories(Paths.get(uploadDir));

        for (MultipartFile file : images) {

            if (file == null || file.isEmpty()) continue;

            // ✅ Size validation (5MB প্রতি image)
            if (file.getSize() > 5 * 1024 * 1024) {
                throw new RuntimeException("Each image must be less than 5MB");
            }

            String fileName = UUID.randomUUID() + "_" + sanitizeFileName(file.getOriginalFilename());

            Path path = Paths.get(uploadDir, fileName);

            try (InputStream is = file.getInputStream()) {
                Files.copy(is, path, StandardCopyOption.REPLACE_EXISTING);
            }

            ClassImage img = new ClassImage();
            img.setImageUrl(fileName);
            img.setGymClass(gymClass);

            classImageRepository.save(img);
        }
    }


private void saveSchedules(
        GymClass gymClass,
        List<DayOfWeek> days,
        List<LocalTime> startTimes,
        List<LocalTime> endTimes
){

    if(days == null || days.isEmpty()) return;

    gymClass.getSchedules().clear();

    for(int i = 0; i < days.size(); i++){

        //  safety check
        if(startTimes.size() <= i || endTimes.size() <= i) continue;

        ClassSchedule schedule = new ClassSchedule();

        schedule.setDay(days.get(i));
        schedule.setStartTime(startTimes.get(i));
        schedule.setEndTime(endTimes.get(i));
        schedule.setGymClass(gymClass);

        gymClass.getSchedules().add(schedule);
    }
}

}
