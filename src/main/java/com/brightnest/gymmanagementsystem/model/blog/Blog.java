package com.brightnest.gymmanagementsystem.model.blog;

import com.brightnest.gymmanagementsystem.model.User;
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
public class Blog {
    @Id
    @GeneratedValue
    private UUID id;

    private String title;

    @Column(length = 5000)
    private String content;

    private String category;

    private boolean published;

    private String coverImage;   // thumbnail

    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;

    @ManyToOne
    @JoinColumn(name = "author_id")
    private User author;

    @OneToMany(mappedBy = "blog", cascade = CascadeType.ALL)
    private List<BlogImage> images = new ArrayList<>();

}
