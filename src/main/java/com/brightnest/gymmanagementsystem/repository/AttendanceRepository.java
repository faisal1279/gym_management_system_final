package com.brightnest.gymmanagementsystem.repository;

import com.brightnest.gymmanagementsystem.model.Attendance;
import com.brightnest.gymmanagementsystem.model.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface AttendanceRepository extends JpaRepository<Attendance, UUID> {


    //for admin
    List<Attendance> findByDate(LocalDate date);

    long countByDate(LocalDate date);

    @Query("SELECT COUNT(a) FROM Attendance a WHERE a.date = CURRENT_DATE")
    int todayAttendance();

    boolean existsByMember_MemberIdAndDate(UUID memberId, LocalDate date);

    Optional<Attendance> findByMemberAndDate(
            Member member, LocalDate date
    );

    List<Attendance> findAllByDate(LocalDate date);

    List<Attendance> findAllByDateBetween(
            LocalDate start, LocalDate end
    );

    List<Attendance> findAllByMember(Member member);


    //===============For member start=============
    //date wise list
    List<Attendance> findByMemberOrderByDateDesc(Member member);
    //month-wise filter
    List<Attendance> findByMemberAndDateBetween(Member member, LocalDate start, LocalDate end);
    long countByMemberAndDateBetweenAndPresentTrue(Member member, LocalDate start, LocalDate end);
    //===============For member end=============


    //===============for trainer=================
    int countByMember_MemberId(UUID memberId);
//    int countByMember_MemberIdAndStatus(UUID memberId, boolean status);
int countByMember_MemberIdAndPresent(UUID memberId, boolean present);

//================= for admin dashboard =================
@Query("SELECT a.date, COUNT(a) FROM Attendance a WHERE a.date >= :startDate GROUP BY a.date ORDER BY a.date")
List<Object[]> attendanceLast7Days(@Param("startDate") LocalDateTime startDate);

//for member dashboard
@Query("""
           SELECT COUNT(a) 
           FROM Attendance a 
           WHERE a.member.memberId = :memberId
           AND MONTH(a.date) = MONTH(CURRENT_DATE)
           AND YEAR(a.date) = YEAR(CURRENT_DATE)
           AND a.present = true
           """)
Long monthlyAttendanceCount(@Param("memberId") UUID memberId);
}