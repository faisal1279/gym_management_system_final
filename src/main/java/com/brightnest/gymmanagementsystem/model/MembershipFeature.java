package com.brightnest.gymmanagementsystem.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@ToString(exclude = "membership")
public class MembershipFeature {
    @Id
    @GeneratedValue
    private int id;

    private String featureName;

    @ManyToOne
    @JoinColumn(name="membership_id")
    private Membership membership;
}
