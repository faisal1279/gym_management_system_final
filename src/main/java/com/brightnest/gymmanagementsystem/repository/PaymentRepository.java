package com.brightnest.gymmanagementsystem.repository;

import com.brightnest.gymmanagementsystem.model.Member;
import com.brightnest.gymmanagementsystem.model.Payment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, UUID> {
    List<Payment> findAllByPaymentDateBetween(LocalDate startDate, LocalDate endDate);

    Optional<Payment> findByTransactionId(String transactionId);

    @Query("SELECT SUM(p.amount) FROM Payment p")
    Double getTotalIncome();

    //for member itself
    List<Payment> findByMember(Member member);


    @Query("""
        SELECT COALESCE(SUM(p.amount),0)
        FROM Payment p
        WHERE p.member.memberId = :memberId
        AND p.paymentDate BETWEEN :start AND :end
        """)
    double sumPaymentsForCurrentCycle(UUID memberId,
                                      LocalDate start,
                                      LocalDate end);

    List<Payment> findByMemberMemberId(UUID memberId);

    //for admin dashboard
    @Query("""
SELECT COALESCE(SUM(p.amount),0)
FROM Payment p
WHERE MONTH(p.paymentDate)=:month
AND YEAR(p.paymentDate)=:year
""")
    double sumRevenueByMonth(int month, int year);

    //for admin dashboard
    @Query("""
SELECT p.method, SUM(p.amount)
FROM Payment p
GROUP BY p.method
""")
    List<Object[]> paymentMethodDistribution();



    //for member dashboard
    @Query("""
       SELECT COALESCE(SUM(p.amount),0) 
       FROM Payment p 
       WHERE p.member.memberId = :memberId 
       AND p.success = true
       """)
    Double totalPaidByMember(@Param("memberId") UUID memberId);

    @Query("""
       SELECT MAX(p.paymentDate) 
       FROM Payment p 
       WHERE p.member.memberId = :memberId 
       AND p.success = true
       """)
    LocalDate lastPaymentDate(@Param("memberId") UUID memberId);
}
