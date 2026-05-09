package com.brightnest.gymmanagementsystem.controller.exerciseController;

import com.brightnest.gymmanagementsystem.model.Member;
import com.brightnest.gymmanagementsystem.model.exerciseModel.Exercise;
import com.brightnest.gymmanagementsystem.repository.MemberRepository;
import com.brightnest.gymmanagementsystem.repository.exerciseRepository.ExerciseRepository;
import com.brightnest.gymmanagementsystem.service.exerciseService.MemberRoutineService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class MemberRoutineController {
    private final MemberRoutineService memberRoutineService;
    private final MemberRepository memberRepository;
    private final ExerciseRepository exerciseRepository;

    @GetMapping("/member/routine")
    public String viewRoutine(
            Model model,
            Principal principal) {

        Member member = memberRepository
                .findByUser_Email(principal.getName())
                .orElseThrow(() ->
                        new RuntimeException("Member not found"));

        model.addAttribute(
                "routines",
                memberRoutineService.getMemberRoutine(
                        member.getMemberId()
                )
        );
        System.out.println(memberRoutineService.getMemberRoutine(member.getMemberId()));

        return "member/member-routine";
    }
    @GetMapping("/member/exercise/details/{id}")
    public String exerciseDetails(
            @PathVariable UUID id,
            @RequestParam int sets,
            @RequestParam int reps,
            Model model){

        Exercise exercise =
                exerciseRepository.findById(id)
                        .orElseThrow(() ->
                                new RuntimeException("Exercise not found"));

        List<String> videoUrls = exercise.getVideos()
                .stream()
                .map(v -> v.getVideoUrl().replace("watch?v=", "embed/") + "?autoplay=0")
                .toList();

        model.addAttribute("exercise", exercise);
        model.addAttribute("videoUrls", videoUrls); // multiple videos
        model.addAttribute("sets", sets);
        model.addAttribute("reps", reps);

        return "member/exercise-details";
    }

}
