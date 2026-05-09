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
@Table(
        name = "attendance",
        uniqueConstraints = @UniqueConstraint(
                columnNames = {"member_id", "date"}
        )
)
public class Attendance {

    @Id
    @GeneratedValue
    private UUID attendanceId;

    @ManyToOne
    @JoinColumn(name = "member_id")
    private Member member;

    private LocalDate date;
    private boolean present;
}
