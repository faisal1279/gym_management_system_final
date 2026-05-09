package com.brightnest.gymmanagementsystem.service.exerciseService;


import com.brightnest.gymmanagementsystem.dto.TrainerExerciseTableDTO;
import com.brightnest.gymmanagementsystem.model.exerciseModel.*;
import com.brightnest.gymmanagementsystem.repository.exerciseRepository.RoutineTemplateRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TrainerRoutineTableService {
    private final RoutineTemplateRepository templateRepository;

public List<TrainerExerciseTableDTO> getTrainerTable() {

    List<TrainerExerciseTableDTO> list = new ArrayList<>();

    List<RoutineTemplate> templates = templateRepository.findAll();

    for (RoutineTemplate template : templates) {

        for (RoutineTemplateDay day : template.getDays()) { // day.getDay() is correct

            for (RoutineTemplateExercise rte : day.getExercises()) {

                Exercise e = rte.getExercise();

                // Map ExerciseImage to List<String>
                List<String> images = e.getImages().stream()
                        .map(ExerciseImage::getImageUrl) // make sure ExerciseImage has getImageUrl()
                        .toList();

                // Map ExerciseVideo to List<String>
                List<String> youtubeLinks = e.getVideos().stream()
                        .map(ExerciseVideo::getVideoUrl) // make sure ExerciseVideo has getVideoUrl()
                        .toList();

                TrainerExerciseTableDTO dto = new TrainerExerciseTableDTO(
                        e.getExerciseId(),
                        e.getName(),
                        template.getLevel(),
                        day.getDay().name(), // DayOfWeek as string
                        rte.getSets(),
                        rte.getReps(),
                        images,
                        youtubeLinks,
                        e.getDescription(),
                        e.getWarning()
                );

                list.add(dto);
            }

        }

    }

    return list;
}
}
