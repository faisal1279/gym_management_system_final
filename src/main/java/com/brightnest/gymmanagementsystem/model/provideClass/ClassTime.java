//package com.brightnest.gymmanagementsystem.model.provideClass;
//
//import jakarta.persistence.*;
//import lombok.AllArgsConstructor;
//import lombok.Data;
//import lombok.NoArgsConstructor;
//import lombok.ToString;
//
//import java.time.DayOfWeek;
//import java.time.LocalTime;
//import java.util.UUID;
//
//@NoArgsConstructor
//@AllArgsConstructor
//@Data
//@ToString
//@Entity
//
//public class ClassTime {
//    @Id
//    @GeneratedValue
//    private UUID id;
//
//    @Enumerated(EnumType.STRING)
//    @Column(name = "day_of_week", nullable = false)
//    private DayOfWeek day;
//
//    private LocalTime startTime;
//    private LocalTime endTime;
//
//    @ManyToOne
//    @JoinColumn(name="class_id")
//    private ProvideClass provideClass;
//}
