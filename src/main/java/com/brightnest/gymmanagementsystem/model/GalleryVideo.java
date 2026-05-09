package com.brightnest.gymmanagementsystem.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
@Entity

public class GalleryVideo {

    @Id
    @GeneratedValue
    private UUID id;

    private String videoUrl;

    private String title;
    private String description;

    private String category;

    private LocalDateTime createdAt;
}
