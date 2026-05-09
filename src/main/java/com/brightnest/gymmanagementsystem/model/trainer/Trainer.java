package com.brightnest.gymmanagementsystem.model.trainer;

import com.brightnest.gymmanagementsystem.model.User;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;
@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name = "trainers")
public class Trainer {
    @Id
    @GeneratedValue
    private UUID trainerId;

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    private int experienceYears;
    private String specialization;

    @Column(length = 2000)
    private String bio;

    private int salary;
    private boolean active;

    // Rating
    private double rating;   // average
    private int totalReviews;

    @Transient   // don't add DB
    private long memberCount;
    private LocalDateTime joinDate;
    @PrePersist
    protected void onCreate() {
        this.joinDate = LocalDateTime.now();
    }
    @OneToMany(mappedBy = "trainer", cascade = CascadeType.ALL)
    @ToString.Exclude
    private List<TrainerAchievement> achievements;

    @OneToMany(mappedBy = "trainer", cascade = CascadeType.ALL)
    @ToString.Exclude
    private List<TrainerSkill> skills;

}
