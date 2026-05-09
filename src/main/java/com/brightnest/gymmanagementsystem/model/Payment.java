package com.brightnest.gymmanagementsystem.model;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
@Entity
@Table(name = "payments")
public class Payment {
    @Id
    @GeneratedValue
    private UUID paymentId;

    @ManyToOne
    private Member member;

    @ManyToOne
    private Membership membership; //new


    private double amount;
    private LocalDate paymentDate;

    private String forMembership;

    private String method;   //cash/ bkash

    private boolean success;

    private String transactionId; //new

    private String gateway; //new

}
