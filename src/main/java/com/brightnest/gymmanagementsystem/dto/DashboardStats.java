package com.brightnest.gymmanagementsystem.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Map;

@NoArgsConstructor
@Data
@AllArgsConstructor
@ToString
public class DashboardStats {

        private long totalUsers;
        private long totalMembers;
        private long totalTrainers;
        private long todayAttendance;
        private double monthlyRevenue;

        private Map<String, Double> revenueChart;
        private Map<String, Long> memberGrowthChart;
        private Map<String, Long> attendanceChart;

    private Map<String, Double> paymentMethodChart;

        // getters & setters

}
