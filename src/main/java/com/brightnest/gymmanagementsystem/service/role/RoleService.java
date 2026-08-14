//package com.brightnest.gymmanagementsystem.service.role;
//
//import com.brightnest.gymmanagementsystem.model.role.Role;
//
//import java.util.List;
//import java.util.UUID;
//
//public interface RoleService {
//
//    List<Role> getAllRoles();
//
//    Role getRole(UUID id);
//
//    void createRole(String roleName,
//                    String description,
//                    boolean active);
//
//    void updateRole(UUID id,
//                    String roleName,
//                    String description,
//                    boolean active);
//
//    void deleteRole(UUID id);
//
//    void assignPermissions(
//            UUID roleId,
//            List<UUID> permissionIds
//    );
//}
