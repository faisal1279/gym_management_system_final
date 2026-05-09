package com.brightnest.gymmanagementsystem.repository;

import com.brightnest.gymmanagementsystem.model.Member;
import com.brightnest.gymmanagementsystem.model.trainer.Trainer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface TrainerRepository extends JpaRepository<Trainer, UUID> {

    // Find trainer by associated user id
    Optional<Trainer> findByUser_Id(UUID userId);

    // Find trainer by associated user email
    Optional<Trainer> findByUser_Email(String email);

    // Get all active trainers
    List<Trainer> findAllByActiveTrue();

    // Trainer performance (number of members)
    @Query("""
        SELECT t, COUNT(m)
        FROM Trainer t LEFT JOIN Member m
        ON m.trainer = t
        GROUP BY t
    """)
    List<Object[]> trainerWithMemberCount();

    // Members whose membership is expiring
//    List<Member> getExpiringMembers(UUID trainerId);

    @Query("SELECT m FROM Member m WHERE m.trainer.trainerId = :trainerId AND m.endDate BETWEEN CURRENT_DATE AND :expiryDate")
    List<Member> findExpiringMembers(UUID trainerId, LocalDate expiryDate);


    //trainer list for admin(search->phone,name,email,active)
    @Query("""
            SELECT t FROM Trainer t
            WHERE
            (:keyword = '' OR
             LOWER(t.user.lastName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR
             LOWER(t.user.email) LIKE LOWER(CONCAT('%', :keyword, '%')) OR
             LOWER(t.user.phone) LIKE LOWER(CONCAT('%', :keyword, '%'))
            )
            AND
            (:active IS NULL OR t.active = :active)
            """)
    Page<Trainer> searchTrainers(
            @Param("keyword") String keyword,
            @Param("active") Boolean active,
            Pageable pageable);
}
