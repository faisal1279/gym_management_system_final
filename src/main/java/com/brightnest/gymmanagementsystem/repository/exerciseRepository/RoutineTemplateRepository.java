package com.brightnest.gymmanagementsystem.repository.exerciseRepository;

import com.brightnest.gymmanagementsystem.model.exerciseModel.RoutineTemplate;
import com.brightnest.gymmanagementsystem.model.trainer.Trainer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;
@Repository
public interface RoutineTemplateRepository extends JpaRepository<RoutineTemplate, UUID> {
    List<RoutineTemplate> findByTrainerAndActiveTrue(Trainer trainer);
}
