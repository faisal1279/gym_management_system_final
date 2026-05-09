package com.brightnest.gymmanagementsystem.service;

import com.brightnest.gymmanagementsystem.dto.MemberAdminView;
import com.brightnest.gymmanagementsystem.dto.MemberDashboardDTO;
import com.brightnest.gymmanagementsystem.model.*;
import com.brightnest.gymmanagementsystem.model.trainer.Trainer;
import com.brightnest.gymmanagementsystem.repository.*;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.TextStyle;
import java.time.temporal.ChronoUnit;
import java.util.*;

@RequiredArgsConstructor
@Service
public class MemberService {
    private final MemberRepository memberRepository;
    private final TrainerRepository trainerRepository;
    private final UserRepository userRepository;
    private final MembershipRepository membershipRepository;
    private final PaymentRepository paymentRepository;
    private final AttendanceRepository attendanceRepository;

    //create member
    public void createMember(UUID userId,
                             UUID membershipId,
                             double weight,
                             double height) {
        User user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("user not found"));

        if(memberRepository.findByUser_Id(userId).isPresent()) {
            throw new RuntimeException("Member already exists");
        }
        Membership membership = membershipRepository.findById(membershipId)
                        .orElseThrow(() -> new RuntimeException("Membership not found"));
        user.setRole("ROLE_MEMBER");
        userRepository.save(user);

        Member member = new Member();
        member.setUser(user);
        member.setMembership(membership);
        member.setStartDate(null);
        member.setEndDate(null);
        member.setInitialWeight(weight);
        member.setHeight(height);

        member.setDueAmount(member.getMembership().getPrice());
        member.setActive(false);
        memberRepository.save(member);
    }

    @Transactional
    public Member createMemberForOnlinePayment(
            User user,
            Membership membership
    ) {

        Optional<Member> existingMember =
                memberRepository.findByUser(user);

        // already exists
        if(existingMember.isPresent()) {

            Member member = existingMember.get();

            member.setMembership(membership);

            member.setDueAmount(membership.getPrice());

            return memberRepository.save(member);
        }

        // update role
        user.setRole("ROLE_MEMBER");

        userRepository.save(user);

        // create member
        Member member = new Member();

        member.setUser(user);

        member.setMembership(membership);

        member.setStartDate(null);

        member.setEndDate(null);

        member.setDueAmount(membership.getPrice());

        member.setActive(false);

        // default values
        member.setHeight(0);

        member.setInitialWeight(0);

        return memberRepository.save(member);
    }
    //Assign Trainer to specific member
    public void assignTrainer(UUID memberId, UUID trainerId) {
        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new RuntimeException("member not found"));

        Trainer trainer = trainerRepository.findById(trainerId)
                .orElseThrow(() -> new RuntimeException("trainer not found"));

        if(!trainer.isActive()) {
            throw new RuntimeException("Cannot assign inactive trainer");
        }

        member.setTrainer(trainer);
        memberRepository.save(member);
    }

    public List<Member> getAllMembers() {
        return memberRepository.findAll();
    }

    public Member getMemberById(UUID id) {
        return memberRepository.findById(id).orElseThrow(() -> new RuntimeException("member not found"));
    }

    //admin view members list by trainer
    public Page<Member> getMembersByTrainer(UUID trainerId, Pageable pageable) {
        return memberRepository.findByTrainer_TrainerId(trainerId,pageable);
    }
    public void removeTrainer(UUID memberId) {
        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new RuntimeException("member not found"));
        member.setTrainer(null);
        memberRepository.save(member);
    }

    //membership active check
    public boolean isMembershipActive(Member member){
        LocalDate today = LocalDate.now();

        return member.getStartDate() != null
                && member.getEndDate() != null
                && !today.isBefore(member.getStartDate())
                && !today.isAfter(member.getEndDate());
    }

