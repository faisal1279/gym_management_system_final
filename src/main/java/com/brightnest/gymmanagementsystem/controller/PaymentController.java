package com.brightnest.gymmanagementsystem.controller;


import com.brightnest.gymmanagementsystem.model.Member;
import com.brightnest.gymmanagementsystem.model.Payment;
import com.brightnest.gymmanagementsystem.model.User;
import com.brightnest.gymmanagementsystem.repository.MemberRepository;
import com.brightnest.gymmanagementsystem.repository.PaymentRepository;
import com.brightnest.gymmanagementsystem.repository.UserRepository;
import com.brightnest.gymmanagementsystem.service.MemberService;
import com.brightnest.gymmanagementsystem.service.PaymentService;
import com.brightnest.gymmanagementsystem.service.SSLCommerzService;
import com.brightnest.gymmanagementsystem.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class PaymentController {

    private final SSLCommerzService sslCommerzService;
    private final UserService userService;
    private final PaymentService paymentService;
    private final MemberService memberService;
    private final PaymentRepository paymentRepository;
    private final MemberRepository memberRepository;

    @GetMapping("/admin/payments")
    public String payments(Model model, Principal principal) {
        model.addAttribute("revenue", paymentService.monthlyRevenue());
        model.addAttribute("members", memberService.getUnpaidOrExpiredMembers()); // make sure dueAmount is included
        return "admin/paymentDashboard";
    }
@PostMapping("/admin/payments")
public String makePayment(@RequestParam UUID memberId,
                          @RequestParam double amount,
                          @RequestParam String method,
                          RedirectAttributes redirectAttributes) {

    try{
        paymentService.makePayment(memberId, amount, method);
        redirectAttributes.addFlashAttribute("success","Payment successful!");
    }catch (Exception e){
        redirectAttributes.addFlashAttribute("error",e.getMessage());
    }

    return "redirect:/admin/payments";
}

    //member payments details page
    @GetMapping("/admin/members/{memberId}/payments")
    public String viewMemberPayments(@PathVariable UUID memberId,
                                     Model model) {

        Member member = memberService.getMemberById(memberId);

        List<Payment> payments =
                paymentService.getPaymentsByMember(memberId);

        model.addAttribute("member", member);
        model.addAttribute("payments", payments);

        return "admin/member-payment";
    }
    //edit payment form get
    @GetMapping("/admin/payments/edit/{id}")
    public String editPayment(@PathVariable UUID id, Model model) {

        Payment payment = paymentService.getPaymentById(id);

        model.addAttribute("payment", payment);

        return "admin/edit-payment";
    }
    //edit payment
    @PostMapping("/admin/payments/update")
    public String updatePayment(@RequestParam UUID paymentId,
                                @RequestParam double amount,
                                @RequestParam String method,RedirectAttributes redirectAttributes) {

        try{
            paymentService.updatePayment(paymentId, amount, method);
            redirectAttributes.addFlashAttribute("success","Payment successful!");
        }catch (Exception e){
            redirectAttributes.addFlashAttribute("error",e.getMessage());
        }


        return "redirect:/admin/payments";
    }



    //add online payments
    // ================= START PAYMENT =================

    @PostMapping("/member/payment/{membershipId}")
    public String payMembership(
            @PathVariable UUID membershipId,
            Principal principal
    ) {

        String gatewayUrl =
                sslCommerzService.initPayment(
                        membershipId,
                        principal.getName()
                );

        return "redirect:" + gatewayUrl;
    }

    // ================= SUCCESS =================

//    @PostMapping("/payment/success")
//    public String paymentSuccess(
//            @RequestParam Map<String, String> payload
//    ) {
//
//        String email = payload.get("value_a");
//
//        User user = userService.getUserByEmail(email);
//
//        if(user == null){
//            throw new RuntimeException("User not found");
//        }
//
//        Member member = memberService.getMemberByUser(user);
//
//        double amount =
//                Double.parseDouble(payload.get("amount"));
//
//        paymentService.makePayment(
//                member.getMemberId(),
//                amount,
//                "SSLCommerz"
//        );
//
//        return "redirect:/member/payment-success";
//    }

//    @PostMapping("/payment/success")
//    public String paymentSuccess(@RequestParam Map<String, String> payload) {
//
//        String tranId = payload.get("tran_id");   // 🔥 FIX
//        String email = payload.get("value_a");
//
//        User user = userService.getUserByEmail(email);
//
//        Member member = memberService.getMemberByUser(user);
//
//        // 🔥 find payment
//        Payment payment = paymentRepository.findById(UUID.fromString(tranId))
//                .orElseThrow(() -> new RuntimeException("Payment not found"));
//
//        // update payment
//        payment.setSuccess(true);
//        payment.setPaymentDate(LocalDate.now());
//        paymentRepository.save(payment);
//
//        // 🔥 ACTIVATE MEMBER (IMPORTANT PART)
//        LocalDate start = LocalDate.now();
//
//        member.setStartDate(start);
//        member.setEndDate(
//                start.plusDays(member.getMembership().getDurationInDays())
//        );
//
//        member.setActive(true);
//        memberRepository.save(member);
//
//        return "redirect:/member/payment-success";
//    }
@PostMapping("/payment/success")
public String paymentSuccess(
        @RequestParam Map<String, String> payload,
        RedirectAttributes redirectAttributes
) {

    try {

        String transactionId = payload.get("tran_id");

        Payment payment = paymentRepository
                .findByTransactionId(transactionId)
                .orElseThrow(() ->
                        new RuntimeException("Payment not found"));

        // already processed
        if(payment.isSuccess()){

            return "redirect:/member/payment-success";
        }

        // IMPORTANT
        paymentService.makePayment(
                payment.getMember().getMemberId(),
                payment.getAmount(),
                "SSLCommerz"
        );

        // update transaction success
        payment.setSuccess(true);

        paymentRepository.save(payment);

        redirectAttributes.addFlashAttribute(
                "success",
                "Payment successful!"
        );

        return "redirect:/member/payment-success";

    } catch (Exception ex){

        ex.printStackTrace();

        return "redirect:/member/payment-failed";
    }
}
    @GetMapping("/member/payment-success")
    public String paymentSuccess() {
        return "payment-success";
    }

    // ================= FAIL =================

    @PostMapping("/payment/fail")
    public String paymentFail() {

        return "redirect:/member/payment-failed";
    }

    // ================= CANCEL =================

    @PostMapping("/payment/cancel")
    public String paymentCancel() {

        return "redirect:/member/payment-cancel";
    }

}
