package com.brightnest.gymmanagementsystem.service.exerciseService;

import com.brightnest.gymmanagementsystem.model.exerciseModel.Exercise;
import com.brightnest.gymmanagementsystem.model.exerciseModel.ExerciseImage;
import com.brightnest.gymmanagementsystem.model.exerciseModel.ExerciseVideo;
import com.brightnest.gymmanagementsystem.model.User;
import com.brightnest.gymmanagementsystem.repository.exerciseRepository.ExerciseImageRepository;
import com.brightnest.gymmanagementsystem.repository.exerciseRepository.ExerciseRepository;
import com.brightnest.gymmanagementsystem.repository.exerciseRepository.ExerciseVideoRepository;
import com.brightnest.gymmanagementsystem.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ExerciseService {
    private final ExerciseRepository exerciseRepository;
    private final UserRepository userRepository;
    private final ExerciseImageRepository exerciseImageRepository;
    private final ExerciseVideoRepository exerciseVideoRepository;

    // Admin create exercise
    public void createExercise(
            String name,
            String description,
            String warning,
            List<MultipartFile> images,
            List<String> videoUrls,
            String email,
            boolean active
    ) {

        User user = userRepository.findByEmail(email);

        if (user == null) {
            throw new RuntimeException("User not found");
        }

        if (!user.getRole().equals("ROLE_ADMIN")
                && !user.getRole().equals("ROLE_TRAINER")) {
            throw new RuntimeException("Only admin or trainer can update exercise");
        }

        Exercise exercise = new Exercise();
        exercise.setName(name);
        exercise.setDescription(description);
        exercise.setWarning(warning);
        exercise.setActive(active);
        exercise.setCreatedBy(user);
        exercise.setCreatedAt(LocalDateTime.now());

        Exercise savedExercise = exerciseRepository.save(exercise);

        try {
            saveImage(savedExercise, images);
        } catch (Exception e) {
            throw new RuntimeException("Image upload failed");
        }

        saveVideo(savedExercise, videoUrls);

    }

    private void saveImage(
            Exercise exercise,
            List<MultipartFile> images
    ) throws Exception {

        if (images == null || images.isEmpty()) {
            return;
        }

        String uploadDir = "uploads/exercises/";
        Files.createDirectories(Paths.get(uploadDir));

        for (MultipartFile file : images) {

            if (file.isEmpty()) continue;

            String fileName =
                    UUID.randomUUID() + "_" + file.getOriginalFilename();

            Path path = Paths.get(uploadDir , fileName);

            Files.write(path, file.getBytes());

            ExerciseImage image = new ExerciseImage();
            image.setImageUrl(fileName);
            image.setExercise(exercise);

            exerciseImageRepository.save(image);
        }
    }

    private void saveVideo(
            Exercise exercise,
            List<String> videoUrls
    ) {

        if (videoUrls == null || videoUrls.isEmpty()) {
            return;
        }

        for (String url : videoUrls) {

            if (url == null || url.isBlank()) continue;

            ExerciseVideo video = new ExerciseVideo();
            video.setVideoUrl(url);
            video.setExercise(exercise);

            exerciseVideoRepository.save(video);
        }
    }
    //get all exercise
    public Page<Exercise> getAllExercise(Pageable pageable) {

        return exerciseRepository.findByActiveTrue(pageable);
    }

    public Page<Exercise> searchExercises(String keyword, Boolean active, Pageable pageable) {

        if (keyword == null) keyword = "";

        return exerciseRepository.searchExercises(keyword, active, pageable);
    }

//    // get exercise by id
//    public Exercise getExerciseById(UUID id) {
//        return exerciseRepository.findById(id).filter(Exercise::isActive).orElseThrow(() -> new RuntimeException("Exercise not found"));
//    }

    public Exercise getExerciseByIdForAdmin(UUID id) {
        return exerciseRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Exercise not found"));
    }

    public Exercise getExerciseByIdForUser(UUID id) {
        return exerciseRepository.findById(id)
                .filter(Exercise::isActive)
                .orElseThrow(() -> new RuntimeException("Exercise not found"));
    }

    //Delete exercise
    public void deleteExerciseById(UUID id, String email) {

        User user = userRepository.findByEmail(email);

        Exercise exercise = exerciseRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Exercise not found"));

        boolean isAdmin = "ROLE_ADMIN".equals(user.getRole());
        boolean isOwner = exercise.getCreatedBy() != null
                && exercise.getCreatedBy().getId().equals(user.getId());

        if (!isAdmin && !isOwner) {
            throw new RuntimeException("You can only delete your own exercise");
        }

        exercise.setActive(false);
        exerciseRepository.save(exercise);
    }
    //update exercise
    public void updateExercise(
            UUID id,
            String name,
            String description,
            String warning,
            List<MultipartFile> images,
            List<String> videoUrls,
            String email,
            Boolean active
    ) {

        User user = userRepository.findByEmail(email);

        if (user == null) {
            throw new RuntimeException("User not found");
        }

        if (!user.getRole().equals("ROLE_ADMIN")
                && !user.getRole().equals("ROLE_TRAINER")) {
            throw new RuntimeException("Only admin or trainer can update exercise");
        }

        Exercise exercise = exerciseRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Exercise not found"));

        exercise.setName(name);
        exercise.setDescription(description);
        exercise.setWarning(warning);

        if (active != null) {
            exercise.setActive(active);
        }

        Exercise savedExercise = exerciseRepository.save(exercise);

        try {
            saveImage(savedExercise, images);
        } catch (Exception e) {
            throw new RuntimeException("Image upload failed");
        }

        saveVideo(savedExercise, videoUrls);
    }

    public Page<Exercise> getAllExercisesForTrainerView(Pageable pageable) {
        return exerciseRepository.findAll(pageable);
    }

    public Exercise getExerciseForTrainer(UUID id, String email) {

        User user = userRepository.findByEmail(email);

        Exercise exercise = exerciseRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Exercise not found"));

        if (!exercise.getCreatedBy().getId().equals(user.getId())) {
            throw new RuntimeException("Access denied");
        }

        return exercise;
    }

    //Public site
    public Page<Exercise> getPublicExercises(Pageable pageable) {
        return exerciseRepository.findByActiveTrue(pageable);
    }
    public Exercise getPublicExerciseById(UUID id) {
        return exerciseRepository.findById(id)
                .filter(Exercise::isActive)
                .orElseThrow(() -> new RuntimeException("Exercise not found"));
    }
}
