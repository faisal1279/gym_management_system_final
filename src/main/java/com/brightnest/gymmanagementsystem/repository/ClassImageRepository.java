package com.brightnest.gymmanagementsystem.repository;

import com.brightnest.gymmanagementsystem.model.gymClass.ClassImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ClassImageRepository extends JpaRepository<ClassImage, UUID> {
}
