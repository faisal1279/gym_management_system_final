package com.brightnest.gymmanagementsystem.service.exerciseService;

import com.brightnest.gymmanagementsystem.model.exerciseModel.RoutineTemplate;
import com.brightnest.gymmanagementsystem.model.trainer.Trainer;
import com.brightnest.gymmanagementsystem.repository.exerciseRepository.RoutineTemplateRepository;
import com.brightnest.gymmanagementsystem.repository.TrainerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class RoutineTemplateService {
    private final RoutineTemplateRepository routineTemplateRepository;
    private final TrainerRepository trainerRepository;

    public void createTemplate(String name,String level,String trainerEmail) {

        Trainer trainer = trainerRepository.findByUser_Email(trainerEmail).orElseThrow(()->new RuntimeException("trainer not found"));

        RoutineTemplate routineTemplate = new RoutineTemplate();
        routineTemplate.setName(name);
        routineTemplate.setLevel(level);
        routineTemplate.setTrainer(trainer);
        routineTemplate.setActive(true);
        routineTemplateRepository.save(routineTemplate);
    }

    public List<RoutineTemplate> getTrainerTemplates(String trainerEmail) {

        Trainer trainer = trainerRepository.findByUser_Email(trainerEmail).orElseThrow(()->new RuntimeException("trainer not found"));

        return routineTemplateRepository.findByTrainerAndActiveTrue(trainer);
    }

    public RoutineTemplate getTemplate(UUID templateId) {

        return routineTemplateRepository.findById(templateId)
                .orElseThrow(() ->
                        new RuntimeException("Template not found"));
    }

    public List<RoutineTemplate> getAllTemplates() {

        return routineTemplateRepository.findAll();
    }

}
