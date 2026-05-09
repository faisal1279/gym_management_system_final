package com.brightnest.gymmanagementsystem.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
import java.util.Map;


@NoArgsConstructor
@Data
@AllArgsConstructor
@ToString
public class MemberDashboardDTO {
    private String fullName;
    private String email;
    private String trainerName;

    private String membershipName;
    private LocalDate startDate;
    private LocalDate endDate;
    private long daysLeft;

    private double totalPaid;
    private double dueAmount;
    private LocalDate lastPaymentDate;

    private long monthlyAttendance;
    private Map<String, Long> attendanceChart;
}
