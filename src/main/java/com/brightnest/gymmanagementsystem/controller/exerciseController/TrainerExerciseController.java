package com.brightnest.gymmanagementsystem.controller.exerciseController;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class TrainerExerciseController {

    private final ExerciseService exerciseService;

        // LIST (only own exercises)
        @GetMapping("/trainer/exercise")
        public String list(Model model,
                           Principal principal,
                           @RequestParam(defaultValue = "0") int page) {

            Pageable pageable = PageRequest.of(page, 7);

            Page<Exercise> exerciseList =
                    exerciseService.getAllExercisesForTrainerView(pageable);

            model.addAttribute("exerciseList", exerciseList.getContent());
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", exerciseList.getTotalPages());
            model.addAttribute("principal", principal.getName());

            return "trainer/exercise/exerciseList";
        }

        // CREATE FORM
        @GetMapping("/trainer/exercise/create")
        public String createForm() {
            return "trainer/exercise/create-exercise";
        }
    @PostMapping("/trainer/exercise/create")
    public String createExercise(
            @RequestParam String name,
            @RequestParam String description,
            @RequestParam String warning,
            @RequestParam(required = false) List<MultipartFile> images,
            @RequestParam(required = false) List<String> videoUrls,
            @RequestParam(defaultValue = "false") boolean active,
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
        return "redirect:/trainer/exercise";
    }


        // EDIT FORM ⭐ (own only)
        @GetMapping("/trainer/exercise/edit/{id}")
        public String editForm(@PathVariable UUID id,
                               Principal principal,
                               Model model) {

            model.addAttribute("exercise",
                    exerciseService.getExerciseForTrainer(id, principal.getName()));

            return "trainer/exercise/update-exercise";
        }
    // ================= UPDATE =================
    @PostMapping("/trainer/exercise/edit/{id}")
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
        return "redirect:/trainer/exercise";
    }
    // ================= DETAILS =================
    @GetMapping("/trainer/exercise/{id}")
    public String details(@PathVariable UUID id,
                          Principal principal,
                          Model model) {

        Exercise exercise =
                exerciseService.getExerciseByIdForUser(id);

        boolean isOwner =
                exercise.getCreatedBy() != null &&
                        exercise.getCreatedBy().getEmail().equals(principal.getName());

        model.addAttribute("exercise", exercise);
        model.addAttribute("isOwner", isOwner);

        return "trainer/exercise/details-exercise";
    }


    // ================= DELETE =================
    @GetMapping("/trainer/exercise/delete/{id}")
    public String delete(@PathVariable UUID id,
                         Principal principal,
                         RedirectAttributes redirectAttributes) {

        exerciseService.deleteExerciseById(id, principal.getName());

        redirectAttributes.addFlashAttribute("message", "Exercise deleted successfully!");
        return "redirect:/trainer/exercise";
    }

}
