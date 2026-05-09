package com.brightnest.gymmanagementsystem.repository.exerciseRepository;

import com.brightnest.gymmanagementsystem.model.exerciseModel.ExerciseVideo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface ExerciseVideoRepository extends JpaRepository<ExerciseVideo, UUID> {
}
