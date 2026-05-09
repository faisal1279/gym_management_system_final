package com.brightnest.gymmanagementsystem.model.gymClass;

import com.brightnest.gymmanagementsystem.model.trainer.Trainer;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
public class GymClass {
    @Id
    @GeneratedValue
    private UUID id;

    private String name;

    private String level; // Beginner / Intermediate / Advanced

    private int duration; // minutes

    private int capacity;

    private String coverImage;

    @Column(length = 2000)
    private String shortDescription;

    @Column(length = 5000)
    private String description;

    private boolean active;

    private LocalDateTime createdAt;

    @ManyToOne
    @JoinColumn(name = "trainer_id")
    private Trainer trainer;

    @OneToMany(mappedBy = "gymClass", cascade = CascadeType.ALL)
    private List<ClassSchedule> schedules = new ArrayList<>();

    @OneToMany(mappedBy = "gymClass", cascade = CascadeType.ALL)
    private List<ClassImage> images = new ArrayList<>();
}
