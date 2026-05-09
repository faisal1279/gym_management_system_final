package com.brightnest.gymmanagementsystem.model.exerciseModel;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
@Entity
public class ExerciseImage {
    @Id
    @GeneratedValue
    private UUID id;

    private String imageUrl;

    @ManyToOne
    @JoinColumn(name = "exercise_id")
    @ToString.Exclude
    private Exercise exercise;
}
