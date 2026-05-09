package com.brightnest.gymmanagementsystem.model.exerciseModel;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.DayOfWeek;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
@Entity
@Table(name = "routine_template_day")
public class RoutineTemplateDay {
    @Id
    @GeneratedValue
    private UUID id;

    // Day of week stored as string in DB
    @Enumerated(EnumType.STRING)
    @Column(name = "day_of_week", nullable = false)
    private DayOfWeek day;

    // Many days belong to one template
    @ManyToOne(fetch = FetchType.LAZY) // Lazy is better for performance
    @JoinColumn(name = "template_id", nullable = false)
    @ToString.Exclude
    private RoutineTemplate template;

    // One day can have many exercises
    @OneToMany(mappedBy = "templateDay", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<RoutineTemplateExercise> exercises = new ArrayList<>();}
