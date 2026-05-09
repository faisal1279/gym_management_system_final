package com.brightnest.gymmanagementsystem.repository;

import com.brightnest.gymmanagementsystem.model.Member;
import com.brightnest.gymmanagementsystem.model.User;
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
public interface MemberRepository extends JpaRepository<Member, UUID> {

    Optional<Member> findByUser_Id(UUID userId);

    Optional<Member> findByUser(User user);
    //trainer member fetch
    Page<Member> findByTrainer_TrainerId(UUID trainerId, Pageable pageable);


    long countByTrainer_TrainerId(UUID trainerId);
    Optional<Member> findByUser_Email(String email);

    List<Member> findByDueAmountGreaterThanOrEndDateBefore(
        double amount,
        LocalDate date
    );
//for admin dashboard
        @Query("""
        SELECT YEAR(m.createdAt), MONTH(m.createdAt), COUNT(m)
        FROM Member m
        WHERE m.createdAt >= :startDate
        GROUP BY YEAR(m.createdAt), MONTH(m.createdAt)
        ORDER BY YEAR(m.createdAt), MONTH(m.createdAt)
        """)
    List<Object[]> memberGrowthData(LocalDate startDate);

    Optional<Member> findByUserId(UUID userId);

    @Query("""
SELECT m FROM Member m
WHERE
(:keyword = '' OR
 LOWER(m.user.lastName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR
 LOWER(m.user.email) LIKE LOWER(CONCAT('%', :keyword, '%'))
)
AND
(:paymentStatus IS NULL OR :paymentStatus = '' OR
 (:paymentStatus = 'PAID' AND m.dueAmount = 0) OR
 (:paymentStatus = 'UNPAID' AND m.dueAmount > 0)
)
""")
    Page<Member> searchMembers(
            @Param("keyword") String keyword,
            @Param("paymentStatus") String paymentStatus,
            Pageable pageable);
}
