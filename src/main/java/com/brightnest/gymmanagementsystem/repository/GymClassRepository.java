package com.brightnest.gymmanagementsystem.repository;

import com.brightnest.gymmanagementsystem.model.gymClass.GymClass;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface GymClassRepository extends JpaRepository<GymClass, UUID> {
    List<GymClass> findByActiveTrueOrderByCreatedAtDesc();
}
