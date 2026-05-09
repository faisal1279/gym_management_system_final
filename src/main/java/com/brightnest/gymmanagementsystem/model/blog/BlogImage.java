package com.brightnest.gymmanagementsystem.model.blog;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
public class BlogImage {
    @Id
    @GeneratedValue
    private UUID id;

    private String imageUrl;

    @ManyToOne
    @JoinColumn(name = "blog_id")
    private Blog blog;
}
