package com.brightnest.gymmanagementsystem.repository.blog;

import com.brightnest.gymmanagementsystem.model.blog.Blog;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface BlogRepository extends JpaRepository<Blog, UUID> {

    Page<Blog> findByPublishedTrueOrderByCreatedAtDesc(Pageable pageable);
    List<Blog> findTop3ByPublishedTrueOrderByCreatedAtDesc();
    Page<Blog> findAllByOrderByCreatedAtDesc(Pageable pageable);

    @Query("SELECT DISTINCT b.category FROM Blog b WHERE b.published = true")
    List<String> findDistinctCategories();

    // public site blogs query
    @Query("""
        SELECT b FROM Blog b
        WHERE b.published = true
        AND (
            :keyword = '' OR
            LOWER(b.title) LIKE LOWER(CONCAT('%', :keyword, '%')) OR
            LOWER(b.content) LIKE LOWER(CONCAT('%', :keyword, '%'))
        )
        AND (
            :category IS NULL OR :category = '' OR b.category = :category
        )
        """)
    Page<Blog> searchBlogs(
            @Param("keyword") String keyword,
            @Param("category") String category,
            Pageable pageable
    );

    //admin blogs search,pagination,get all
    @Query("""
            SELECT b FROM Blog b
            WHERE
            (:keyword = '' OR LOWER(b.title) LIKE LOWER(CONCAT('%', :keyword, '%')))
            AND
            (:category IS NULL OR :category = '' OR b.category = :category)
            AND
            (:published IS NULL OR b.published = :published)
            """)
    Page<Blog> searchAdminBlogs(
            @Param("keyword") String keyword,
            @Param("category") String category,
            @Param("published") Boolean published,
            Pageable pageable);
}
