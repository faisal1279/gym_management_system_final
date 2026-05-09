package com.brightnest.gymmanagementsystem.controller.websiteController;

import com.brightnest.gymmanagementsystem.model.blog.Blog;
import com.brightnest.gymmanagementsystem.model.trainer.Trainer;
import com.brightnest.gymmanagementsystem.service.BlogService;
import com.brightnest.gymmanagementsystem.service.GalleryService;
import com.brightnest.gymmanagementsystem.service.MembershipService;
import com.brightnest.gymmanagementsystem.service.TrainerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class WebsiteController {

    private final BlogService blogService;
    private final MembershipService membershipService;
    private final TrainerService trainerService;
    private final GalleryService galleryService;

    @GetMapping({"/","/home"})
    public String homePage(Model model){

        List<Blog> latestBlogs = blogService.getLatestBlogs(3);

        model.addAttribute("blogs", latestBlogs);
        model.addAttribute("memberships",
                membershipService.getLatest3());

        List<Trainer> latestTrainers = trainerService.getLatestTrainers(4);
        model.addAttribute("trainers", latestTrainers);

        return "home-page";
    }
    // ================== Services ==================
    @GetMapping("/memberships")
    public String membershipPage(Model model) {
//         View all memberships
        model.addAttribute("memberships",
                membershipService.getAllActiveMemberships());

        return "website/service/memberships";
    }
    // ================== ABOUT ==================

    @GetMapping("/about/story")
    public String ourStory() {
        return "website/about/our-story";
    }

    @GetMapping("/about/mission")
    public String missionVision() {
        return "website/about/mission-vision";
    }

    @GetMapping("/about/facilities")
    public String facilities() {
        return "website/about/facilities";
    }

    // ================== MEMBERSHIP ==================

    @GetMapping("/membership/plans")
    public String plansPricing() {
        return "website/membership/plans-pricing";
    }

    @GetMapping("/membership/compare")
    public String comparePlans() {
        return "website/membership/compare-plans";
    }

    @GetMapping("/membership/offers")
    public String offers() {
        return "website/membership/offers";
    }

    // ================== TRAINERS ==================

    // All trainers page
    @GetMapping("/trainers")
    public String allTrainers(Model model) {
        List<Trainer> allTrainers = trainerService.getAllActiveTrainers();
        model.addAttribute("trainers", allTrainers);
        return "website/trainers/all-trainers";
    }

    // Trainer details page
    @GetMapping("/trainers/{id}")
    public String trainerDetails(@PathVariable UUID id, Model model) {
        Trainer trainer = trainerService.getTrainerById(id);
        model.addAttribute("trainer", trainer);
        return "website/trainers/trainer-details";
    }

    @GetMapping("/trainers/become")
    public String becomeTrainer() {
        return "website/trainers/become-trainer";
    }

    // ================== GALLERY ==================


    @GetMapping("/gallery/photos")
    public String photos(Model model){
        model.addAttribute("images", galleryService.getAllImage());
        return "website/gallery/photos";
    }

    @GetMapping("/gallery/videos")
    public String videos(Model model){
        model.addAttribute("videos", galleryService.getAllVideo());
        return "website/gallery/videos";
    }

    @GetMapping("/gallery/photo/{id}")
    public String photoDetails(@PathVariable UUID id, Model model){
        model.addAttribute("img", galleryService.getImageById(id));
        return "website/gallery/photos-details";
    }

    // ================== BLOG ==================

    @GetMapping("/blog/fitness")
    public String fitnessTips() {
        return "website/blog/fitness-tips";
    }

    @GetMapping("/blog/nutrition")
    public String nutrition() {
        return "website/blog/nutrition";
    }

    @GetMapping("/blog/news")
    public String news() {
        return "website/blog/news";
    }

    // ================== CONTACT ==================

    @GetMapping("/contact")
    public String contact() {
        return "website/contact";
    }

}