package com.brightnest.gymmanagementsystem.controller.exerciseController;

import com.brightnest.gymmanagementsystem.model.exerciseModel.Exercise;
import com.brightnest.gymmanagementsystem.service.exerciseService.ExerciseService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class AdminExerciseController {
    private final ExerciseService exerciseService;

    @GetMapping("/admin/exercise")
    public String listExercises(
            @RequestParam(defaultValue = "") String keyword,
            @RequestParam(required = false) Boolean active,
            @RequestParam(defaultValue = "0") int page,
            Model model) {

        Pageable pageable = PageRequest.of(page, 7);

        Page<Exercise> exerciseList =
                exerciseService.searchExercises(keyword, active, pageable);

        model.addAttribute("exerciseList", exerciseList.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", exerciseList.getTotalPages());

        model.addAttribute("keyword", keyword);
        model.addAttribute("active", active);

        return "admin/exercise/exerciseList";
    }

    @GetMapping("/admin/exercises/create")
    public String createExercisePage() {
        return "admin/exercise/create-exercise";
    }

    @PreAuthorize("@permissionService.hasPermission(authentication,'EXERCISE_EDIT')")
    @PostMapping("/admin/exercises/create")
    public String createExercise(
            @RequestParam String name,
            @RequestParam String description,
            @RequestParam String warning,
            @RequestParam(defaultValue = "false") boolean active,
            @RequestParam(required = false) List<MultipartFile> images,
            @RequestParam(required = false) List<String> videoUrls,
            Principal principal,
            RedirectAttributes redirectAttributes) {

        exerciseService.createExercise(
                name,
                description,
                warning,
                images,
                videoUrls,
                principal.getName(),
                active
        );

        redirectAttributes.addFlashAttribute("message", "Exercise created successfully!");
        return "redirect:/admin/exercise";
    }

    @GetMapping("/admin/exercises/update/{id}")
    public String editForm(@PathVariable UUID id, Model model) {

        model.addAttribute("exercise",
                exerciseService.getExerciseByIdForAdmin(id));

        return "admin/exercise/update-exercise";
    }

    @PostMapping("/admin/exercises/update/{id}")
    public String updateExercise(
            @PathVariable UUID id,
            @RequestParam String name,
            @RequestParam String description,
            @RequestParam String warning,
            @RequestParam(required = false) List<MultipartFile> images,
            @RequestParam(required = false) List<String> videoUrls,
            @RequestParam(required = false) Boolean active,
            Principal principal,
            RedirectAttributes redirectAttributes) {

        exerciseService.updateExercise(
                id,
                name,
                description,
                warning,
                images,
                videoUrls,
                principal.getName(),
                active
        );

        redirectAttributes.addFlashAttribute("message", "Exercise updated successfully!");

        return "redirect:/admin/exercise";
    }

    @GetMapping("/admin/exercise/{id}")
    public String detailsExercise(@PathVariable UUID id, Model model) {
        model.addAttribute("exercise", exerciseService.getExerciseByIdForAdmin(id));
        return "admin/exercise/details-exercise";
    }
    @GetMapping("/admin/exercises/delete/{id}")
    public String deleteExercise(@PathVariable UUID id,
                                 Principal principal,
                                 RedirectAttributes redirectAttributes) {

        exerciseService.deleteExerciseById(id, principal.getName());

        redirectAttributes.addFlashAttribute("message", "Exercise deleted successfully!");
        return "redirect:/admin/exercise";
    }
}
