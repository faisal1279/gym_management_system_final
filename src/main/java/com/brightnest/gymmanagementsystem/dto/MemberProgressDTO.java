package com.brightnest.gymmanagementsystem.dto;

import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
import java.util.UUID;

@NoArgsConstructor
@Data
@AllArgsConstructor
@ToString
public class MemberProgressDTO {
    private UUID memberId;
    private String memberName;

    private double starWeight;
    private double currentWeight;
    private double bmi;
    private double bodyFat;


    private int totalClass;
    private int presentDays;
    private int absentDays;
    private double attendancePercentage;


    private String membershipPlan;
    private LocalDate endDate;
    private long remainingDays;

    private double totalPayment;


}
