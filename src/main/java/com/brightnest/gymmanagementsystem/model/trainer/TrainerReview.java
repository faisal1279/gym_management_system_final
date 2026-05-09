package com.brightnest.gymmanagementsystem.model.trainer;

import com.brightnest.gymmanagementsystem.model.Member;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
public class TrainerReview {
    @Id
    @GeneratedValue
    private UUID id;

    private int rating;

    private String comment;

    @ManyToOne
    private Trainer trainer;

    @ManyToOne
    private Member member;
}
