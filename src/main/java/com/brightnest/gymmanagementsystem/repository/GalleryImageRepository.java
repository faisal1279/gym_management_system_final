package com.brightnest.gymmanagementsystem.repository;

import com.brightnest.gymmanagementsystem.model.GalleryImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface GalleryImageRepository extends JpaRepository<GalleryImage, UUID> {
}
