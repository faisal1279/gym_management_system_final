package com.brightnest.gymmanagementsystem.controller;

import com.brightnest.gymmanagementsystem.model.Attendance;
import com.brightnest.gymmanagementsystem.model.Member;
import com.brightnest.gymmanagementsystem.service.AttendanceService;
import com.brightnest.gymmanagementsystem.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class AttendanceController {
    private final AttendanceService attendanceService;
    private final MemberService memberService;


@GetMapping("/admin/attendance")
public String attendancePage(
        @RequestParam(required = false) LocalDate date,
        Model model) {

    LocalDate selectedDate = (date != null) ? date : LocalDate.now();

    List<Member> members = memberService.getActiveMembers();
    List<Attendance> attendanceList =
            attendanceService.getAttendanceByDate(selectedDate);

    // 🔹 attendanceMap: memberId -> present
    Map<UUID, Boolean> attendanceMap = new HashMap<>();
    for (Attendance a : attendanceList) {
        attendanceMap.put(
                a.getMember().getMemberId(),
                a.isPresent()
        );
    }

    model.addAttribute("date", selectedDate);
    model.addAttribute("members", members);
    model.addAttribute("attendanceList", attendanceList);
    model.addAttribute("attendanceMap", attendanceMap);

    return "admin/attendancePage";
}

    @PostMapping("/admin/attendance")
    public String submitAttendance(
            @RequestParam LocalDate date,
            @RequestParam Map<String, String> params) {

        Map<UUID, Boolean> attendanceMap = new HashMap<>();
        // 1️⃣ all active members → default false
        memberService.getActiveMembers().forEach(m ->
                attendanceMap.put(m.getMemberId(), false)
        );
        params.forEach((key, value) -> {
            if (key.startsWith("present_")) {
                UUID memberId =
                        UUID.fromString(key.replace("present_", ""));
                attendanceMap.put(memberId, value.equals("on"));
            }
        });

        attendanceService.markBulkAttendance(date, attendanceMap);

        return "redirect:/admin/attendance?date=" + date;
    }

@PostMapping("/admin/attendance/{id}/update")
public String updateAttendance(
        @PathVariable UUID id,
        @RequestParam boolean present,
        RedirectAttributes redirectAttributes) {

    attendanceService.updateAttendance(id, present);
    redirectAttributes.addFlashAttribute(
            "message", "Attendance updated successfully");

    return "redirect:/admin/attendance";
}
    @PostMapping("/admin/attendance/{id}/delete")
    public String deleteAttendance(
            @PathVariable UUID id,
            RedirectAttributes redirectAttributes) {

        attendanceService.deleteAttendance(id);
        redirectAttributes.addFlashAttribute(
                "message", "Attendance deleted");

        return "redirect:/admin/attendance";
    }

}
