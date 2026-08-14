package com.brightnest.gymmanagementsystem.service.contact;

import com.brightnest.gymmanagementsystem.model.contact.ContactMessage;

import java.util.List;
import java.util.UUID;

public interface ContactService {
    void saveMessage(String name,String email,String subject,String message);
    List<ContactMessage> getAllMessages();
    ContactMessage getMessage(UUID id);
    void markAsRead(UUID id);
    void deleteMessage(UUID id);
    void replyMessage(
            UUID id,
            String subject,
            String body
    );
}
