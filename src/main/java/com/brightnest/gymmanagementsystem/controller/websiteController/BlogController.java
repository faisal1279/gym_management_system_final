package com.brightnest.gymmanagementsystem.controller.websiteController;

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
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class BlogController {

    private final BlogService blogService;

    @GetMapping("/blogs")
    public String blogs(
            @RequestParam(defaultValue = "") String keyword,
            @RequestParam(required = false) String category,
            @RequestParam(defaultValue = "0") int page,
            Model model) {

        Pageable pageable = PageRequest.of(page, 6);

        Page<Blog> blogs = blogService.searchBlogs(keyword, category, pageable);

        //  dynamic categories
        List<String> categories = blogService.getAllCategories();

        model.addAttribute("blogs", blogs.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", blogs.getTotalPages());

        model.addAttribute("keyword", keyword);
        model.addAttribute("category", category);
        model.addAttribute("categories", categories);

        return "website/blog/blogs";
    }

    // Blog Details
    @GetMapping("/blog/{id}")
    public String blogDetails(@PathVariable UUID id, Model model){

        Blog blog = blogService.getBlog(id);

        List<String> paragraphs = List.of(blog.getContent().split("\\n"));

        model.addAttribute("blog", blog);
        model.addAttribute("paragraphs", paragraphs);

        return "website/blog/blog-details";
    }
}
