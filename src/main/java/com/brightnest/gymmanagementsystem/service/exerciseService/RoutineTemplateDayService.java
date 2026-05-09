package com.brightnest.gymmanagementsystem.service.exerciseService;

import com.brightnest.gymmanagementsystem.model.exerciseModel.RoutineTemplate;
import com.brightnest.gymmanagementsystem.model.exerciseModel.RoutineTemplateDay;
import com.brightnest.gymmanagementsystem.repository.exerciseRepository.RoutineTemplateDayRepository;
import com.brightnest.gymmanagementsystem.repository.exerciseRepository.RoutineTemplateRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.DayOfWeek;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class RoutineTemplateDayService {
    private final RoutineTemplateDayRepository dayRepository;
    private final RoutineTemplateRepository templateRepository;


    public void addDay(UUID templateId, DayOfWeek day){

        RoutineTemplate template = templateRepository.findById(templateId)
                .orElseThrow(() ->
                        new RuntimeException("Template not found"));

        boolean exists =
                dayRepository.existsByTemplateAndDay(template, day);

        if(exists){
            throw new RuntimeException("Day already exists");
        }

        RoutineTemplateDay routineDay = new RoutineTemplateDay();

        routineDay.setTemplate(template);
        routineDay.setDay(day);

        dayRepository.save(routineDay);
    }

    public List<RoutineTemplateDay> getDaysByTemplate(UUID templateId) {

        return dayRepository.findByTemplate_Id(templateId);
    }
}
