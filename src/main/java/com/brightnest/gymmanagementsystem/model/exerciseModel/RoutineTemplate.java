package com.brightnest.gymmanagementsystem.model.exerciseModel;

import com.brightnest.gymmanagementsystem.model.trainer.Trainer;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
@Entity
public class RoutineTemplate {
    @Id
    @GeneratedValue
    private UUID id;

    private String name;

    private String level;
    // Beginner / Intermediate / Advanced

    private boolean active;

    @ManyToOne
    private Trainer trainer;

    @OneToMany(mappedBy = "template", cascade = CascadeType.ALL, orphanRemoval = true)
    @ToString.Exclude
    private List<RoutineTemplateDay> days = new ArrayList<>();
}
