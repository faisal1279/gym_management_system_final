package com.brightnest.gymmanagementsystem.service.exerciseService;

import com.brightnest.gymmanagementsystem.model.exerciseModel.Exercise;
import com.brightnest.gymmanagementsystem.model.exerciseModel.RoutineTemplateDay;
import com.brightnest.gymmanagementsystem.model.exerciseModel.RoutineTemplateExercise;
import com.brightnest.gymmanagementsystem.repository.exerciseRepository.ExerciseRepository;
import com.brightnest.gymmanagementsystem.repository.exerciseRepository.RoutineTemplateDayRepository;
import com.brightnest.gymmanagementsystem.repository.exerciseRepository.RoutineTemplateExerciseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class RoutineTemplateExerciseService {

    private final RoutineTemplateExerciseRepository exerciseRepository;
    private final RoutineTemplateDayRepository dayRepository;
    private final ExerciseRepository exerciseRepo;

    public void addExercise(

            UUID templateDayId,
            UUID exerciseId,
            int sets,
            int reps,
            int duration,
            String notes){

        RoutineTemplateDay day = dayRepository.findById(templateDayId)
                .orElseThrow(() ->
                        new RuntimeException("Template day not found"));

        Exercise exercise = exerciseRepo.findById(exerciseId)
                .filter(Exercise::isActive)
                .orElseThrow(() ->
                        new RuntimeException("Exercise not found"));

        RoutineTemplateExercise routineExercise =
                new RoutineTemplateExercise();

        routineExercise.setTemplateDay(day);
        routineExercise.setExercise(exercise);
        routineExercise.setSets(sets);
        routineExercise.setReps(reps);
        routineExercise.setDuration(duration);
        routineExercise.setNotes(notes);

        exerciseRepository.save(routineExercise);
    }
}
