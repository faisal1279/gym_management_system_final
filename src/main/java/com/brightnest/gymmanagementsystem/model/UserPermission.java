//package com.brightnest.gymmanagementsystem.model;
//
//import com.brightnest.gymmanagementsystem.model.permission.Permission;
//import jakarta.persistence.*;
//import lombok.AllArgsConstructor;
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//
//import java.util.UUID;
//
//@Entity
////@Table(
////        name = "user_permissions",
////        uniqueConstraints = {
////                @UniqueConstraint(
////                        columnNames = {"user_id", "permission_id"}
////                )
////        }
////)
//@Getter
//@Setter
//@NoArgsConstructor
//@AllArgsConstructor
//public class UserPermission {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.UUID)
//    private UUID id;
//
//    @ManyToOne
//    @JoinColumn(name = "user_id")
//    private User user;
//
//    @ManyToOne
//    @JoinColumn(name = "permission_id")
//    private Permission permission;
//
//    // true = Allow
//    // false = Deny
//    private boolean allowed = true;
//}
