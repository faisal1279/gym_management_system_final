package com.brightnest.gymmanagementsystem.model.trainer;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
public class TrainerSkill {

    @Id
    @GeneratedValue
    private UUID id;

    private String skillName; // Bodybuilding, Cardio
    private int percentage;   // 95%

    @ManyToOne
    @JoinColumn(name = "trainer_id")
    private Trainer trainer;
}
