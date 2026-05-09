//package com.brightnest.gymmanagementsystem.service;
//
//import com.brightnest.gymmanagementsystem.model.User;
//import com.brightnest.gymmanagementsystem.model.provideClass.ClassTime;
//import com.brightnest.gymmanagementsystem.model.provideClass.ProvideClass;
//import com.brightnest.gymmanagementsystem.model.provideClass.ProvideClassImage;
//import com.brightnest.gymmanagementsystem.model.trainer.Trainer;
//import com.brightnest.gymmanagementsystem.repository.TrainerRepository;
//import com.brightnest.gymmanagementsystem.repository.UserRepository;
//import com.brightnest.gymmanagementsystem.repository.providerClass.ProvideClassImageRepository;
//import com.brightnest.gymmanagementsystem.repository.providerClass.ProvideClassRepository;
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Service;
//import org.springframework.web.multipart.MultipartFile;
//
//import java.io.InputStream;
//import java.nio.file.Files;
//import java.nio.file.Path;
//import java.nio.file.Paths;
//import java.nio.file.StandardCopyOption;
//import java.time.DayOfWeek;
//import java.time.LocalDateTime;
//import java.time.LocalTime;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.UUID;
//
//@Service
//@RequiredArgsConstructor
//public class ProvideClassService {
//
//    private final ProvideClassRepository provideClassRepository;
//    private final ProvideClassImageRepository provideClassImageRepository;
//    private final UserRepository userRepository;
//    private final TrainerRepository trainerRepository;
//    private final ProvideClassImageRepository previousProvideClassImageRepository;
//
//    private static final long MAX_FILE_SIZE = 5 * 1024 * 1024; //5mb
//
//    public void createClass(
////            String name,
////            String level,
//            int duration,
////            int capacity,
////            String shortDesc,
////            String description,
//            MultipartFile coverImage,
//            List<MultipartFile> images,
//            UUID trainerId,
//            List<DayOfWeek> days,
//            List<LocalTime> startTimes,
//            List<LocalTime> endTimes,
//            boolean active,
//            String email
//    ){
//        //admin check
//        User user = userRepository.findByEmail(email);
//        if(user == null || !"ROLE_ADMIN".equals(user.getRole())){
//            throw new RuntimeException("Access denied");
//        }
//
//        //create class
//        ProvideClass provideClass = new ProvideClass();
////        provideClass.setName(name);
////        provideClass.setLevel(level);
//        provideClass.setDuration(duration);
////        provideClass.setCapacity(capacity);
////        provideClass.setShortDescription(shortDesc);
////        provideClass.setDescription(description);
//        provideClass.setActive(active);
//        provideClass.setCreatedAt(LocalDateTime.now());
//
//        if(trainerId != null){
//            Trainer trainer = trainerRepository.findById(trainerId)
//                    .orElseThrow(() -> new RuntimeException("Trainer not found"));
//            provideClass.setTrainer(trainer);
//        }
//
//        //save first
//        ProvideClass saved = provideClassRepository.save(provideClass);
//
//        //schedule time
//
//        saveSchedules(saved,days,startTimes,endTimes);
//
//        try{
//            saveCoverImage(saved,coverImage);
//            saveImages(saved,images);
//        }catch (Exception e){
//            throw new RuntimeException("Image upload failed" + e.getMessage());
//        }
//
//    }
//    private void saveSchedules(ProvideClass saved, List<DayOfWeek> days, List<LocalTime> startTimes, List<LocalTime> endTimes) {
//        if (days == null || days.isEmpty()) return;
//        for (int i = 0; i< days.size(); i++){
//            if (startTimes == null || endTimes == null) continue;
//            if (startTimes.size() != endTimes.size()) continue;
//
//            ClassTime classTime = new ClassTime();
//
//            classTime.setDay(days.get(i));
//            classTime.setStartTime(startTimes.get(i));
//            classTime.setEndTime(endTimes.get(i));
//            classTime.setProvideClass(saved);
//
//            saved.getClassTimeList().add(classTime);
//        }
//    }
//    private void saveCoverImage(ProvideClass saved, MultipartFile file) throws Exception{
//        if (file == null || file.isEmpty()) return;
//        if (file.getSize() > MAX_FILE_SIZE) {
//         throw new RuntimeException("File is too large");
//        }
//
//        String uploadDir = "uploads/provideClasses/";
//        Files.createDirectories(Paths.get(uploadDir));
//
//        String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
//
//        Path path = Paths.get(uploadDir , fileName);
//
//        try (InputStream is = file.getInputStream()){
//            Files.copy(is, path, StandardCopyOption.REPLACE_EXISTING);
//        }
//        saved.setCoverImage(fileName);
//    }
//    private void saveImages(ProvideClass saved, List<MultipartFile> images) throws Exception{
//        if (images == null || images.isEmpty()) return;
//
//        String uploadDir = "uploads/provideClasses/";
//        Files.createDirectories(Paths.get(uploadDir));
//
//        for (MultipartFile file : images){
//            if (file == null || file.isEmpty()) continue;
//
//            if (file.getSize() > MAX_FILE_SIZE) {
//                throw new RuntimeException("File is too large");
//            }
//
//            String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
//            Path path = Paths.get(uploadDir , fileName);
//
//            try (InputStream is = file.getInputStream()){
//                Files.copy(is, path, StandardCopyOption.REPLACE_EXISTING);
//            }
//
//            ProvideClassImage provideClassImage = new ProvideClassImage();
//            provideClassImage.setImageUrl(fileName);
//            provideClassImage.setProvideClass(saved);
//
//            provideClassImageRepository.save(provideClassImage);
//        }
//    }
//
//}
