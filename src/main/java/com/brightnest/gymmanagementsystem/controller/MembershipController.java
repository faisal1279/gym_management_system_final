package com.brightnest.gymmanagementsystem.controller;

import com.brightnest.gymmanagementsystem.service.MembershipService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class MembershipController {

    private final MembershipService membershipService;
    //View all memberships plan
    @GetMapping("/admin/memberships")
    public String memberships(Model model) {
        model.addAttribute("memberships",membershipService.getAllMemberships());
        return "admin/membershipsList";
    }
    //create membership plan
    @PostMapping("/admin/memberships")
    public String createMembership(
            @RequestParam String name,
            @RequestParam int duration,
            @RequestParam double price,
            @RequestParam List<String> features,
            RedirectAttributes redirectAttributes) {

        try {
            membershipService.createMembership(name, duration, price, features);
            redirectAttributes.addFlashAttribute("message", "Created successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }

        return "redirect:/admin/memberships";
    }
    @PostMapping("/admin/memberships/update/{id}")
    public String updateMembership(
            @PathVariable UUID id,
            @RequestParam String name,
            @RequestParam int duration,
            @RequestParam double price,
            @RequestParam(required = false) List<String> features,
            RedirectAttributes ra) {

        try {
            membershipService.updateMembership(id, name, duration, price, features);
            ra.addFlashAttribute("success", "Membership updated successfully");
        } catch (Exception e) {
            ra.addFlashAttribute("error", e.getMessage());
        }

        return "redirect:/admin/memberships";
    }
    @GetMapping("/admin/memberships/delete/{id}")
    public String deleteMembership(
            @PathVariable UUID id,
            RedirectAttributes ra) {

        try {
            membershipService.deleteMembership(id);
            ra.addFlashAttribute("success", "Membership deactivated");
        } catch (Exception e) {
            ra.addFlashAttribute("error", e.getMessage());
        }

        return "redirect:/admin/memberships";
    }

}
