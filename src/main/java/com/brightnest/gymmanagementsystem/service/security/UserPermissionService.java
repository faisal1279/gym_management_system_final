//package com.brightnest.gymmanagementsystem.service.security;
//
//import com.brightnest.gymmanagementsystem.model.User;
//import com.brightnest.gymmanagementsystem.model.UserPermission;
//import com.brightnest.gymmanagementsystem.model.permission.Permission;
//import com.brightnest.gymmanagementsystem.repository.PermissionRepository;
//import com.brightnest.gymmanagementsystem.repository.UserPermissionRepository;
//import com.brightnest.gymmanagementsystem.repository.UserRepository;
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Service;
//
//import java.util.List;
//import java.util.UUID;
//
//@Service
//@RequiredArgsConstructor
//public class UserPermissionService {
//
////    private final UserPermissionRepository userPermissionRepository;
////    private final UserRepository userRepository;
////    private final PermissionRepository permissionRepository;
////
////    public List<UserPermission> getUserPermissions(UUID userId){
////
////        User user = userRepository.findById(userId)
////                .orElseThrow();
////
////        return userPermissionRepository.findByUser(user);
////    }
////
////    public void savePermissions(
////            UUID userId,
////            List<UUID> permissionIds){
////
////        User user = userRepository.findById(userId)
////                .orElseThrow();
////
////        userPermissionRepository.deleteAll(
////                userPermissionRepository.findByUser(user)
////        );
////
////        for(UUID permissionId : permissionIds){
////
////            Permission permission =
////                    permissionRepository.findById(permissionId)
////                            .orElseThrow();
////
////            UserPermission up =
////                    new UserPermission();
////
////            up.setUser(user);
////            up.setPermission(permission);
////            up.setAllowed(true);
////
////            userPermissionRepository.save(up);
////        }
////    }
//
//
//    private final UserRepository userRepository;
//    private final PermissionRepository permissionRepository;
//    private final UserPermissionRepository userPermissionRepository;
//
//    public List<UserPermission> getUserPermissions(UUID userId) {
//
//        User user = userRepository.findById(userId)
//                .orElseThrow();
//
//        return userPermissionRepository.findByUser(user);
//    }
//
//    public void assignPermissions(UUID userId,
//                                  List<UUID> permissionIds) {
//
//        User user = userRepository.findById(userId)
//                .orElseThrow();
//
//        //  user permission delete
//        userPermissionRepository.deleteAll(
//                userPermissionRepository.findByUser(user)
//        );
//
//        if (permissionIds == null)
//            return;
//
//        for (UUID pid : permissionIds) {
//
//            Permission permission =
//                    permissionRepository.findById(pid)
//                            .orElseThrow();
//
//            UserPermission up = new UserPermission();
//
//            up.setUser(user);
//            up.setPermission(permission);
//            up.setAllowed(true);
//
//            userPermissionRepository.save(up);
//        }
//    }
//
//}
