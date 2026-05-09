package com.brightnest.gymmanagementsystem.repository.exerciseRepository;

import com.brightnest.gymmanagementsystem.model.exerciseModel.RoutineTemplate;
import com.brightnest.gymmanagementsystem.model.exerciseModel.RoutineTemplateDay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.DayOfWeek;
import java.util.List;
import java.util.UUID;
@Repository
public interface RoutineTemplateDayRepository extends JpaRepository<RoutineTemplateDay, UUID> {
    boolean existsByTemplateAndDay(RoutineTemplate template, DayOfWeek day);
    List<RoutineTemplateDay> findByTemplate_Id(UUID templateId);
}