//public Page<MemberAdminView> getMembersForAdmin(Pageable pageable) {
//
//    Page<Member> members = memberRepository.findAll(pageable);
//    LocalDate today = LocalDate.now();
//
//    return members.map(m -> {
//        boolean active = isMembershipActive(m);
//
//        long daysLeft = 0;
//        if (active) {
//            daysLeft = ChronoUnit.DAYS.between(today, m.getEndDate());
//        }
//
//        return new MemberAdminView(m, active, daysLeft);
//    });
//}

    public Page<MemberAdminView> searchMembersForAdmin(
            String keyword,
            Boolean active,
            String paymentStatus,
            Pageable pageable) {

        if (keyword == null) keyword = "";

        Page<Member> members =
                memberRepository.searchMembers(keyword, paymentStatus, pageable);

        LocalDate today = LocalDate.now();

        Page<MemberAdminView> result = members.map(m -> {

            boolean isActive = isMembershipActive(m);
            boolean isPaid = m.getDueAmount() == 0;

            long daysLeft = 0;
            if (isActive) {
                daysLeft = ChronoUnit.DAYS.between(today, m.getEndDate());
            }

            return new MemberAdminView(
                    m,
                    isActive,
                    isPaid,
                    daysLeft
            );
        });

        // 🔥 apply active filter without breaking Page
        if (active != null) {
            List<MemberAdminView> filtered = result.getContent().stream()
                    .filter(mv -> mv.isActive() == active)
                    .toList();

            return new PageImpl<>(filtered, pageable, filtered.size());
        }

        return result;
    }

    //show due amount member and expired member in payment dashboard
    public List<Member> getUnpaidOrExpiredMembers() {
        return memberRepository
                .findByDueAmountGreaterThanOrEndDateBefore(
                        0,
                        LocalDate.now()
                );
    }

    public List<Member> getActiveMembers(){
        LocalDate today = LocalDate.now();

        return memberRepository.findAll().stream()
                .filter(m ->
                        m.getEndDate() != null &&
                        !today.isAfter(m.getEndDate())
                ).toList();
    }

    //======================Trainer=================================
    //for trainer,get active members by trainer
    public List<Member> getActiveMembersByTrainer(UUID trainerId,Pageable pageable) {
        LocalDate today = LocalDate.now();
        return memberRepository.findByTrainer_TrainerId(trainerId,pageable)
        .stream()
                .filter(m->m.getEndDate() != null && !today.isAfter(m.getEndDate())
                )
                .toList();
    }


    public Member getMemberByUser(User user){
        return memberRepository.findByUser(user).orElseThrow(() -> new RuntimeException("member not found"));
    }

    //================For member========================
    public Member getMemberByUserEmail(String email) {
        return memberRepository.findByUser_Email(email).orElseThrow(() -> new RuntimeException("member not found"));
    }
    public Trainer getTrainerForMember(String Email){
        Member member = memberRepository.findByUser_Email(Email).orElseThrow(() -> new RuntimeException("member not found"));

        if(member.getTrainer() == null){
            return null;
        }
        return member.getTrainer();
    }
    public long getRemainingDays(Member member){
        if(member.getEndDate() == null) return 0;

        return ChronoUnit.DAYS.between(member.getStartDate(), member.getEndDate());
    }

    public boolean isMembershipExpired(Member member){
        return member.getEndDate() == null || member.getEndDate().isBefore(LocalDate.now());
    }
    public List<Payment> getPaymentsForMember(String email){
        Member member = memberRepository.findByUser_Email(email).orElseThrow(() -> new RuntimeException("member not found"));

        return paymentRepository.findByMember(member);
    }

    //============for admin dashboard=====================
    public Map<String, Long> memberGrowthLast6Months() {

        LocalDate startDate = LocalDate.now()
                .minusMonths(5)
                .withDayOfMonth(1);

        List<Object[]> results =
                memberRepository.memberGrowthData(startDate);

        Map<String, Long> data = new LinkedHashMap<>();

        for (Object[] row : results) {

            int year = ((Number) row[0]).intValue();
            int month = ((Number) row[1]).intValue();
            long count = ((Number) row[2]).longValue();

            YearMonth ym = YearMonth.of(year, month);

            data.put(
                    ym.getMonth()
                            .getDisplayName(TextStyle.SHORT, Locale.ENGLISH),
                    count
            );
        }

        return data;
    }

//    get member count by trainer
public long getMemberCount(UUID trainerId) {
    return memberRepository.countByTrainer_TrainerId(trainerId);
}
    //======================== for member dashboard ================================
