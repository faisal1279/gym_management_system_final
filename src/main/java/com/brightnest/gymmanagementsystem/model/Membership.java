package com.brightnest.gymmanagementsystem.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Data
//@ToString
@Entity
@Table(name = "memberships")
@ToString(exclude = "features")
public class Membership {
    @Id
    @GeneratedValue
    private UUID membershipId;
    private String name;    //Basic / Standard
    private int durationInDays;
    private double price;
    private boolean active;

    @OneToMany(mappedBy = "membership", cascade = CascadeType.ALL)
    private List<MembershipFeature>  features = new ArrayList<>();
}
