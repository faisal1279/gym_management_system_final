package com.brightnest.gymmanagementsystem.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
@Entity
@Table(name = "membersProgress")
public class MemberProgress {
    @Id
    @GeneratedValue
    private UUID id;

    @ManyToOne
    private Member member;

    private double weight;
    private double bmi;
    private double bodyFat;

    private LocalDate recordDate;

    @Column(length = 500)
    private String notes;
}
