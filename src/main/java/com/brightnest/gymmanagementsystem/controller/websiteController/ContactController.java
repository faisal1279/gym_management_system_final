package com.brightnest.gymmanagementsystem.controller.websiteController;

import com.brightnest.gymmanagementsystem.service.contact.ContactService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
public class ContactController {

    private final ContactService contactService;

    @PostMapping("/contact")
    public String sendMessage(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam(required = false) String subject,
            @RequestParam String message,
            RedirectAttributes ra
    ) {

        contactService.saveMessage(
                name,
                email,
                subject,
                message
        );

        ra.addFlashAttribute(
                "success",
                "Message sent successfully."
        );

        return "redirect:/contact";
    }
}
