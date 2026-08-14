//package com.brightnest.gymmanagementsystem.model.permission;
//
//import com.brightnest.gymmanagementsystem.model.role.Role;
//import jakarta.persistence.*;
//import lombok.*;
//
//import java.time.LocalDateTime;
//import java.util.HashSet;
//import java.util.Set;
//import java.util.UUID;
//
//@Entity
//@Table(name = "permissions")
//@Getter
//@Setter
//@NoArgsConstructor
//@AllArgsConstructor
//@Builder
//public class Permission {
//    @Id
//    @GeneratedValue
//    private UUID permissionId;
//
//    @Enumerated(EnumType.STRING)
//    @Column(unique = true, nullable = false)
//    private PermissionType permissionName;
//
//    private String moduleName;
//
//    private String description;
//
//    private boolean active;
//
//    private LocalDateTime createdAt;
//
//    @PrePersist
//    public void onCreate() {
//        createdAt = LocalDateTime.now();
//    }
//
//    @ManyToMany(mappedBy = "permissions")
//    private Set<Role> roles = new HashSet<>();
//
//}