//    public MemberDashboardDTO getDashboard(UUID userId){
//
//        Member member = memberRepository
//                .findByUserId(userId)
//                .orElseThrow();
//
//        MemberDashboardDTO dto = new MemberDashboardDTO();
//
//        dto.setFullName(member.getUser().getFirstName() + " "
//                + member.getUser().getLastName());
//
//        dto.setEmail(member.getUser().getEmail());
//
//        dto.setMembershipName(member.getMembership().getName());
//        dto.setStartDate(member.getStartDate());
//        dto.setEndDate(member.getEndDate());
//
//        long daysLeft = ChronoUnit.DAYS.between(
//                LocalDate.now(),
//                member.getEndDate());
//
//        dto.setDaysLeft(daysLeft > 0 ? daysLeft : 0);
//
//        dto.setDueAmount(member.getDueAmount());
//
//        dto.setTotalPaid(
//                paymentRepository.totalPaidByMember(member.getMemberId())
//        );
//
//        dto.setLastPaymentDate(
//                paymentRepository.lastPaymentDate(member.getMemberId())
//        );
//
//        dto.setMonthlyAttendance(
//                attendanceRepository.monthlyAttendanceCount(member.getMemberId())
//        );
//
//        return dto;
//    }
//    public MemberDashboardDTO getDashboard(UUID memberId){
//
//        Member member = memberRepository
//                .findById(memberId)
//                .orElseThrow(() ->
//                        new RuntimeException("Member not found"));
//
//        MemberDashboardDTO dto = new MemberDashboardDTO();
//
//        dto.setFullName(member.getUser().getFirstName() + " "
//                + member.getUser().getLastName());
//
//        dto.setEmail(member.getUser().getEmail());
//        dto.setMembershipName(member.getMembership().getName());
//        dto.setStartDate(member.getStartDate());
//        dto.setEndDate(member.getEndDate());
//
////        long daysLeft = ChronoUnit.DAYS.between(
////                LocalDate.now(),
////                member.getEndDate());
//
//        if(member.getStartDate() == null || member.getEndDate() == null){
//            dto.setDaysLeft(0);
//            dto.setDueAmount(member.getDueAmount());
//            return dto;
//        }
//
////        dto.setDaysLeft(Math.max(daysLeft, 0));
//
//        dto.setDueAmount(member.getDueAmount());
//
//        dto.setTotalPaid(
//                paymentRepository.totalPaidByMember(member.getMemberId())
//        );
//
//        dto.setLastPaymentDate(
//                paymentRepository.lastPaymentDate(member.getMemberId())
//        );
//
//        dto.setMonthlyAttendance(
//                attendanceRepository.monthlyAttendanceCount(member.getMemberId())
//        );
//
//        return dto;
//    }

public MemberDashboardDTO getDashboard(UUID memberId){

    Member member = memberRepository
            .findById(memberId)
            .orElseThrow(() ->
                    new RuntimeException("Member not found"));

    MemberDashboardDTO dto = new MemberDashboardDTO();

    dto.setFullName(member.getUser().getFirstName() + " "
            + member.getUser().getLastName());

    dto.setEmail(member.getUser().getEmail());
    dto.setMembershipName(member.getMembership().getName());
    dto.setStartDate(member.getStartDate());
    dto.setEndDate(member.getEndDate());

    // ================= FIXED PART ONLY =================
    long daysLeft = 0;

    if (member.getStartDate() != null && member.getEndDate() != null) {
        daysLeft = ChronoUnit.DAYS.between(
                LocalDate.now(),
                member.getEndDate()
        );
    }

    dto.setDaysLeft(Math.max(daysLeft, 0));

    // ================= REST SAME =================
    dto.setDueAmount(member.getDueAmount());

    dto.setTotalPaid(
            paymentRepository.totalPaidByMember(member.getMemberId())
    );

    dto.setLastPaymentDate(
            paymentRepository.lastPaymentDate(member.getMemberId())
    );

    dto.setMonthlyAttendance(
            attendanceRepository.monthlyAttendanceCount(member.getMemberId())
    );

    return dto;
}
}
