package com.brightnest.gymmanagementsystem.service;

import com.brightnest.gymmanagementsystem.model.Member;
import com.brightnest.gymmanagementsystem.model.Payment;
import com.brightnest.gymmanagementsystem.repository.MemberRepository;
import com.brightnest.gymmanagementsystem.repository.PaymentRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RequiredArgsConstructor
@Service
public class PaymentService {
    private final PaymentRepository paymentRepository;
    private final MemberRepository memberRepository;
    @Transactional
    public void makePayment(UUID memberId, double paidAmount, String method) {

        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new RuntimeException("Member not found"));

        double currentDue = member.getDueAmount();

        if(currentDue <= 0){
            throw new RuntimeException("This member has no due.");
        }

        if(paidAmount <= 0){
            throw new RuntimeException("Invalid payment amount.");
        }

        if(paidAmount > currentDue){
            throw new RuntimeException("Amount cannot exceed remaining due.");
        }

        // Save payment
        Payment payment = new Payment();
        payment.setMember(member);
        payment.setAmount(paidAmount);
        payment.setMethod(method);
        payment.setPaymentDate(LocalDate.now());
        payment.setSuccess(true);
        paymentRepository.save(payment);

        double newDue = currentDue - paidAmount;
        member.setDueAmount(newDue);

        // First time activation
        if(member.getStartDate() == null){
            activateOrRenewMembership(member);
        }

        member.setActive(true);

        memberRepository.save(member);
    }
    //payment details page
    public List<Payment> getPaymentsByMember(UUID memberId) {
        return paymentRepository
                .findByMemberMemberId(memberId);
    }
    //get payment id
    public Payment getPaymentById(UUID id) {
        return paymentRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid Payment ID"));
    }
    //update payment
    @Transactional
    public void updatePayment(UUID paymentId, double newAmount, String method) {

        Payment payment = paymentRepository.findById(paymentId)
                .orElseThrow(() -> new RuntimeException("Payment not found"));

        Member member = payment.getMember();

        double oldAmount = payment.getAmount();

        if (newAmount <= 0) {
            throw new RuntimeException("Invalid amount");
        }

        // Difference calculate
        double difference = newAmount - oldAmount;

        double updatedDue = member.getDueAmount() - difference;

        if (updatedDue < 0) {
            throw new RuntimeException("Amount exceeds allowed limit");
        }

        // Update payment
        payment.setAmount(newAmount);
        payment.setMethod(method);
        paymentRepository.save(payment);

        // Update member due
        member.setDueAmount(updatedDue);
        memberRepository.save(member);
    }
    /**
     * Renew or activate membership dates
     * Only called after full payment
     */
    private void activateOrRenewMembership(Member member) {
        LocalDate today = LocalDate.now();
        LocalDate startDate = today;

        // If current membership active, renew from end date
        if (member.getEndDate() != null && member.getEndDate().isAfter(today)) {
            startDate = member.getEndDate().plusDays(1);
        }

        LocalDate endDate = startDate.plusDays(member.getMembership().getDurationInDays());

        member.setStartDate(startDate);
        member.setEndDate(endDate);
    }
    public double monthlyRevenue(){
        LocalDate start =  LocalDate.now().withDayOfMonth(1);

        LocalDate end = LocalDate.now();

        return paymentRepository
                .findAllByPaymentDateBetween(start,end)
                .stream()
                .mapToDouble(Payment::getAmount)
                .sum();
    }

    //========================admin dashboard====================
    public Map<String, Double> last6MonthsRevenue() {

        Map<String, Double> data = new LinkedHashMap<>();

        for(int i = 5; i >= 0; i--){
            YearMonth ym = YearMonth.now().minusMonths(i);

            double revenue = paymentRepository
                    .sumRevenueByMonth(ym.getMonthValue(), ym.getYear());

            data.put(ym.getMonth().toString(), revenue);
        }

        return data;
    }
    //for admin dashboard
    public Map<String, Double> getPaymentMethodChart() {

        List<Object[]> results =
                paymentRepository.paymentMethodDistribution();

        Map<String, Double> data = new LinkedHashMap<>();

        if(results != null){
            for(Object[] row : results){

                String method = row[0] != null ? row[0].toString() : "UNKNOWN";
                Double total = row[1] != null
                        ? ((Number) row[1]).doubleValue()
                        : 0.0;

                data.put(method, total);
            }
        }

        return data;
    }
}
