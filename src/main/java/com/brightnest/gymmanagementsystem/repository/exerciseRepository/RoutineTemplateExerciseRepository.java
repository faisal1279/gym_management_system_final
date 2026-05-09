package com.brightnest.gymmanagementsystem.repository.exerciseRepository;

import com.brightnest.gymmanagementsystem.model.exerciseModel.RoutineTemplateExercise;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface RoutineTemplateExerciseRepository extends JpaRepository<RoutineTemplateExercise, UUID> {
}
