package com.brightnest.gymmanagementsystem.model.exerciseModel;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
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
public class RoutineTemplateExercise {
    @Id
    @GeneratedValue
    private UUID id;

    @ManyToOne
    private RoutineTemplateDay templateDay;

    @ManyToOne
    private Exercise exercise;

    private int sets;
    private int reps;
    private int duration;
    private String notes;
}
