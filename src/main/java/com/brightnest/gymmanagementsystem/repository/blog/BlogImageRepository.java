package com.brightnest.gymmanagementsystem.repository.blog;

import com.brightnest.gymmanagementsystem.model.blog.Blog;
import com.brightnest.gymmanagementsystem.model.blog.BlogImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface BlogImageRepository extends JpaRepository<BlogImage, UUID> {
    List<BlogImage> findByBlog(Blog blog);
}
