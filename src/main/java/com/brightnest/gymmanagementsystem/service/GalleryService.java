package com.brightnest.gymmanagementsystem.service;

import com.brightnest.gymmanagementsystem.model.GalleryImage;
import com.brightnest.gymmanagementsystem.model.GalleryVideo;
import com.brightnest.gymmanagementsystem.repository.GalleryImageRepository;
import com.brightnest.gymmanagementsystem.repository.GalleryVideoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class GalleryService {

    private final GalleryVideoRepository galleryVideoRepository;
    private final GalleryImageRepository galleryImageRepository;

    public void saveImage(List<MultipartFile> files, String title, String description, String category) throws Exception{

        if(files == null || files.isEmpty()) return;

        String uploadDir = "uploads/gallery/";
        Files.createDirectories(Paths.get(uploadDir));

        for(MultipartFile file : files){
            if(file.isEmpty()) continue;
            String fileName = UUID.randomUUID()+ "_" + file.getOriginalFilename();

            Path path = Paths.get(uploadDir, fileName);
            Files.write(path, file.getBytes());

            GalleryImage img = new GalleryImage();
            img.setImageUrl(fileName);
            img.setTitle(title);
            img.setDescription(description);
            img.setCategory(category);
            img.setCreatedAt(LocalDateTime.now());
            galleryImageRepository.save(img);
        }
    }

    public List<GalleryImage> getAllImage(){
        return galleryImageRepository.findAll();
    }
    public GalleryImage getImageById(UUID id){
        return galleryImageRepository.findById(id).orElseThrow(() -> new RuntimeException("Image not found"));
    }
    public void updateImage(UUID id, String title, String description, String category){
        GalleryImage img = getImageById(id);
        img.setTitle(title);
        img.setDescription(description);
        img.setCategory(category);
        galleryImageRepository.save(img);
    }
    public void deleteImage(UUID id){
        galleryImageRepository.deleteById(id);
    }

//    Video
    public void saveVideo(String url,String title, String description, String category) throws Exception{

        GalleryVideo video = new GalleryVideo();
        video.setVideoUrl(url);
        video.setTitle(title);
        video.setDescription(description);
        video.setCategory(category);
        video.setCreatedAt(LocalDateTime.now());
        galleryVideoRepository.save(video);
    }
    public List<GalleryVideo> getAllVideo(){
        return galleryVideoRepository.findAll();
    }
    public GalleryVideo getVideoById(UUID id){
        return galleryVideoRepository.findById(id).orElseThrow(() -> new RuntimeException("Video not found"));
    }
    public void updateVideo(UUID id,String url, String title, String description, String category) throws Exception{
        GalleryVideo video = getVideoById(id);
        video.setVideoUrl(url);
        video.setTitle(title);
        video.setDescription(description);
        video.setCategory(category);
        galleryVideoRepository.save(video);
    }
    public void deleteVideo(UUID id){
        galleryVideoRepository.deleteById(id);
    }
}
