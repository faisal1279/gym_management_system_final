package com.brightnest.gymmanagementsystem.controller;

import com.brightnest.gymmanagementsystem.dto.MemberDashboardDTO;
import com.brightnest.gymmanagementsystem.model.Member;
import com.brightnest.gymmanagementsystem.model.trainer.Trainer;
import com.brightnest.gymmanagementsystem.service.AttendanceService;
import com.brightnest.gymmanagementsystem.service.MemberService;
import com.brightnest.gymmanagementsystem.service.PaymentService;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.time.YearMonth;

@Controller
public class MemberController {

    private final MemberService memberService;
    private final AttendanceService attendanceService;
    private final PaymentService paymentService;


    public MemberController(MemberService memberService, AttendanceService attendanceService, PaymentService paymentService) {
        this.memberService = memberService;
        this.attendanceService = attendanceService;
        this.paymentService = paymentService;
    }

    @GetMapping("/member/dashboard")
    public String memberDashboard(Model model,Principal principal) {

        Member member = memberService
                .getMemberByUserEmail(principal.getName());

        MemberDashboardDTO dto =
                memberService.getDashboard(member.getMemberId());

        model.addAttribute("data", dto);
        return "member/member-dashboard";
    }
    @GetMapping("/member/attendance")
    public String myAttendance(Model model, @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM")YearMonth month, Principal principal) {

        Member member = memberService.getMemberByUserEmail(principal.getName());

        YearMonth selectedMonth = month != null ? month : YearMonth.now();

        model.addAttribute("attendanceList",attendanceService.getMonthlyAttendanceByMember(member, selectedMonth));

        model.addAttribute("percentage",attendanceService.getMonthlyAttendancePercentage(member, selectedMonth));

        model.addAttribute("month",selectedMonth);
        return "member/my-attendance";
    }
    @GetMapping("/member/trainer")
    public String myTrainer(Model model, Principal principal) {

        Trainer trainer = memberService.getTrainerForMember(principal.getName());

        model.addAttribute("trainer",trainer);
        return "member/my-trainer";
    }
    @GetMapping("/member/membership")
    public String myMembership(Model model, Principal principal) {
        Member member = memberService.getMemberByUserEmail(principal.getName());

        model.addAttribute("member",member);
        model.addAttribute("daysLeft",memberService.getRemainingDays(member));
        model.addAttribute("expired",memberService.isMembershipExpired(member));

        return "member/my-membership-details";
    }
    @GetMapping("/member/payments")
    public String paymentHistory(Model model, Principal principal) {
        model.addAttribute("payments",memberService.getPaymentsForMember(principal.getName()));

        return "member/payment-history";
    }
}
