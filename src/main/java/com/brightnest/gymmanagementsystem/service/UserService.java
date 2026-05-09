package com.brightnest.gymmanagementsystem.service;

import com.brightnest.gymmanagementsystem.model.User;
import com.brightnest.gymmanagementsystem.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@RequiredArgsConstructor
@Service
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public void registerUser(String firstName, String lastName, String email, String phone, String gender, String address, String password, MultipartFile profileImage) throws Exception{
        User user = userRepository.findByEmail(email);
        if (user != null) {
            throw new Exception("Email is already taken");
        }
        user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setGender(gender);
        user.setAddress(address);
        user.setPassword(passwordEncoder.encode(password));
        user.setActive(true);
        user.setRole("ROLE_USER");

        if(profileImage!=null && !profileImage.isEmpty()){
            String uploadDir = "uploads/profile/";
            Files.createDirectories(Paths.get(uploadDir));

            String fileName = UUID.randomUUID() + "_" + profileImage.getOriginalFilename();
            Path path = Paths.get(uploadDir + fileName);
            Files.write(path, profileImage.getBytes());

            user.setProfileImage(fileName);
        }
        userRepository.save(user);
    }

    public User getUserById(UUID id){
        return userRepository.findById(id).orElseThrow(()-> new RuntimeException("user not found"));
    }
    public User getUserByEmail(String email){
        User user = userRepository.findByEmail(email);
        if(user == null){
            throw new RuntimeException("user not found");
        }
        return user;
    }
    //update user info without email
    public void updateUserInfo(String firstName, String lastName, String phone,  String gender,String address,String email){
        User user = userRepository.findByEmail(email);
        if(user == null){
            throw new RuntimeException("user not found");
        }
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setPhone(phone);
        user.setGender(gender);
        user.setAddress(address);
        userRepository.save(user);
    }
    //update photo
    public void updateProfilePhoto(String email, MultipartFile image) throws Exception {

        if (image == null || image.isEmpty()) {
            throw new RuntimeException("Please select an image");
        }

        User user = userRepository.findByEmail(email);
        if (user == null) {
            throw new RuntimeException("User not found");
        }

        String uploadDir = "uploads/profile/";
        Files.createDirectories(Paths.get(uploadDir));

        String fileName = UUID.randomUUID() + "_" + image.getOriginalFilename();
        Path path = Paths.get(uploadDir + fileName);
        Files.write(path, image.getBytes());

        user.setProfileImage(fileName);
        userRepository.save(user);
    }
    //Change password

    public void changePassword(String email, String oldPassword, String newPassword) {

        User user = userRepository.findByEmail(email);

        if (user == null) {
            throw new RuntimeException("User not found");
        }

        if (!passwordEncoder.matches(oldPassword, user.getPassword())) {
            throw new RuntimeException("Old password is incorrect");
        }

        user.setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(user);
    }


}
