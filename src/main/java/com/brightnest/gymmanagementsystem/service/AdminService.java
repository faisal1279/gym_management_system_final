package com.brightnest.gymmanagementsystem.service;

import com.brightnest.gymmanagementsystem.dto.DashboardStats;
import com.brightnest.gymmanagementsystem.model.User;
import com.brightnest.gymmanagementsystem.repository.AdminRepository;
import com.brightnest.gymmanagementsystem.repository.MemberRepository;
import com.brightnest.gymmanagementsystem.repository.TrainerRepository;
import com.brightnest.gymmanagementsystem.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class AdminService {
    private final UserRepository userRepository;

//    public Page<User> getAllUsers(Pageable pageable) {
//        return userRepository.findByRoleNot("ROLE_ADMIN",pageable);
//    }
public Page<User> searchUsers(String keyword, String role, Pageable pageable) {
    return userRepository.searchUsers(keyword, role, pageable);
}


    private final MemberRepository memberRepository;
    private final TrainerRepository trainerRepository;
    private final AttendanceService attendanceService;
    private final PaymentService paymentService;
    private final MemberService memberService;

    public DashboardStats getDashboardStats() {

        DashboardStats stats = new DashboardStats();

        stats.setTotalUsers(userRepository.count());
        stats.setTotalMembers(memberRepository.count());
        stats.setTotalTrainers(trainerRepository.count());
        stats.setTodayAttendance(attendanceService.todayAttendance());
        stats.setMonthlyRevenue(paymentService.monthlyRevenue());

        stats.setRevenueChart(paymentService.last6MonthsRevenue());
        stats.setPaymentMethodChart(
                paymentService.getPaymentMethodChart()
        );

//        stats.setMemberGrowthChart(
//                memberService.memberGrowthLast6Months()
//        );
//        stats.setAttendanceChart(
//                attendanceService.last7DaysAttendance()
//        );

        return stats;
    }

    public long totalUsers(){
        return userRepository.count();
    }
    public long totalMembers(){
        return userRepository.count();
    }
    public long totalTrainers(){
        return userRepository.count();
    }
}
