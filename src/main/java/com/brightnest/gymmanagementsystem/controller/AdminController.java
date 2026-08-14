package com.brightnest.gymmanagementsystem.controller;

import com.brightnest.gymmanagementsystem.dto.DashboardStats;
import com.brightnest.gymmanagementsystem.dto.MemberAdminView;
import com.brightnest.gymmanagementsystem.model.Member;
import com.brightnest.gymmanagementsystem.model.trainer.Trainer;
import com.brightnest.gymmanagementsystem.model.User;
import com.brightnest.gymmanagementsystem.service.*;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RequiredArgsConstructor
@Controller
public class AdminController {
    private final AdminService adminService;
    private final UserService userService;
    private final TrainerService trainerService;
    private final MemberService memberService;
    private final MembershipService membershipService;
    private final AttendanceService attendanceService;
    private final PaymentService paymentService;

    @GetMapping("/admin/dashboard")
    public String dashboard(Model model) {

        DashboardStats stats =
                adminService.getDashboardStats();

        model.addAttribute("stats", stats);

        return "admin/admin-dashboard";
    }


@GetMapping("/admin/users")
public String userDashboardPage(
        @RequestParam(defaultValue = "") String keyword,
        @RequestParam(required = false) String role,
        @RequestParam(defaultValue = "0") int page,
        Model model) {

    Pageable pageable = PageRequest.of(page, 5);

    Page<User> userPage = adminService.searchUsers(keyword, role, pageable);

    model.addAttribute("users", userPage.getContent());
    model.addAttribute("currentPage", page);
    model.addAttribute("totalPages", userPage.getTotalPages());

    model.addAttribute("keyword", keyword);
    model.addAttribute("role", role);

    return "admin/allUsers";
}
    //form for making user to trainer
    @GetMapping("/admin/users/{id}/make-trainer")
    public String makeTrainerDashboardPage(Model model, @PathVariable UUID id) {
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("trainer",new Trainer());
        return "admin/makeTrainer";
    }
    @PostMapping("/admin/users/{id}/make-trainer")
    public String makeTrainer(
            @PathVariable UUID id,
            @RequestParam int experienceYears,
            @RequestParam String specialization,
            @RequestParam int salary,
            @RequestParam(required = false) String bio,
            @RequestParam(required = false) List<String> skills,
            @RequestParam(required = false) List<Integer> skillPercentages,
            @RequestParam(required = false) List<String> achievements,
            RedirectAttributes redirectAttributes) {

        try {

            if (experienceYears < 0 || salary < 0) {
                throw new RuntimeException("Invalid experience or salary");
            }

            trainerService.createTrainer(
                    id,
                    experienceYears,
                    specialization,
                    salary,
                    bio,
                    skills != null ? skills : new ArrayList<String>(),
                    skillPercentages != null ? skillPercentages : new ArrayList<Integer>(),
                    achievements != null ? achievements : new ArrayList<String>()
            );

            redirectAttributes.addFlashAttribute("success",
                    "Trainer created successfully");

            return "redirect:/admin/trainers";

        } catch (Exception ex) {

            redirectAttributes.addFlashAttribute("error", ex.getMessage());
            return "redirect:/admin/users";
        }
    }
    //View all trainers list with info like name,email


