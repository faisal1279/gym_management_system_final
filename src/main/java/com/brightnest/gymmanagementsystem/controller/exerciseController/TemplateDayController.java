package com.brightnest.gymmanagementsystem.controller.exerciseController;

import com.brightnest.gymmanagementsystem.service.exerciseService.RoutineTemplateDayService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.DayOfWeek;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class TemplateDayController {

    private final RoutineTemplateDayService routineTemplateDayService;

    @PostMapping("/trainer/template/day/add")
    public String addDay(
            @RequestParam UUID templateId,
            @RequestParam DayOfWeek day,
            RedirectAttributes redirectAttributes) {

        try {

            routineTemplateDayService.addDay(templateId, day);

            redirectAttributes.addFlashAttribute(
                    "success",
                    "Day added successfully"
            );

        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    e.getMessage()
            );
        }

        return "redirect:/trainer/template/details/" + templateId;
    }
}
