//package com.brightnest.gymmanagementsystem.model.role;
//
//import com.brightnest.gymmanagementsystem.model.User;
//import com.brightnest.gymmanagementsystem.model.permission.Permission;
//import jakarta.persistence.Entity;
//import jakarta.persistence.*;
//import jakarta.persistence.Table;
//import lombok.*;
//import lombok.Setter;
//
//import java.time.LocalDateTime;
//import java.util.*;
//
//@Entity
//@Table(name = "roles")
//@Getter
//@Setter
//@NoArgsConstructor
//@AllArgsConstructor
//@Builder
//public class Role {
//    @Id
//    @GeneratedValue
//    private UUID roleId;
//
//    @Column(nullable = false, unique = true)
//    private String roleName;
//
//    @Column(length = 1000)
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
//    @OneToMany(mappedBy = "roleEntity")
//    private List<User> users = new ArrayList<>();
//
////    @ManyToMany
////    @JoinTable(
////            name = "role_permissions",
////            joinColumns = @JoinColumn(name = "role_id"),
////            inverseJoinColumns = @JoinColumn(name = "permission_id")
////    )
////    private Set<Permission> permissions = new HashSet<>();
//@ManyToMany(fetch = FetchType.EAGER)
//@JoinTable(
//        name = "role_permissions",
//        joinColumns = @JoinColumn(name = "role_id"),
//        inverseJoinColumns = @JoinColumn(name = "permission_id")
//)
//private Set<Permission> permissions = new HashSet<>();
//
//}
