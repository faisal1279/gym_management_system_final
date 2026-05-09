package com.brightnest.gymmanagementsystem.repository;

import com.brightnest.gymmanagementsystem.model.gymClass.ClassSchedule;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ClassSheduleRepository extends JpaRepository<ClassSchedule, UUID> {
}
