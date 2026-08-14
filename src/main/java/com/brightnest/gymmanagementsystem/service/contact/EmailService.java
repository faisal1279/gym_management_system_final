package com.brightnest.gymmanagementsystem.service.contact;

public interface EmailService {
    void sendEmail(
            String to,
            String subject,
            String reply,
            String name
    );
}
