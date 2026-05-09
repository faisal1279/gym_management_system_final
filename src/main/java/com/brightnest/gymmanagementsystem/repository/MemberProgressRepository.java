package com.brightnest.gymmanagementsystem.repository;

import com.brightnest.gymmanagementsystem.model.Member;
import com.brightnest.gymmanagementsystem.model.MemberProgress;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;
@Repository
public interface MemberProgressRepository extends JpaRepository<MemberProgress, UUID> {

    List<MemberProgress> findByMember_MemberIdOrderByRecordDateDesc(UUID memberId);

    MemberProgress findTopByMemberOrderByRecordDateDesc(Member member);

    List<MemberProgress> findByMember(Member member);
}
