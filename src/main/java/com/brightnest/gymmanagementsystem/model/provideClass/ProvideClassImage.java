//package com.brightnest.gymmanagementsystem.model.provideClass;
//
//
//import jakarta.persistence.*;
//import lombok.AllArgsConstructor;
//import lombok.Data;
//import lombok.NoArgsConstructor;
//import lombok.ToString;
//
//import java.util.UUID;
//
//@NoArgsConstructor
//@AllArgsConstructor
//@Data
//@ToString
//@Entity
//
//public class ProvideClassImage {
//    @Id
//    @GeneratedValue
//    private UUID id;
//
//    private String imageUrl;
//
//    @ManyToOne
//    @JoinColumn(name = "class_id")
//    private ProvideClass provideClass;
//}
