package com.brightnest.gymmanagementsystem.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
@Entity
@Table(name = "user_table")
public class User {
    @Id
    @GeneratedValue
    private UUID id;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String phone;
    private String gender;
    private String address;
    private boolean active;
    private String role;

//    @ManyToOne(fetch = FetchType.EAGER)
//    @JoinColumn(name = "role_id")
//    private Role roleEntity;

    private String profileImage;
    private LocalDateTime createdAt;
    @PrePersist
    protected void onCreate() {
        this.createdAt = LocalDateTime.now();
    }

//    @OneToMany(mappedBy = "user")
//    private List<UserPermission> userPermissions;
}
