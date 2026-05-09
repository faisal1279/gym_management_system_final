package com.brightnest.gymmanagementsystem.controller.exerciseController;

import com.brightnest.gymmanagementsystem.dto.TrainerExerciseTableDTO;
import com.brightnest.gymmanagementsystem.model.exerciseModel.RoutineTemplate;
import com.brightnest.gymmanagementsystem.model.exerciseModel.RoutineTemplateDay;
import com.brightnest.gymmanagementsystem.service.exerciseService.ExerciseService;
import com.brightnest.gymmanagementsystem.service.exerciseService.RoutineTemplateDayService;
import com.brightnest.gymmanagementsystem.service.exerciseService.RoutineTemplateService;
import com.brightnest.gymmanagementsystem.service.exerciseService.TrainerRoutineTableService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.security.Principal;
import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class TrainerTemplateController {
    private final RoutineTemplateService routineTemplateService;
    private final RoutineTemplateDayService dayService;
    private final ExerciseService exerciseService;
    private final TrainerRoutineTableService  trainerRoutineTableService;

    //Template list page
    @GetMapping("/trainer/template")
    public String templates(Model model, Principal principal) {
        model.addAttribute("templates",routineTemplateService.getTrainerTemplates(principal.getName()));

        return "trainer/trainer-exercise/trainer-template-list";
    }
    // Create template
    @PostMapping("/trainer/template")
    public String createTemplate(
            @RequestParam String name,
            @RequestParam String level,
            Principal principal,
            RedirectAttributes redirectAttributes) {

        try {

            routineTemplateService.createTemplate(
                    name,
                    level,
                    principal.getName()
            );

            redirectAttributes.addFlashAttribute(
                    "success",
                    "Routine template created successfully"
            );

        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    e.getMessage()
            );
        }

        return "redirect:/trainer/template";
    }

    @GetMapping("/trainer/template/details/{templateId}")
    public String templateDetails(
            @PathVariable UUID templateId,
            Model model, Pageable pageable) {

        model.addAttribute(
                "template",
                routineTemplateService.getTemplate(templateId)
        );

        model.addAttribute(
                "days",
                dayService.getDaysByTemplate(templateId)
        );

        model.addAttribute(
                "exercises",
                exerciseService.getAllExercise(pageable)
        );

        return "trainer/trainer-exercise/template-details";
    }
@GetMapping("/trainer/exercise/details/{exerciseId}")
public String viewDetails(
        @PathVariable UUID exerciseId,
        Model model) {

    TrainerExerciseTableDTO row =
            trainerRoutineTableService.getTrainerTable()
                    .stream()
                    .filter(r -> r.getExerciseId().equals(exerciseId))
                    .findFirst()
                    .orElseThrow(() ->
                            new RuntimeException("Exercise not found"));

    // Get first YouTube link if exists
    String embedUrl = row.getYoutubeLink() != null && !row.getYoutubeLink().isEmpty()
            ? row.getYoutubeLink().getFirst().replace("watch?v=", "embed/")
            : null;

    model.addAttribute("row", row);
    model.addAttribute("videoUrl", embedUrl);

    return "trainer/trainer-exercise/exercise-details";
}

    @GetMapping("/trainer/template/view/{templateId}")
    public String viewTemplateCalendar(
            @PathVariable UUID templateId,
            Model model){

        RoutineTemplate template =
                routineTemplateService.getTemplate(templateId);

        List<RoutineTemplateDay> days =
                dayService.getDaysByTemplate(templateId);

        model.addAttribute("template", template);
        model.addAttribute("days", days);

        return "trainer/trainer-exercise/template-calendar";
    }
}
