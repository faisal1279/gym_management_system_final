package com.brightnest.gymmanagementsystem.model.exerciseModel;

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
@ToString
@Entity
public class Exercise {

    @Id
    @GeneratedValue
    private UUID exerciseId;

    private String name;

    @Column(length = 2000)
    private String description;

    private String targetMuscle;

    private String difficulty; //beginner/intermediate/advanced

    @OneToMany(mappedBy = "exercise",cascade = CascadeType.ALL)
    @ToString.Exclude
    private List<ExerciseImage> images;

    @OneToMany(mappedBy = "exercise", cascade = CascadeType.ALL)
    private List<ExerciseVideo> videos;

    @Column(length = 500)
    private String warning;

    @Column(nullable = false)
    private boolean active;


    @ManyToOne
    @JoinColumn(name = "created_by")
    private User createdBy;

    private LocalDateTime createdAt;

}
