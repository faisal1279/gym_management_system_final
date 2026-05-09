package com.brightnest.gymmanagementsystem.service;

import com.brightnest.gymmanagementsystem.model.Attendance;
import com.brightnest.gymmanagementsystem.model.Member;
import com.brightnest.gymmanagementsystem.repository.AttendanceRepository;
import com.brightnest.gymmanagementsystem.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.time.format.TextStyle;
import java.util.*;

@RequiredArgsConstructor
@Service
public class AttendanceService {

    private final AttendanceRepository attendanceRepository;
    private final MemberRepository memberRepository;

    public void markAttendance(UUID memberId){
        Member member = memberRepository.findById(memberId)
                .orElseThrow( () -> new RuntimeException( "member not found" ) );

        LocalDate today = LocalDate.now();

        if(attendanceRepository.existsByMember_MemberIdAndDate(memberId,today)){
            throw new RuntimeException( "Attendance already marked today" );
        }
        Attendance attendance = new Attendance();
        attendance.setMember(member);
        attendance.setDate(today);
        attendance.setPresent(true);

        attendanceRepository.save(attendance);
    }
    public long todayAttendance(){
        return attendanceRepository.countByDate(LocalDate.now());
    }

    public List<Attendance> todayAttendanceList(){
        return attendanceRepository.findAllByDate(LocalDate.now());
    }

    //attendance bulk for trainer
    public void markBulkAttendance(LocalDate date,
                                   Map<UUID,Boolean> attendanceMap){
        for(UUID memberId : attendanceMap.keySet()){
            Member member = memberRepository.findById(memberId).orElseThrow();

            Attendance attendance = attendanceRepository.findByMemberAndDate(member,date)
                    .orElse(new Attendance());
//            if (date.isAfter(LocalDate.now())) {
//                throw new RuntimeException("Future attendance not allowed");
//            }
            if (date.isAfter(LocalDate.now())) {
                throw new IllegalArgumentException("Future attendance is not allowed");
            }
            attendance.setMember(member);
            attendance.setDate(date);
            attendance.setPresent(attendanceMap.get(memberId));

            attendanceRepository.save(attendance);
        }
    }
    public void updateAttendance(UUID attendanceId, boolean present) {
        Attendance a = attendanceRepository.findById(attendanceId)
                .orElseThrow();
        a.setPresent(present);
        attendanceRepository.save(a);
    }
    public void deleteAttendance(UUID id) {
        attendanceRepository.deleteById(id);
    }
    public List<Attendance> getAttendanceByDate(LocalDate date) {
        return attendanceRepository.findAllByDate(date);
    }

    public List<Attendance> getAttendanceByRange(
            LocalDate start, LocalDate end) {

        return attendanceRepository
                .findAllByDateBetween(start, end);
    }

    //======================For Member start===================================

    //all attendance
    public List<Attendance> getAttendanceMember(Member member) {
        return attendanceRepository.findByMemberOrderByDateDesc(member);
    }
    //month-wise attendance
    public List<Attendance> getMonthlyAttendanceByMember(Member member, YearMonth month) {
        LocalDate start = month.atDay(1);
        LocalDate end = month.atEndOfMonth();
        return attendanceRepository.findByMemberAndDateBetween(member,start, end);
    }
    //monthly percentage
    public double getMonthlyAttendancePercentage(Member member, YearMonth month) {

        LocalDate start = month.atDay(1);
        LocalDate end = month.atEndOfMonth();

        long total = attendanceRepository.countByMemberAndDateBetweenAndPresentTrue(member,start,end);

        if(total==0) return 0;

        long present = attendanceRepository.countByMemberAndDateBetweenAndPresentTrue(member,start,end);

        return (present * 100.0) / total;
    }
    //================== for admin dashboard =================
    public Map<String, Long> last7DaysAttendance() {
        // ১. ৭ দিনের আগের তারিখ
        LocalDate startDate = LocalDate.now().minusDays(6);
        // ২. LocalDate → LocalDateTime (00:00)
        LocalDateTime startDateTime = startDate.atStartOfDay();

        // ৩. Repository method call
        List<Object[]> results = attendanceRepository.attendanceLast7Days(startDateTime);

        // ৪. Map এ data সাজানো
        Map<String, Long> data = new LinkedHashMap<>();
        for (Object[] row : results) {
            LocalDate date = ((java.sql.Timestamp) row[0]).toLocalDateTime().toLocalDate(); // convert
            long count = ((Number) row[1]).longValue();

            data.put(
                    date.getDayOfMonth() + " " +
                            date.getMonth().getDisplayName(TextStyle.SHORT, Locale.ENGLISH),
                    count
            );
        }

        return data;
    }
}
