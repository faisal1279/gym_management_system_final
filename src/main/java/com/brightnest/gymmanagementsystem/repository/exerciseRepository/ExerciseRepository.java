package com.brightnest.gymmanagementsystem.repository.exerciseRepository;

import com.brightnest.gymmanagementsystem.model.exerciseModel.Exercise;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ExerciseRepository extends JpaRepository<Exercise, UUID> {

    Page<Exercise> findByActiveTrue(Pageable pageable);

    @Query("""
        SELECT e FROM Exercise e
        WHERE
        (:keyword = '' OR LOWER(e.name) LIKE LOWER(CONCAT('%', :keyword, '%')))
        AND
        (:active IS NULL OR e.active = :active)
        """)
    Page<Exercise> searchExercises(
            @Param("keyword") String keyword,
            @Param("active") Boolean active,
            Pageable pageable);
}
