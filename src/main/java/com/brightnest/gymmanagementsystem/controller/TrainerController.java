package com.brightnest.gymmanagementsystem.controller;

import com.brightnest.gymmanagementsystem.model.Attendance;
import com.brightnest.gymmanagementsystem.model.Member;
import com.brightnest.gymmanagementsystem.model.MemberProgress;
import com.brightnest.gymmanagementsystem.model.trainer.Trainer;
import com.brightnest.gymmanagementsystem.repository.MemberRepository;
import com.brightnest.gymmanagementsystem.service.AttendanceService;
import com.brightnest.gymmanagementsystem.service.MemberService;
import com.brightnest.gymmanagementsystem.service.TrainerService;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.time.LocalDate;
import java.util.*;

@RequiredArgsConstructor
@Controller
public class TrainerController {
     private final TrainerService trainerService;
     private final MemberService memberService;
    private final AttendanceService attendanceService;
    private final MemberRepository memberRepository;

    //get dashboard page
    @GetMapping("/trainer/dashboard")
    public String trainerDashboardPage(Model model, Principal principal,Pageable pageable) {
        Trainer trainer = trainerService.getLoggedInTrainer(principal);

        long totalMembers = trainerService.getMemberCount(trainer.getTrainerId());
        long activeMembers = trainerService.getActiveMembersCount(trainer.getTrainerId());

        // Recent 5 member progress
        Page<Member> members = memberRepository.findByTrainer_TrainerId(trainer.getTrainerId(),pageable);
        List<Map<String,Object>> recentProgressList = new ArrayList<>();

        for(Member m : members) {
            MemberProgress latest = trainerService.getLatestProgress(m);
            if(latest != null) {
                Map<String,Object> map = new HashMap<>();
                map.put("name", m.getUser().getFirstName());
                map.put("startWeight", m.getInitialWeight());
                map.put("currentWeight", latest.getWeight());
                map.put("weightChange", latest.getWeight() - m.getInitialWeight());
                recentProgressList.add(map);
            }
        }

        recentProgressList.sort((a,b) -> Double.compare((Double)b.get("weightChange"), (Double)a.get("weightChange")));
        if(recentProgressList.size() > 5) recentProgressList = recentProgressList.subList(0,5);

        model.addAttribute("trainer", trainer);
        model.addAttribute("totalMembers", totalMembers);
        model.addAttribute("activeMembers", activeMembers);
        model.addAttribute("recentProgressList", recentProgressList);

        return "/trainer/trainer-dashboard";
    }
    //get member list for trainer
    @GetMapping("/trainer/members")
    public String myMembers(Model model, Principal principal, @RequestParam(defaultValue = "0") int page) {
        Trainer trainer = trainerService.getLoggedInTrainer(principal);
        Pageable pageable = PageRequest.of(page,1);
        Page<Member> members = memberService.getMembersByTrainer(trainer.getTrainerId(),pageable);

        model.addAttribute("members", members.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", members.getTotalPages());
        return "/trainer/my-members";
    }
    //view member details
    @GetMapping("/trainer/member/{id}/view")
    public String viewMember(
            @PathVariable UUID id,
            Model model) {

        Member member = memberService.getMemberById(id);

        model.addAttribute("member", member);
        System.out.println(member.toString());
        return "trainer/member-view";
    }
    //get attendance form and view
    @GetMapping("/trainer/attendance")
    public String trainerAttendancePage(Model model, Principal principal,Pageable pageable, @RequestParam(required = false) LocalDate date) {
        LocalDate selectedDate = (date != null) ? date : LocalDate.now();
        Trainer trainer = trainerService.getLoggedInTrainer(principal);

        Page<Member> members = memberService.getMembersByTrainer(trainer.getTrainerId(),pageable);

        List<Attendance> attendanceList = attendanceService.getAttendanceByDate(selectedDate);

        Map<UUID, Boolean> attendanceMap = new HashMap<>();

        for (Attendance attendance : attendanceList) {
            if(attendance.getMember().getTrainer() != null &&
                    attendance.getMember().getTrainer()
                            .getTrainerId().equals(trainer.getTrainerId())) {
                attendanceMap.put(attendance.getMember().getMemberId(),attendance.isPresent());
            }
        }

        model.addAttribute("date", selectedDate);
        model.addAttribute("members", members);
        model.addAttribute("attendanceList", attendanceList);
        model.addAttribute("attendanceMap", attendanceMap);

        return "/trainer/attendancePage";
     }
     //submit attendance for trainer
    @PostMapping("/trainer/attendance")
    public String submitTrainerAttendance(
            @RequestParam LocalDate date,
            @RequestParam Map<String,String> params,
            Principal principal,
            RedirectAttributes redirectAttributes, Pageable pageable){
        if(date.isAfter(LocalDate.now())){
            redirectAttributes.addFlashAttribute("error","Future attendance is not allowed");
            return "redirect:/trainer/attendance?date"+date;
        }
        Trainer trainer = trainerService.getLoggedInTrainer(principal);

        Map<UUID, Boolean> attendanceMap = new HashMap<>();

        memberService.getActiveMembersByTrainer(trainer.getTrainerId(),pageable)
                .forEach(m-> attendanceMap.put(m.getMemberId(), false));

        params.forEach((key,value)->{
            if(key.startsWith("present_")){
                UUID memberId = UUID.fromString(key.replace("present_",""));

                attendanceMap.put(memberId, value.equals("on"));
            }
        });

        attendanceService.markBulkAttendance(date,attendanceMap);

        redirectAttributes.addFlashAttribute("message","Attendance marked successfully");

        return "redirect:/trainer/attendance?date="+date;
    }
    //update attendance
    @PostMapping("/trainer/attendance/{id}/update")
    public String updateTrainerAttendance(
            @PathVariable UUID id,@RequestParam boolean present,Principal principal,RedirectAttributes redirectAttributes
    ){
        Trainer trainer = trainerService.getLoggedInTrainer(principal);

        trainerService.updateAttendanceByTrainer(id,present,trainer);
        redirectAttributes.addFlashAttribute("message","Attendance updated successfully");

        return "redirect:/trainer/attendance";
    }
    //view progress page
    @GetMapping("/trainer/progress")
    public String trainerProgressPage(Model model, Principal principal, Pageable  pageable) {
        Trainer trainer = trainerService.getLoggedInTrainer(principal);
        Page<Member> members =
                memberService.getMembersByTrainer(trainer.getTrainerId(),pageable);

        Map<UUID, MemberProgress> latestProgressMap = new HashMap<>();

        for(Member m : members){
            MemberProgress latest =
                    trainerService.getLatestProgress(m);
            latestProgressMap.put(m.getMemberId(), latest);
        }

        model.addAttribute("members", members);
        model.addAttribute("latestProgressMap", latestProgressMap);
        return "/trainer/progress-page";
    }
    //get specific member progress view
    @GetMapping("/trainer/members/{id}/progress")
    public String viewProgress(@PathVariable UUID id, Model model, Principal principal) {


        Member member = memberService.getMemberById(id);
        model.addAttribute("member", member);
        model.addAttribute("progressList", trainerService.getMemberProgress(id,principal));

        // Member progress list descending order by date
        List<MemberProgress> progressList =
                trainerService.getMemberProgress(id,principal);

        // Use initial weight as the previous value first
        double previousWeight = member.getInitialWeight();
        Map<UUID, Double> weightDiffMap = new HashMap<>();

        for (MemberProgress p : progressList) {
            double diff = p.getWeight() - previousWeight;
            weightDiffMap.put(p.getId(), diff);

            // Update previousWeight for next iteration
            previousWeight = p.getWeight();
        }
        model.addAttribute("weightChange", weightDiffMap);
        return "trainer/member-progress";
    }
    // add member progress (weight,bodyFat,notes)
    @PostMapping("/trainer/members/{id}/progress/add")
    public String addProgress(@PathVariable UUID id,
                              @RequestParam double weight,
                              @RequestParam double bodyFat,
                              @RequestParam String notes,
                              Principal principal) {

        trainerService.addMemberProgress(id, weight, bodyFat, notes, principal);
        return "redirect:/trainer/members/" + id + "/progress";
    }
    // get update form member progress (weight,bodyFat,notes)
    @GetMapping("/trainer/progress/{progressId}/edit")
    public String showEditForm(@PathVariable UUID progressId,
                               Model model,
                               Principal principal) {

        MemberProgress progress =
                trainerService.getMemberProgressById(progressId, principal);

        model.addAttribute("progress", progress);
        model.addAttribute("memberId",
                progress.getMember().getMemberId());

        return "trainer/edit-progress";
    }
    //update
    @PostMapping("/trainer/progress/{progressId}/update")
    public String updateProgress(@PathVariable UUID progressId,
                                 @RequestParam double weight,
                                 @RequestParam double bodyFat,
                                 @RequestParam String notes,
                                 @RequestParam UUID memberId,
                                 Principal principal) {

        trainerService.updateProgress(
                progressId,
                weight,
                bodyFat,
                notes,
                principal
        );

        return "redirect:/trainer/members/" + memberId + "/progress";
    }

    // delete member progress (weight,bodyFat,notes)
    @PostMapping("/trainer/progress/{progressId}/delete")
    public String deleteProgress(@PathVariable UUID progressId,
                                 @RequestParam UUID memberId,
                                 Principal principal) {

        trainerService.deleteProgress(progressId, principal);
        return "redirect:/trainer/members/" + memberId + "/progress";
    }

}
