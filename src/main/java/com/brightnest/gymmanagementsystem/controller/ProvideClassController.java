//package com.brightnest.gymmanagementsystem.controller;
//
//import com.brightnest.gymmanagementsystem.service.ProvideClassService;
//import com.brightnest.gymmanagementsystem.service.TrainerService;
//import lombok.RequiredArgsConstructor;
//import org.springframework.format.annotation.DateTimeFormat;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import java.security.Principal;
//import java.time.DayOfWeek;
//import java.time.LocalTime;
//import java.util.List;
//import java.util.UUID;
//
//@Controller
//@RequiredArgsConstructor
//public class ProvideClassController {
//
//    private final ProvideClassService provideClassService;
//    private final TrainerService trainerService;
//
//    @GetMapping("/admin/provideClass")
//    public String provideClass(Model model){
//
//        return "admin/provideClass";
//    }
//    @GetMapping("/admin/provideClass/create")
//    public String creteProvideClass(Model model){
//        model.addAttribute("trainers",trainerService.getAllActiveTrainers());
//        return "admin/provideClass/create-class";
//    }
//    // ✅ CREATE
//    @PostMapping("/admin/provideClass/create")
//    public String create(
////            @RequestParam String name,
////            @RequestParam String level,
//            @RequestParam int duration,
////            @RequestParam int capacity,
////            @RequestParam String shortDesc,
////            @RequestParam String description,
//
//            @RequestParam(required = false) MultipartFile coverImage,
//            @RequestParam(required = false) List<MultipartFile> images,
//            @RequestParam(required = false) UUID trainerId,
//
//            @RequestParam(required = false) List<DayOfWeek> days,
//            @RequestParam(required = false)
//            @DateTimeFormat(pattern = "HH:mm") List<LocalTime> startTimes,
//            @RequestParam(required = false)
//            @DateTimeFormat(pattern = "HH:mm") List<LocalTime> endTimes,
//
//            @RequestParam(defaultValue = "false") boolean active,
//
//            Principal principal,
//            RedirectAttributes ra
//    ){
//        try{
//            provideClassService.createClass(
////                    name, level,
//                    duration,
////                    capacity,
////                    shortDesc, description,
//                    coverImage, images,
//                    trainerId,
//                    days, startTimes, endTimes,
//                    active,
//                    principal.getName()
//            );
//
//            ra.addFlashAttribute("success", "Class created successfully");
//
//        }catch (Exception e){
//            ra.addFlashAttribute("error", e.getMessage());
//        }
//
//        return "redirect:/admin/classes";
//    }
//
//
//}
