package com.brightnest.gymmanagementsystem.service.exerciseService;

import com.brightnest.gymmanagementsystem.model.*;
import com.brightnest.gymmanagementsystem.model.exerciseModel.MemberRoutine;
import com.brightnest.gymmanagementsystem.model.exerciseModel.RoutineTemplate;
import com.brightnest.gymmanagementsystem.repository.*;
import com.brightnest.gymmanagementsystem.repository.exerciseRepository.MemberRoutineRepository;
import com.brightnest.gymmanagementsystem.repository.exerciseRepository.RoutineTemplateRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class MemberRoutineService {

    private final MemberRoutineRepository memberRoutineRepository;
    private final MemberRepository memberRepository;
    private final RoutineTemplateRepository templateRepository;

    public void assignRoutine(
            UUID memberId,
            UUID templateId){

        Member member = memberRepository.findById(memberId)
                .orElseThrow(() ->
                        new RuntimeException("Member not found"));

        RoutineTemplate template = templateRepository.findById(templateId)
                .orElseThrow(() ->
                        new RuntimeException("Template not found"));

        MemberRoutine routine = new MemberRoutine();

        routine.setMember(member);
        routine.setTemplate(template);
        routine.setStartDate(LocalDate.now());
        routine.setActive(true);

        memberRoutineRepository.save(routine);

        member.setRoutineTemplate(template);
        memberRepository.save(member);
    }

    public List<MemberRoutine> getMemberRoutine(UUID memberId){

        Member member = memberRepository.findById(memberId)
                .orElseThrow(() ->
                        new RuntimeException("Member not found"));

        return memberRoutineRepository.findByMemberAndActiveTrue(member);
    }


}
