package com.brightnest.gymmanagementsystem.controller;

import com.brightnest.gymmanagementsystem.model.trainer.Trainer;
import com.brightnest.gymmanagementsystem.service.GymClassService;
import com.brightnest.gymmanagementsystem.service.TrainerService;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.time.DayOfWeek;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class AdminGymClassController {
    private final GymClassService gymClassService;
    private final TrainerService trainerService;

    // LIST
    @GetMapping("/admin/classes")
    public String listClasses(Model model){

        model.addAttribute("classes",
                gymClassService.getAllClasses());

        return "admin/classes/class-list";
    }

    @GetMapping("/admin/classes/view/{id}")
    public String viewClass(@PathVariable UUID id, Model model){
        model.addAttribute("gymClass", gymClassService.getClassById(id));
        return "admin/classes/view-class";
    }

    // CREATE PAGE WITH TRAINERS
    @GetMapping("/admin/classes/create")
    public String createPage(Model model,RedirectAttributes redirectAttributes){
        // Active trainers fetch
        List<Trainer> trainers = trainerService.getAllActiveTrainers();
        model.addAttribute("trainers", trainers);



        return "admin/classes/create-class";
    }

//    // CREATE
//    @PostMapping("/admin/classes/create")
//    public String create(
//            @RequestParam String name,
//            @RequestParam String level,
//            @RequestParam int duration,
//            @RequestParam int capacity,
//            @RequestParam String shortDesc,
//            @RequestParam String description,
//            @RequestParam(required = false) MultipartFile coverImage,
//            @RequestParam(required = false) List<MultipartFile> images,
//            @RequestParam(required = false) UUID trainerId,
//
////            @RequestParam (required = false) List<DayOfWeek> days,
////            @RequestParam(required = false)
////            @DateTimeFormat(pattern = "HH:mm") List<LocalTime> startTimes,
////            @RequestParam(required = false)
////            @DateTimeFormat(pattern = "HH:mm") List<LocalTime> endTimes,
//            @RequestParam(required = false, defaultValue = "false") boolean active,
//
//            Principal principal,
//            RedirectAttributes ra
//    ){
//        try{
//            gymClassService.createClass(
//                    name, level, duration, capacity,
//                    shortDesc, description,
//                    coverImage,
//                    images,
//                    trainerId,
////                    days, startTimes, endTimes,
//                    active,
//                    principal.getName()
//            );
//
//
//            ra.addFlashAttribute("success","Class created");
//
//        }catch (Exception e){
//
//
//            ra.addFlashAttribute("error", e.getMessage());
//            System.out.println(images == null ? "NULL" : images.size());
//        }
//
//        return "redirect:/admin/classes";
//    }

@PostMapping("/admin/classes/create")
public String create(
        @RequestParam String name,
        @RequestParam String level,
        @RequestParam int duration,
        @RequestParam int capacity,
        @RequestParam String shortDesc,
        @RequestParam String description,
        @RequestParam(required = false) MultipartFile coverImage,
        @RequestParam(required = false) MultipartFile[] images,
        @RequestParam(required = false) UUID trainerId,
        @RequestParam(required = false, defaultValue = "false") boolean active,
        Principal principal,
        RedirectAttributes ra
){
    try{

        // 🔍 TEXT DATA DEBUG
        System.out.println("====== TEXT DATA ======");
        System.out.println("Name length: " + (name != null ? name.length() : "NULL"));
        System.out.println("Level: " + level);
        System.out.println("Duration: " + duration);
        System.out.println("Capacity: " + capacity);
        System.out.println("ShortDesc length: " + (shortDesc != null ? shortDesc.length() : "NULL"));
        System.out.println("Description length: " + (description != null ? description.length() : "NULL"));
        System.out.println("Active: " + active);
        System.out.println("TrainerId: " + trainerId);

        // 🔍 COVER IMAGE DEBUG
        System.out.println("====== COVER IMAGE ======");
        if (coverImage == null) {
            System.out.println("Cover Image: NULL");
        } else {
            System.out.println("Cover Name: " + coverImage.getOriginalFilename());
            System.out.println("Cover Size (bytes): " + coverImage.getSize());
        }

        // 🔍 MULTIPLE IMAGES DEBUG
        System.out.println("====== MULTIPLE IMAGES ======");
        if (images == null) {
            System.out.println("Images: NULL");
        } else {
//            System.out.println("Total Images: " + images.size());

            long totalSize = 0;

            for (MultipartFile img : images) {
                if (img != null && !img.isEmpty()) {
                    System.out.println("Image: " + img.getOriginalFilename()
                            + " | Size: " + img.getSize());
                    totalSize += img.getSize();
                }
            }

            System.out.println("Total Images Size (bytes): " + totalSize);
            System.out.println("Total Images Size (MB): " + (totalSize / (1024 * 1024)));
        }

        // 🔥 SERVICE CALL
        gymClassService.createClass(
                name, level, duration, capacity,
                shortDesc, description,
                coverImage,
                images,
                trainerId,
                active,
                principal.getName()
        );

        ra.addFlashAttribute("success","Class created");

    }catch (Exception e){

        System.out.println("❌ ERROR: " + e.getMessage());
        e.printStackTrace();

        ra.addFlashAttribute("error", e.getMessage());
    }

    return "redirect:/admin/classes";
}

    // EDIT PAGE
    @GetMapping("/edit/{id}")
    public String editPage(
            @PathVariable UUID id,
            Model model
    ){

        model.addAttribute("class",
                gymClassService.getClassById(id));

        return "admin/class/edit-class";
    }

//// UPDATE Gym Class
//    @PostMapping("/admin/classes/update/{id}")
//    public String update(
//            @PathVariable UUID id,
//            @RequestParam String name,
//            @RequestParam String level,
//            @RequestParam int duration,
//            @RequestParam int capacity,
//            @RequestParam String shortDesc,
//            @RequestParam String description,
//            @RequestParam(required = false) MultipartFile coverImage,
//            @RequestParam(required = false) List<MultipartFile> images,
//            @RequestParam(required = false) UUID trainerId,
//
//            @RequestParam(required = false) List<DayOfWeek> days,
//            @RequestParam(required = false) List<LocalTime> startTimes,
//            @RequestParam(required = false) List<LocalTime> endTimes,
//
//            Principal principal,
//            RedirectAttributes ra
//    ) {
//        try {
//            gymClassService.updateClass(
//                    id,
//                    name,
//                    level,
//                    duration,
//                    capacity,
//                    shortDesc,
//                    description,
//                    coverImage,
//                    images,
//                    trainerId,
//                    days,
//                    startTimes,
//                    endTimes,
//                    principal.getName()
//            );
//
//            ra.addFlashAttribute("success", "Class updated successfully");
//
//        } catch (Exception e) {
//            ra.addFlashAttribute("error", e.getMessage());
//        }
//
//        return "redirect:/admin/classes";
//    }

    // DELETE
    @GetMapping("/delete/{id}")
    public String deleteClass(
            @PathVariable UUID id,
            Principal principal,
            RedirectAttributes ra
    ){

        try{
            gymClassService.deleteClass(id, principal.getName());
            ra.addFlashAttribute("success","Class deleted");

        }catch (Exception e){
            ra.addFlashAttribute("error", e.getMessage());
        }

        return "redirect:/admin/classes";
    }
}
