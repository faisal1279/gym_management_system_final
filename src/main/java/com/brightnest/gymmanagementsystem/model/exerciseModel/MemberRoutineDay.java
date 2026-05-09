//package com.brightnest.gymmanagementsystem.model.exerciseModel;
//
//import com.brightnest.gymmanagementsystem.model.Member;
//import jakarta.persistence.Entity;
//import jakarta.persistence.GeneratedValue;
//import jakarta.persistence.Id;
//import jakarta.persistence.ManyToOne;
//import lombok.AllArgsConstructor;
//import lombok.Data;
//import lombok.NoArgsConstructor;
//import lombok.ToString;
//
//import java.time.LocalDate;
//import java.util.UUID;
//
//@NoArgsConstructor
//@AllArgsConstructor
//@Data
//@ToString
//@Entity
//public class MemberRoutineDay {
//    @Id
//    @GeneratedValue
//    private UUID id;
//
//    @ManyToOne
//    private Member member;
//
//    @ManyToOne
//    private RoutineTemplate template;
//
//    private LocalDate startDate;
//
//    private boolean active;
//}
