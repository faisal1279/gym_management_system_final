package com.brightnest.gymmanagementsystem.repository;

import com.brightnest.gymmanagementsystem.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface UserRepository extends JpaRepository<User, UUID> {
//    User (UUID id);
    User findByEmail(String email);
    List<User> findByRole(String role);
    Page<User> findByRoleNot(String role, Pageable pageable);

    @Query("""
    SELECT u FROM User u
    WHERE u.role <> 'ROLE_ADMIN'
    AND (
        :keyword = '' OR
        LOWER(u.firstName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR
        LOWER(u.email) LIKE LOWER(CONCAT('%', :keyword, '%')) OR
        u.phone LIKE CONCAT('%', :keyword, '%')
    )
    AND (
        :role IS NULL OR :role = '' OR u.role = :role
    )
""")
    Page<User> searchUsers(String keyword, String role, Pageable pageable);

}
