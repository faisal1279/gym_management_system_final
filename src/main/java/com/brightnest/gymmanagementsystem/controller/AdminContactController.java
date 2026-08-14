package com.brightnest.gymmanagementsystem.controller;

import com.brightnest.gymmanagementsystem.model.contact.ContactMessage;
import com.brightnest.gymmanagementsystem.service.contact.ContactService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.UUID;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/contact")
public class AdminContactController {

    private final ContactService contactService;

    // Inbox
    @GetMapping
    public String contactList(Model model){

        model.addAttribute(
                "messages",
                contactService.getAllMessages()
        );

        return "admin/contact/contact-list";
    }

    // View Message
    @GetMapping("/{id}")
    public String viewMessage(
            @PathVariable UUID id,
            Model model
    ){

        ContactMessage message =
                contactService.getMessage(id);

        contactService.markAsRead(id);

        model.addAttribute("message",message);

        return "admin/contact/contact-details";
    }

    // Reply Page
    @GetMapping("/reply/{id}")
    public String replyPage(
            @PathVariable UUID id,
            Model model
    ){

        model.addAttribute(
                "message",
                contactService.getMessage(id)
        );

        return "admin/contact/reply-message";
    }

    // Delete
    @GetMapping("/delete/{id}")
    public String deleteMessage(
            @PathVariable UUID id
    ){

        contactService.deleteMessage(id);

        return "redirect:/admin/contact";
    }

    @PostMapping("/reply/{id}")
    public String sendReply(

            @PathVariable UUID id,

            @RequestParam String subject,

            @RequestParam String body,

            RedirectAttributes ra

    ){

        try{

            contactService.replyMessage(
                    id,
                    subject,
                    body
            );

            ra.addFlashAttribute(
                    "success",
                    "Reply sent successfully."
            );

        }catch (Exception e){

            ra.addFlashAttribute(
                    "error",
                    e.getMessage()
            );

        }

        return "redirect:/admin/contact";

    }

}
