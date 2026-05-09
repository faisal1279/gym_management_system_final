package com.brightnest.gymmanagementsystem.controller;

import com.brightnest.gymmanagementsystem.model.blog.Blog;
import com.brightnest.gymmanagementsystem.service.BlogService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class AdminBlogController {

    private final BlogService blogService;

//    @GetMapping("/admin/blogs")
//    public String blogList(Model model,@RequestParam(defaultValue = "0") int page) {
//        Pageable pageable = PageRequest.of(page, 5);
//        Page<Blog> blogs = blogService.getAllBlogs(pageable);
//
//        model.addAttribute("blogs", blogs.getContent());
//        model.addAttribute("currentPage", page);
//        model.addAttribute("totalPages", blogs.getTotalPages());
//        return "admin/blog/blog-list";
//    }
@GetMapping("/admin/blogs")
public String adminBlogs(
        @RequestParam(defaultValue = "") String keyword,
        @RequestParam(required = false) String category,
        @RequestParam(required = false) Boolean published,
        @RequestParam(defaultValue = "0") int page,
        Model model) {

    Pageable pageable = PageRequest.of(page, 5);

    Page<Blog> blogs = blogService.searchAdminBlogs(keyword, category, published, pageable);

    // 🔥 dynamic categories
    List<String> categories = blogService.getAllCategories();

    model.addAttribute("blogs", blogs.getContent());
    model.addAttribute("currentPage", page);
    model.addAttribute("totalPages", blogs.getTotalPages());

    model.addAttribute("keyword", keyword);
    model.addAttribute("category", category);
    model.addAttribute("published", published);
    model.addAttribute("categories", categories);

    return "admin/blog/blog-list";
}
    @GetMapping("/admin/blog/create")
    public String createBlogPage(Model model) {
        return "admin/blog/create-blog";
    }
    // Create blog POST
    @PostMapping("/admin/blog/create")
    public String createBlog(
            @RequestParam String title,
            @RequestParam String content,
            @RequestParam String category,
            @RequestParam(required = false) MultipartFile coverImage,
            @RequestParam(required = false) List<MultipartFile> images,
            @RequestParam(defaultValue = "false") boolean published,
            Principal principal,
            RedirectAttributes redirectAttributes
    ) {
        try {
            blogService.createBlog(
                    title,
                    content,
                    category,
                    coverImage,
                    images,
                    published,
                    principal.getName()
            );

            redirectAttributes.addAttribute("success", "Blog created successfully!");
        } catch (Exception e) {
            redirectAttributes.addAttribute("error", e.getMessage());
        }

        return "redirect:/admin/blogs";
    }
    @GetMapping("/admin/blog/view/{id}")
    public String viewBlogPage(@PathVariable UUID id, Model model) {
        model.addAttribute("blog",blogService.getBlog(id));
        return "admin/blog/view-blog";
    }
    @GetMapping("/admin/blog/edit/{id}")
    public String editBlog(
            @PathVariable UUID id,
            Model model
    ) {

        model.addAttribute("blog",
                blogService.getBlog(id));

        return "admin/blog/blog-edit";
    }
    // Update blog POST
    @PostMapping("/admin/blog/update/{id}")
    public String updateBlog(
            @PathVariable UUID id,
            @RequestParam String title,
            @RequestParam String content,
            @RequestParam String category,
            @RequestParam(required = false) MultipartFile coverImage,
            @RequestParam(required = false) List<MultipartFile> images,
            Principal principal,
            RedirectAttributes redirectAttributes
    ) {
        try {
            blogService.updateBlog(
                    id,
                    title,
                    content,
                    category,
                    coverImage,
                    images,
                    principal.getName()
            );
            redirectAttributes.addAttribute("success", "Blog updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addAttribute("error", e.getMessage());
        }

        return "redirect:/admin/blogs";
    }

    // Delete blog
    @GetMapping("/admin/blog/delete/{id}")
    public String deleteBlog(@PathVariable UUID id,
                             Principal principal,
                             RedirectAttributes redirectAttributes) {
        try {
            blogService.deleteBlog(id, principal.getName());
            redirectAttributes.addAttribute("success", "Blog deleted successfully!");
        } catch (Exception e) {
            redirectAttributes.addAttribute("error", e.getMessage());
        }
        return "redirect:/admin/blogs";
    }

    // Delete single blog image
    @GetMapping("/admin/blog/image/delete/{id}")
    public String deleteImage(@PathVariable UUID id,
                              RedirectAttributes redirectAttributes) {
        try {
            blogService.deleteBlogImage(id);
            redirectAttributes.addAttribute("success", "Image deleted successfully!");
        } catch (Exception e) {
            redirectAttributes.addAttribute("error", e.getMessage());
        }
        return "redirect:/admin/blogs";
    }
}