    @GetMapping("/admin/trainers")
    public String trainerList(
            @RequestParam(defaultValue = "") String keyword,
            @RequestParam(required = false) Boolean active,
            @RequestParam(defaultValue = "0") int page,
            Model model) {

        Pageable pageable = PageRequest.of(page, 2);

        Page<Trainer> trainers = trainerService.searchTrainers(keyword, active, pageable);

        // add member count
        trainers.forEach(t ->
                t.setMemberCount(
                        memberService.getMemberCount(t.getTrainerId())
                )
        );

        model.addAttribute("trainers", trainers.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", trainers.getTotalPages());

        model.addAttribute("keyword", keyword);
        model.addAttribute("active", active);

        return "admin/trainerList";
    }


    // View trainer details
    @GetMapping("/admin/trainers/{id}")
    public String viewTrainer(@PathVariable UUID id, Model model) {
        Trainer trainer = trainerService.getTrainerById(id);
        model.addAttribute("trainer", trainer);
        return "admin/trainer-details";
    }
    //for editing trainer info form
    @GetMapping("/admin/trainers/edit/{id}")
    public String editTrainerPage(Model model, @PathVariable UUID id) {
        Trainer trainer = trainerService.getTrainerById(id);
        model.addAttribute("trainer",trainer);
        return "admin/editTrainer-page";
    }

    @PostMapping("/admin/trainers/edit/{id}")
    public String updateTrainer(
            @PathVariable UUID id,
            @RequestParam int experienceYears,
            @RequestParam String specialization,
            @RequestParam int salary,
            @RequestParam(required = false) String bio,
            @RequestParam(required = false) List<String> skills,
            @RequestParam(required = false) List<Integer> skillPercentages,
            @RequestParam(required = false) List<String> achievements,
            RedirectAttributes redirectAttributes) {

        try {

            if (experienceYears < 0 || salary < 0) {
                throw new RuntimeException("Invalid data provided");
            }

            trainerService.updateTrainer(
                    id,
                    experienceYears,
                    specialization,
                    salary,
                    bio,
                    skills != null ? skills : new ArrayList<String>(),
                    skillPercentages != null ? skillPercentages : new ArrayList<Integer>(),
                    achievements != null ? achievements : new ArrayList<String>()
            );

            redirectAttributes.addFlashAttribute("success",
                    "Trainer updated successfully");

        } catch (Exception ex) {

            redirectAttributes.addFlashAttribute("error", ex.getMessage());
        }

        return "redirect:/admin/trainers";
    }
    //update trainer activate and deactivate
    @PostMapping("/admin/trainers/toggle/{id}")
    public String toggleTrainerPage(@PathVariable UUID id,RedirectAttributes redirectAttributes) {
        try{
            boolean active = trainerService.toggleTrainer(id);
            redirectAttributes.addFlashAttribute("message", active ? "Trainer activated successfully" : "Trainer deactivated successfully");
        }catch (Exception ex){
            redirectAttributes.addFlashAttribute("error", ex.getMessage());
        }
        return "redirect:/admin/trainers";
    }


    @GetMapping("/admin/members")
    public String membersListPage(
            @RequestParam(defaultValue = "") String keyword,
            @RequestParam(required = false) Boolean active,
            @RequestParam(required = false) String paymentStatus,
            @RequestParam(defaultValue = "0") int page,
            Model model) {

        int pageSize = 1;

        Pageable pageable = PageRequest.of(page, pageSize);

        Page<MemberAdminView> members =
                memberService.searchMembersForAdmin(
                        keyword,
                        active,
                        paymentStatus,
                        pageable
                );

        model.addAttribute("members", members.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", members.getTotalPages());
        model.addAttribute("totalItems", members.getTotalElements());

        model.addAttribute("keyword", keyword);
        model.addAttribute("active", active);
        model.addAttribute("paymentStatus", paymentStatus);

        return "admin/membersListPage";
    }

    //form for making member
    @GetMapping("/admin/users/{id}/make-member")
    public String showMakeMemberForm(@PathVariable UUID id,Model model) {
        User user = userService.getUserById(id);
        model.addAttribute("user",user);
        model.addAttribute("memberships", membershipService.getAllActiveMemberships());
        return "admin/makeMember-page";
    }
    //make member
    @PostMapping("/admin/users/{id}/make-member")
    public String makeMember(RedirectAttributes redirectAttributes,@PathVariable UUID id, @RequestParam UUID membershipId,@RequestParam double weight,@RequestParam double height){
        try{
            memberService.createMember(id, membershipId, weight, height);
            redirectAttributes.addFlashAttribute("message", "Member created successfully");
        }catch (Exception ex){
            redirectAttributes.addFlashAttribute("error", ex.getMessage());
        }
        return "redirect:/admin/members";
    }
    //Form for member to assigning trainer
    @GetMapping("/admin/members/{id}/assign-trainer")
    public String assignTrainerForm(Model model, @PathVariable UUID id) {
        model.addAttribute("member",memberService.getMemberById(id));
        model.addAttribute("trainers",trainerService.getActiveTrainers());
        return "admin/assignTrainer";
    }
    //Assign trainer
    @PostMapping("/admin/members/{id}/assign-trainer")
    public String doAssignTrainer(@PathVariable UUID id, @RequestParam UUID trainerId, RedirectAttributes redirectAttributes) {
        try{
            memberService.assignTrainer(id, trainerId);
            redirectAttributes.addFlashAttribute("message", "Trainer assigned successfully");
        }catch (Exception ex){
            redirectAttributes.addFlashAttribute("error", ex.getMessage());
        }
        return  "redirect:/admin/members";
    }
    //View members list under the trainer
    @GetMapping("/admin/trainers/{id}/members")
    public String trainerMembersByAdmin(@PathVariable UUID id,Model model,@RequestParam(defaultValue = "0") int page) {
        Trainer trainer = trainerService.getTrainerById(id);
        Pageable pageable = PageRequest.of(page, 1);

        Page<Member> members = memberService.getMembersByTrainer(id,pageable);

        model.addAttribute("trainer",trainer);
        model.addAttribute("members",members.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", members.getTotalPages());
        model.addAttribute("trainerId", id);


        return "admin/trainer-members";
    }
    //remove trainer from member
    @PostMapping("/admin/members/{id}/remove-trainer")
    public String removeTrainer(@PathVariable UUID id,RedirectAttributes redirectAttributes) {
        try{
            memberService.removeTrainer(id);
        }catch (Exception ex){
            redirectAttributes.addFlashAttribute("error", ex.getMessage());
        }
        redirectAttributes.addFlashAttribute("message", "Trainer removed successfully");
        return "redirect:/admin/members";
    }

    @GetMapping("/admin/reports")
    public String reports(Model model){
        model.addAttribute("revenue",
                paymentService.monthlyRevenue());
        model.addAttribute("attendance",
                attendanceService.todayAttendance());
        model.addAttribute("trainers",
                trainerService.getTrainerPerformance());
        return "admin/reports";
    }


}
