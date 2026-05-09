package com.brightnest.gymmanagementsystem.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class TrainerExerciseTableDTO {
    private UUID exerciseId;

    private String exerciseName;

    private String level;
    private String day;

    private int sets;
    private int reps;

    private List<String> images;

    private List<String> youtubeLink;

    private String description;
    private String warning;
}
