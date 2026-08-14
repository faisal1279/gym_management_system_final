//package com.brightnest.gymmanagementsystem.service.role;
//
//import com.brightnest.gymmanagementsystem.model.permission.Permission;
//import com.brightnest.gymmanagementsystem.model.role.Role;
//import com.brightnest.gymmanagementsystem.repository.PermissionRepository;
//import com.brightnest.gymmanagementsystem.repository.RoleRepository;
//import jakarta.transaction.Transactional;
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Service;
//
//import java.util.HashSet;
//import java.util.List;
//import java.util.Set;
//import java.util.UUID;
//
//@Service
//@RequiredArgsConstructor
//public class RoleServiceImpl implements RoleService {
//    private final RoleRepository roleRepository;
//    private final PermissionRepository permissionRepository;
//
//    @Override
//    public List<Role> getAllRoles() {
//        return roleRepository.findAll();
//    }
//
//    @Override
//    public Role getRole(UUID id) {
//        return roleRepository.findById(id)
//                .orElseThrow(() ->
//                        new RuntimeException("Role not found"));
//    }
//
//    @Override
//    public void createRole(String roleName,
//                           String description,
//                           boolean active) {
//
//        if(roleRepository.existsByRoleName(roleName)){
//            throw new RuntimeException("Role already exists");
//        }
//
//        Role role = new Role();
//
//        role.setRoleName(roleName);
//        role.setDescription(description);
//        role.setActive(active);
//
//        roleRepository.save(role);
//    }
//
//    @Override
//    public void updateRole(UUID id,
//                           String roleName,
//                           String description,
//                           boolean active) {
//
//        Role role = getRole(id);
//
//        Role existing = roleRepository.findByRoleName(roleName).orElse(null);
//
//        if (existing != null &&
//                !existing.getRoleId().equals(id)) {
//
//            throw new RuntimeException("Role already exists");
//        }
//        role.setRoleName(roleName);
//        role.setDescription(description);
//        role.setActive(active);
//
//        roleRepository.save(role);
//    }
//
//    @Override
//    public void deleteRole(UUID id) {
//
//        Role role = getRole(id);
//
//        if (!role.getUsers().isEmpty()) {
//            throw new RuntimeException(
//                    "Cannot delete. Users are assigned to this role."
//            );
//        }
//
//        roleRepository.delete(role);
//
//    }
//
//    @Override
//    @Transactional
//    public void assignPermissions(
//            UUID roleId,
//            List<UUID> permissionIds
//    ) {
//
//        Role role = roleRepository.findById(roleId)
//                .orElseThrow(() -> new RuntimeException("Role not found"));
//
//        Set<Permission> permissions = new HashSet<>();
//
//        if (permissionIds != null) {
//
//            for (UUID id : permissionIds) {
//
//                Permission permission = permissionRepository.findById(id)
//                        .orElseThrow(() ->
//                                new RuntimeException("Permission not found"));
//
//                permissions.add(permission);
//
//            }
//
//        }
//
//        role.setPermissions(permissions);
//
//        roleRepository.save(role);
//
//    }
//}
