package com.brightnest.gymmanagementsystem.model;

import com.brightnest.gymmanagementsystem.model.exerciseModel.RoutineTemplate;
import com.brightnest.gymmanagementsystem.model.trainer.Trainer;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
@Entity
@Table(name = "members")
public class Member {
    @Id
    @GeneratedValue
    private UUID memberId;
    @OneToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;
    @ManyToOne
    @JoinColumn(name = "trainer_id")
    private Trainer trainer;

    @ManyToOne
    @JoinColumn(name = "membership_id")
    private Membership membership;
    private LocalDate startDate;
    private LocalDate endDate;
    private boolean active;

    @Column(name = "initialweight")
    private double initialWeight;
    private double height;

//    @Column(nullable = false)
    private double dueAmount ;

    private LocalDateTime createdAt;
    @PrePersist
    public void prePersist() {
        this.createdAt = LocalDateTime.now();
        this.active = true;
    }
    @ManyToOne
    @JoinColumn(name = "routine_template_id")
    private RoutineTemplate routineTemplate;
}
