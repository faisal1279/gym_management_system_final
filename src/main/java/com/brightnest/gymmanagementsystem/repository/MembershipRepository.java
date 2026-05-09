package com.brightnest.gymmanagementsystem.repository;

import com.brightnest.gymmanagementsystem.model.Membership;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface MembershipRepository extends JpaRepository<Membership, UUID> {
    List<Membership> findByActiveTrue();
    List<Membership> findTop3ByActiveTrueOrderByMembershipIdDesc();
}
