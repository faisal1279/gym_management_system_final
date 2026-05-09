package com.brightnest.gymmanagementsystem.dto;

import com.brightnest.gymmanagementsystem.model.Member;
import lombok.*;

@NoArgsConstructor
@Data
@AllArgsConstructor
@ToString
public class MemberAdminView {
    private Member member;     // original data
    private boolean active;
    private boolean paid;      // calculated (active or not)
    private long daysLeft;     // calculated




}
