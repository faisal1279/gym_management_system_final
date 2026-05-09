package com.brightnest.gymmanagementsystem.service;

import com.brightnest.gymmanagementsystem.model.User;
import com.brightnest.gymmanagementsystem.model.blog.Blog;
import com.brightnest.gymmanagementsystem.model.blog.BlogImage;
import com.brightnest.gymmanagementsystem.repository.UserRepository;
import com.brightnest.gymmanagementsystem.repository.blog.BlogImageRepository;
import com.brightnest.gymmanagementsystem.repository.blog.BlogRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
public class BlogService {
    private final BlogRepository blogRepository;
    private final BlogImageRepository blogImageRepository;
    private final UserRepository userRepository;

    //admin create blog
    public void createBlog(String title, String content, String category,MultipartFile coverImage ,List<MultipartFile> images, boolean published,String email) {

        User user = userRepository.findByEmail(email);

        if(user==null){
            throw new RuntimeException("User not found");
        }
        if(!"ROLE_ADMIN".equals(user.getRole())){
            throw new RuntimeException("User is not admin");
        }
        Blog blog = new Blog();
        blog.setTitle(title);
        blog.setContent(content);
        blog.setCategory(category);
        blog.setPublished(published);
        blog.setCreatedAt(LocalDateTime.now());
        blog.setAuthor(user);
        Blog savedBlog = blogRepository.save(blog);

        try {
            saveCoverImage(savedBlog,coverImage);
            saveImage(savedBlog,images);
        }catch (Exception e){
            throw new RuntimeException("Image upload failed");
        }
    }

    //public website get blog list
    public Page<Blog> searchBlogs(String keyword, String category, Pageable pageable) {

        if ((keyword == null || keyword.isEmpty()) && (category == null || category.isEmpty())) {
            return blogRepository.findByPublishedTrueOrderByCreatedAtDesc(pageable);
        }

        return blogRepository.searchBlogs(keyword, category, pageable);
    }

//    public Page<Blog> getAllPublishedBlogs(Pageable pageable) {
//        return blogRepository.findByPublishedTrueOrderByCreatedAtDesc(pageable);
//    }

    //public blog category list in search bar
    public List<String> getAllCategories() {
        return blogRepository.findDistinctCategories();
    }

    public Page<Blog> getAllBlogs(Pageable pageable) {
        return blogRepository.findAllByOrderByCreatedAtDesc(pageable);
    }

    public Page<Blog> searchAdminBlogs(
            String keyword,
            String category,
            Boolean published,
            Pageable pageable) {

        if (keyword == null) keyword = "";
        if (category == null) category = "";

        return blogRepository.searchAdminBlogs(keyword, category, published, pageable);
    }

    public Blog getBlog(UUID id) {
        return blogRepository.findById(id).orElseThrow(() -> new RuntimeException("Blog not found"));
    }
    //update blog
    private final String uploadDir = "uploads/blog/";

    // UPDATE BLOG
    public void updateBlog(
            UUID blogId,
            String title,
            String content,
            String category,
            MultipartFile coverImage,          // cover image optional
            List<MultipartFile> images,        // multiple images optional
            String email
    ) {

        // Check admin
        User admin = userRepository.findByEmail(email);
        if (admin == null)
            throw new RuntimeException("User not found");
        if (!"ROLE_ADMIN".equals(admin.getRole()))
            throw new RuntimeException("Only admin can update blog");

        // Find blog
        Blog blog = blogRepository.findById(blogId)
                .orElseThrow(() -> new RuntimeException("Blog not found"));

        blog.setTitle(title);
        blog.setContent(content);
        blog.setCategory(category);
        blog.setUpdatedAt(LocalDateTime.now());

        Blog savedBlog = blogRepository.save(blog);

        // Upload images
        try {
            saveCoverImage(savedBlog, coverImage);
            saveImage(savedBlog, images);
        } catch (Exception e) {
            throw new RuntimeException("Image upload failed");
        }
    }
    private void saveCoverImage(Blog blog,
                                MultipartFile file) throws Exception {

        if (file == null || file.isEmpty()) return;

        String uploadDir = "uploads/blog/";
        Files.createDirectories(Paths.get(uploadDir));

        String fileName =
                UUID.randomUUID() + "_" + file.getOriginalFilename();

        Path path = Paths.get(uploadDir + fileName);

        Files.write(path, file.getBytes());

        blog.setCoverImage(fileName);

        blogRepository.save(blog);
    }
    private void saveImage(Blog blog,List<MultipartFile> images) throws Exception {
        if(images==null || images.isEmpty()) return;

        String uploadDir = "uploads/blog/";
        Files.createDirectories(Paths.get(uploadDir));

        for (MultipartFile file : images) {
            if(file.isEmpty()) continue;

            String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();

            Path path = Paths.get(uploadDir + fileName);

            Files.write(path, file.getBytes());

            BlogImage image = new BlogImage();
            image.setImageUrl(fileName);
            image.setBlog(blog);
            blogImageRepository.save(image);
        }
    }
    // DELETE BLOG
    public void deleteBlog(UUID blogId, String email) {

        User admin = userRepository.findByEmail(email);

        if (admin == null)
            throw new RuntimeException("User not found");

        if (!"ROLE_ADMIN".equals(admin.getRole()))
            throw new RuntimeException("Only admin can delete blog");

        Blog blog = blogRepository.findById(blogId)
                .orElseThrow(() ->
                        new RuntimeException("Blog not found"));

        List<BlogImage> images =
                blogImageRepository.findByBlog(blog);

        for (BlogImage img : images) {

            Path path =
                    Paths.get(uploadDir + img.getImageUrl());

            try {
                Files.deleteIfExists(path);
            } catch (Exception ignored) {
            }

            blogImageRepository.delete(img);
        }

        blogRepository.delete(blog);
    }
    public void deleteBlogImage(UUID imageId) {

        BlogImage image = blogImageRepository.findById(imageId)
                .orElseThrow(() ->
                        new RuntimeException("Image not found"));

        Path path = Paths.get(uploadDir + image.getImageUrl());

        try {
            Files.deleteIfExists(path);
        } catch (Exception ignored) {
        }

        blogImageRepository.delete(image);
    }
    //3 latest blog
    public List<Blog> getLatestBlogs(int limit){
        return blogRepository.findTop3ByPublishedTrueOrderByCreatedAtDesc();
    }
}
