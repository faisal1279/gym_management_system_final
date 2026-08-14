package com.brightnest.gymmanagementsystem.controller;

import com.brightnest.gymmanagementsystem.service.GalleryService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class AdminGalleryController {

    private final GalleryService galleryService;

    @GetMapping("/admin/gallery")
    public String gallery(Model model) {
        model.addAttribute("images",galleryService.getAllImage());
        System.out.println(galleryService.getAllImage());
        model.addAttribute("videos",galleryService.getAllVideo());
        return "admin/gallery/gallery";
    }
    @GetMapping("/admin/gallery/image/create")
    public String createImagePage(Model model) {
        return "admin/gallery/create-image";
    }

//    @PreAuthorize("@permissionService.hasPermission(authentication,'GALLERY_CREATE')")
    @PostMapping("/admin/gallery/image/create")
    public String createImage(@RequestParam List<MultipartFile> files, @RequestParam String title, @RequestParam String description, @RequestParam String category, RedirectAttributes redirectAttributes, Model model) {
        try{
            galleryService.saveImage(files,title,description,category);
            redirectAttributes.addFlashAttribute("success","Image has been saved successfully");
        }catch(Exception e){
            redirectAttributes.addFlashAttribute("error",e.getMessage());
        }
        return "redirect:/admin/gallery";
    }

    // ===== UPDATE IMAGE =====
    @GetMapping("/admin/gallery/image/edit/{id}")
    public String editImage(@PathVariable UUID id, Model model){
        model.addAttribute("img", galleryService.getImageById(id));
        return "admin/gallery/edit-image";
    }

    @PostMapping("/admin/gallery/image/update/{id}")
    public String updateImage(
            @PathVariable UUID id,
            @RequestParam String title,
            @RequestParam String description,
            @RequestParam String category
    ){
        galleryService.updateImage(id, title, description, category);
        return "redirect:/admin/gallery";
    }

    // ===== DELETE IMAGE =====
    @GetMapping("/admin/gallery/image/delete/{id}")
    public String deleteImage(@PathVariable UUID id){
        galleryService.deleteImage(id);
        return "redirect:/admin/gallery";
    }

    // ===== VIDEO =====

    @GetMapping("/admin/gallery/video/create")
    public String createVideoPage(){
        return "admin/gallery/create-video";
    }

    @PostMapping("/admin/gallery/video/create")
    public String createVideo(
            @RequestParam String url,
            @RequestParam String title,
            @RequestParam String description,
            @RequestParam String category,
            RedirectAttributes redirectAttributes
    ){
        try {
            galleryService.saveVideo(url, title, description, category);
            redirectAttributes.addFlashAttribute("success","Video has been saved successfully");
        }catch(Exception e){
            redirectAttributes.addFlashAttribute("error",e.getMessage());
        }
        return "redirect:/admin/gallery";
    }
    // EDIT PAGE
    @GetMapping("/admin/gallery/video/edit/{id}")
    public String editVideo(@PathVariable UUID id, Model model){
        model.addAttribute("video", galleryService.getVideoById(id));
        return "admin/gallery/edit-video";
    }

    // UPDATE
    @PostMapping("/admin/gallery/video/update/{id}")
    public String updateVideo(
            @PathVariable UUID id,
            @RequestParam String url,
            @RequestParam String title,
            @RequestParam String description,
            @RequestParam String category,
            RedirectAttributes ra
    ){
        try{
            galleryService.updateVideo(id, url, title, description, category);
            ra.addFlashAttribute("success", "Video updated successfully");
        }catch (Exception e){
            ra.addFlashAttribute("error", e.getMessage());
        }

        return "redirect:/admin/gallery";
    }

    @GetMapping("/admin/gallery/video/delete/{id}")
    public String deleteVideo(@PathVariable UUID id){
        galleryService.deleteVideo(id);
        return "redirect:/admin/gallery";
    }

}
