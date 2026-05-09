package com.brightnest.gymmanagementsystem.controller;

import com.brightnest.gymmanagementsystem.model.User;
import com.brightnest.gymmanagementsystem.service.UserService;
import jakarta.annotation.Nullable;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;

@RequiredArgsConstructor
@Controller
public class AuthController {
    private final UserService userService;
    @GetMapping("/register")
    public String registrationPage() {
        return "registration-page";
    }
    @GetMapping("/login")
    public String loginPage(@RequestParam @Nullable String error,@RequestParam @Nullable String logout, RedirectAttributes redirectAttributes,Authentication authentication) {
        if (authentication != null && authentication.isAuthenticated()) {
            return "redirect:/dashboard";
        }

        if ("true".equals(error)) {
            redirectAttributes.addFlashAttribute("error", "Invalid credentials");
            return "redirect:/login";
        }

        if ("true".equals(logout)) {
            redirectAttributes.addFlashAttribute("message", "You've been logged out");
            return "redirect:/login";
        }
        return "login-page";
    }
    @PostMapping("/register")
    public String doRegisterUser(@RequestParam String firstName, @RequestParam String lastName, @RequestParam String email, @RequestParam String phone, @RequestParam String gender, @RequestParam String address, @RequestParam String password, RedirectAttributes redirectAttributes,MultipartFile profileImage) throws Exception {
        try{
            userService.registerUser(firstName,lastName,email,phone,gender,address,password,profileImage);
            redirectAttributes.addFlashAttribute("message", "Registration Successful");
        }catch (Exception ex){
            redirectAttributes.addFlashAttribute("error", ex.getMessage());
        }
        return "redirect:/register";
    }
@GetMapping("/dashboard")
public String dashboardPage(HttpServletRequest httpServletRequest) {
    if (httpServletRequest.isUserInRole("ADMIN")) {
        return "redirect:/admin/dashboard";
    } else if (httpServletRequest.isUserInRole("USER")) {
        return "redirect:/user/dashboard";
    }else if (httpServletRequest.isUserInRole("TRAINER")) {
        return "redirect:/trainer/dashboard";
    }else if (httpServletRequest.isUserInRole("MEMBER")) {
        return "redirect:/member/dashboard";
    }
    return "home-page";
}

    @GetMapping("/user/dashboard")
    public String userDashboardPage() {
        return "user-dashboard";
    }

    //for users get profile details
    @GetMapping("/profile")
    public String profileInfo(Model model, Principal principal) {
        User user = userService.getUserByEmail(principal.getName());

        model.addAttribute("user", user);

        return "profile/profile-page";
    }
    //get user info update form
    @GetMapping("/profile/update-user-info")
    public String updateUserInfo(Model model, Principal principal) {
        User user = userService.getUserByEmail(principal.getName());
        model.addAttribute("user", user);
        return "profile/edit-userInfo";
    }
    //update user info
    @PostMapping("/profile/update-user-info")
    public String updateInfo(@RequestParam String firstName,
                             @RequestParam String lastName,
                             @RequestParam String phone,
                             @RequestParam String address,
                             @RequestParam String gender,
                             Principal principal,RedirectAttributes  redirectAttributes) {
        userService.updateUserInfo(firstName,lastName,phone,gender,address,principal.getName());
        redirectAttributes.addFlashAttribute("message", "User updated successfully");
        redirectAttributes.addFlashAttribute("error", "User updated successfully");

        return "redirect:/profile";
    }
    //get update photo form
    @GetMapping("/profile/update-photo")
    public String updatePhoto() {
        return "profile/update-photo";
    }
    //update profile photo

    @PostMapping("/profile/update-photo")
    public String updatePhoto(@RequestParam MultipartFile profileImage,
                              Principal principal,
                              RedirectAttributes redirectAttributes) {

        try {
            userService.updateProfilePhoto(principal.getName(), profileImage);
            redirectAttributes.addFlashAttribute("message",
                    "Profile photo updated successfully");

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error",
                    e.getMessage());
        }

        return "redirect:/profile";
    }


    //get form for changing the password
    @GetMapping("/profile/change-password")
    public String changePassword() {
        return "profile/change-password";
    }
    //Change password
    @PostMapping("/profile/change-password")
    public String changePassword(@RequestParam String oldPassword,
                                 @RequestParam String newPassword,
                                 Principal principal,
                                 RedirectAttributes redirectAttributes) {

        try {
            userService.changePassword(principal.getName(),
                    oldPassword,
                    newPassword);

            redirectAttributes.addFlashAttribute("message",
                    "Password changed successfully");

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error",
                    e.getMessage());
        }

        return "redirect:/profile";
    }


}
