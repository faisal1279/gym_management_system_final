//package com.brightnest.gymmanagementsystem.service.security;
//
//import com.brightnest.gymmanagementsystem.model.User;
//import com.brightnest.gymmanagementsystem.model.UserPermission;
//import com.brightnest.gymmanagementsystem.model.permission.Permission;
//import com.brightnest.gymmanagementsystem.repository.UserPermissionRepository;
//import com.brightnest.gymmanagementsystem.repository.UserRepository;
//import lombok.RequiredArgsConstructor;
//import org.springframework.security.core.Authentication;
//import org.springframework.stereotype.Service;
//
//import java.util.List;
//
//@Service("permissionService")
//@RequiredArgsConstructor
//public class PermissionService {
//    private final UserRepository userRepository;
//    private final UserPermissionRepository userPermissionRepository;
//
////    public boolean hasPermission(
////            Authentication authentication,
////            String permission
////    ) {
////
////        if (authentication == null) {
////            return false;
////        }
////
////        User user = userRepository.findByEmail(authentication.getName());
////
////        if (user == null) {
////            return false;
////        }
////
////        if (user.getRoleEntity() == null) {
////            return false;
////        }
////
////        return user.getRoleEntity()
////                .getPermissions()
////                .stream()
////                .map(Permission::getPermissionName)
////                .anyMatch(p -> p.name().equals(permission));
////    }
//
////    public boolean hasPermission(
////            Authentication authentication,
////            String permission) {
////
////        if(authentication==null){
////            return false;
////        }
////
////        User user =
////                userRepository.findByEmail(authentication.getName());
////
////        if(user==null){
////            return false;
////        }
////
////        // ---------- USER OVERRIDE ----------
////
////        List<UserPermission> userPermissions =
////                userPermissionRepository.findByUser(user);
////
////        for(UserPermission up : userPermissions){
////
////            if(up.getPermission()
////                    .getPermissionName()
////                    .name()
////                    .equals(permission)){
////
////                return up.isAllowed();
////            }
////
////        }
////
////        // ---------- ROLE ----------
////
////        if(user.getRoleEntity()==null){
////            return false;
////        }
////
////        return user.getRoleEntity()
////                .getPermissions()
////                .stream()
////                .map(Permission::getPermissionName)
////                .anyMatch(p->p.name().equals(permission));
////
////    }
//
//    public boolean hasPermission(
//            Authentication authentication,
//            String permission) {
//
//        if (authentication == null) {
//            return false;
//        }
//
//        User user = userRepository.findByEmail(authentication.getName());
//
//        if (user == null) {
//            return false;
//        }
//
//        // ==========================================
//        // 1. USER-SPECIFIC PERMISSION OVERRIDE
//        // ==========================================
//
//        List<UserPermission> userPermissions =
//                userPermissionRepository.findByUser(user);
//
//        for (UserPermission userPermission : userPermissions) {
//
//            if (userPermission.getPermission()
//                    .getPermissionName()
//                    .name()
//                    .equals(permission)) {
//
//                // User-specific permission has priority
//                return userPermission.isAllowed();
//            }
//        }
//
//        // ==========================================
//        // 2. ROLE PERMISSION
//        // ==========================================
//
//        if (user.getRoleEntity() == null) {
//            return false;
//        }
//
//        return user.getRoleEntity()
//                .getPermissions()
//                .stream()
//                .map(Permission::getPermissionName)
//                .anyMatch(p -> p.name().equals(permission));
//    }
//
//}
