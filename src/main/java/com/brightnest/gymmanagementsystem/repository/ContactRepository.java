package com.brightnest.gymmanagementsystem.repository;

import com.brightnest.gymmanagementsystem.model.contact.ContactMessage;
import com.brightnest.gymmanagementsystem.model.contact.MessageStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface ContactRepository extends JpaRepository<ContactMessage, UUID> {
    List<ContactMessage> findByStatus(MessageStatus status);
}
