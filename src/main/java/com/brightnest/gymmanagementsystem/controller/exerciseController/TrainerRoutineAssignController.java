package com.brightnest.gymmanagementsystem.controller.exerciseController;

import com.brightnest.gymmanagementsystem.model.Member;
import com.brightnest.gymmanagementsystem.model.exerciseModel.RoutineTemplate;
import com.brightnest.gymmanagementsystem.service.MemberService;
import com.brightnest.gymmanagementsystem.service.exerciseService.MemberRoutineService;
import com.brightnest.gymmanagementsystem.service.exerciseService.RoutineTemplateService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class TrainerRoutineAssignController {

    private final MemberRoutineService memberRoutineService;
    private final MemberService memberService;
    private final RoutineTemplateService routineTemplateService;

    @GetMapping("/trainer/member/{id}/assign")
    public String assignRoutinePage(@PathVariable UUID id, Model model) {

        Member member = memberService.getMemberById(id);

        List<RoutineTemplate> templates =
                routineTemplateService.getAllTemplates();

        model.addAttribute("member", member);
        model.addAttribute("templates", templates);

        return "trainer/trainer-exercise/assign-routine";
    }
    @PostMapping("/trainer/member/assign-routine")
    public String assignRoutine(

            @RequestParam UUID memberId,
            @RequestParam UUID templateId,
            RedirectAttributes redirectAttributes) {

        try {

            memberRoutineService.assignRoutine(
                    memberId,
                    templateId
            );

            redirectAttributes.addFlashAttribute(
                    "success",
                    "Routine assigned to member"
            );

        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "error",
                    e.getMessage()
            );
        }

        return "redirect:/trainer/members";
    }

}
