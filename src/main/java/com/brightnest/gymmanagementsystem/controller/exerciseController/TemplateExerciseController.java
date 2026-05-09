package com.brightnest.gymmanagementsystem.controller.exerciseController;

import com.brightnest.gymmanagementsystem.service.exerciseService.MemberRoutineService;
import com.brightnest.gymmanagementsystem.service.exerciseService.RoutineTemplateExerciseService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class TemplateExerciseController {

    private final RoutineTemplateExerciseService exerciseService;

    @PostMapping("/trainer/template/exercise/add")
    public String addExercise(

            @RequestParam UUID templateDayId,
            @RequestParam UUID exerciseId,
            @RequestParam int sets,
            @RequestParam int reps,
            @RequestParam int duration,
            @RequestParam(required = false) String notes,
            RedirectAttributes redirectAttributes) {

        try {

            exerciseService.addExercise(
                    templateDayId,
                    exerciseId,
                    sets,
                    reps,
                    duration,
                    notes
            );

            redirectAttributes.addFlashAttribute(
                    "success",
                    "Exercise added successfully"
            );

        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    e.getMessage()
            );
        }

        return "redirect:/trainer/template";
    }

}