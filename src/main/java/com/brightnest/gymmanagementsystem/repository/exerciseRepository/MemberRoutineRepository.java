package com.brightnest.gymmanagementsystem.repository.exerciseRepository;

import com.brightnest.gymmanagementsystem.model.Member;
import com.brightnest.gymmanagementsystem.model.exerciseModel.MemberRoutine;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface MemberRoutineRepository extends JpaRepository<MemberRoutine, UUID> {
    List<MemberRoutine> findByMemberAndActiveTrue(Member member);
}
