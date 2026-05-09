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
public class TrainerAchievement {
    @Id
    @GeneratedValue
    private UUID id;

    private String title; // e.g. National Champion 2019

    @ManyToOne
    @JoinColumn(name = "trainer_id")
    private Trainer trainer;
}
