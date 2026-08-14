package com.brightnest.gymmanagementsystem.service.contact;

import com.brightnest.gymmanagementsystem.model.contact.ContactMessage;
import com.brightnest.gymmanagementsystem.model.contact.MessageStatus;
import com.brightnest.gymmanagementsystem.repository.ContactRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ContactServiceImp implements ContactService{
    private final ContactRepository contactRepository;
    private final EmailService emailService;

    @Override
    public void saveMessage(
            String name,
            String email,
            String subject,
            String message
    ) {

        ContactMessage contact = new ContactMessage();

        contact.setName(name);
        contact.setEmail(email);
        contact.setSubject(subject);
        contact.setMessage(message);

        contact.setCreatedAt(LocalDateTime.now());

        contact.setStatus(MessageStatus.NEW);

        contact.setReplied(false);

        contactRepository.save(contact);

    }

    @Override
    public List<ContactMessage> getAllMessages(){

        return contactRepository.findAll()
                .stream()
                .sorted((a,b)->b.getCreatedAt().compareTo(a.getCreatedAt()))
                .toList();

    }

    @Override
    public ContactMessage getMessage(UUID id){

        return contactRepository.findById(id)
                .orElseThrow(() ->
                        new RuntimeException("Message not found"));

    }

    @Override
    @Transactional
    public void markAsRead(UUID id){

        ContactMessage message =
                contactRepository.findById(id)
                        .orElseThrow(() ->
                                new RuntimeException("Message not found"));

        if(message.getStatus()==MessageStatus.NEW){

            message.setStatus(MessageStatus.READ);

            contactRepository.save(message);

        }

    }

    @Override
    public void deleteMessage(UUID id) {

        contactRepository.deleteById(id);

    }

    @Override
    @Transactional
    public void replyMessage(
            UUID id,
            String subject,
            String body
    ){

        ContactMessage message =
                contactRepository.findById(id)
                        .orElseThrow(
                                ()->new RuntimeException("Message not found")
                        );

        emailService.sendEmail(
                message.getEmail(),
                subject,
                body,
                message.getName()
        );

        message.setStatus(MessageStatus.REPLIED);

        message.setReplied(true);

        contactRepository.save(message);

    }




}
