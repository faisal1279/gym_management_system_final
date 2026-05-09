package com.brightnest.gymmanagementsystem.model.gymClass;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
public class ClassImage {
    @Id
    @GeneratedValue
    private UUID id;

    private String imageUrl;

    @ManyToOne
    @JoinColumn(name = "class_id")
    private GymClass gymClass;
}
