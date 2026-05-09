//package com.brightnest.gymmanagementsystem.model.provideClass;
//
//import com.brightnest.gymmanagementsystem.model.trainer.Trainer;
//import jakarta.persistence.*;
//import lombok.AllArgsConstructor;
//import lombok.Data;
//import lombok.NoArgsConstructor;
//import lombok.ToString;
//
//import java.time.LocalDateTime;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.UUID;
//
//@NoArgsConstructor
//@AllArgsConstructor
//@Data
//@ToString
//@Entity
//public class ProvideClass {
//    @Id
//    @GeneratedValue
//    private UUID id;
//
//    private String name;
//
//    private String level;
//
//    @Column(length = 2000)
//    private String shortDescription;
//
//    private int duration;
//
//    private int capacity;
//
//    private String coverImage;
//
//    @Column(length = 5000)
//    private String description;
//
//    private boolean active;
//
//    private LocalDateTime createdAt;
//
//    @ManyToOne
//    @JoinColumn(name = "trainer_id")
//    private Trainer trainer;
//
//    @OneToMany(mappedBy = "provideClass",cascade = CascadeType.ALL,orphanRemoval = true)
//    private List<ClassTime> classTimeList = new ArrayList<>();
//
//    @OneToMany(mappedBy = "provideClass",cascade = CascadeType.ALL,orphanRemoval = true)
//    private List<ProvideClassImage> provideClassImageList = new ArrayList<>();
//
//}
