package com.brightnest.gymmanagementsystem.model.contact;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContactMessage {
    @Id
    @GeneratedValue
    private UUID id;

    private String name;

    private String email;

    private String subject;

    @Column(length = 5000)
    private String message;

    private LocalDateTime createdAt;

    @Enumerated(EnumType.STRING)
    private MessageStatus status;

    private boolean replied;

//    public enum MessageStatus {
//
//        NEW,
//        READ,
//        REPLIED
//
//    }
}

