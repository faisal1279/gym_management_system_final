package com.brightnest.gymmanagementsystem.controller.websiteController;


import com.brightnest.gymmanagementsystem.model.exerciseModel.Exercise;
import com.brightnest.gymmanagementsystem.service.exerciseService.ExerciseService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class PublicExerciseController {
    private final ExerciseService exerciseService;

    // ================= LIST PAGE =================
    @GetMapping("/blog/exercises")
    public String exerciseList(Model model,
                               @RequestParam(defaultValue = "0") int page) {

        Pageable pageable = PageRequest.of(page, 9);

        Page<Exercise> exercises = exerciseService.getPublicExercises(pageable);

        model.addAttribute("exercises", exercises.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", exercises.getTotalPages());

        return "website/blog/exercise";
    }

    // ================= DETAILS PAGE =================
    @GetMapping("/blog/exercises/{id}")
    public String exerciseDetails(@PathVariable UUID id,
                                  Model model) {

        Exercise exercise = exerciseService.getPublicExerciseById(id);

        model.addAttribute("exercise", exercise);

        return "website/blog/exercise-details";
    }
}
