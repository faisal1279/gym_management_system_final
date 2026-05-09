package com.brightnest.gymmanagementsystem.service;

import com.brightnest.gymmanagementsystem.model.*;
import com.brightnest.gymmanagementsystem.model.trainer.Trainer;
import com.brightnest.gymmanagementsystem.model.trainer.TrainerAchievement;
import com.brightnest.gymmanagementsystem.model.trainer.TrainerSkill;
import com.brightnest.gymmanagementsystem.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.time.LocalDate;
import java.util.*;

@RequiredArgsConstructor
@Service
public class TrainerService {

    private final TrainerRepository trainerRepository;
    private final UserRepository userRepository;
    private final MemberRepository memberRepository;
    private final AttendanceRepository attendanceRepository;
    private final MemberProgressRepository progressRepository;

    public void createTrainer(
            UUID userId,
            int experienceYears,
            String specialization,
            int salary,
            String bio,
            List<String> skills,
            List<Integer> percentages,
            List<String> achievements
    ) {

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        if (trainerRepository.findByUser_Id(userId).isPresent()) {
            throw new RuntimeException("Trainer already exists");
        }

        user.setRole("ROLE_TRAINER");
        userRepository.save(user);

        Trainer trainer = new Trainer();
        trainer.setUser(user);
        trainer.setExperienceYears(experienceYears);
        trainer.setSpecialization(specialization);
        trainer.setSalary(salary);
        trainer.setBio(bio);
        trainer.setActive(true);
        trainer.setRating(0);
        trainer.setTotalReviews(0);

        //  Skills with percentage
        List<TrainerSkill> skillList = new ArrayList<>();

        if (skills != null) {
            for (int i = 0; i < skills.size(); i++) {

                String s = skills.get(i);
                Integer p = (percentages != null && i < percentages.size())
                        ? percentages.get(i) : 0;

                if (s != null && !s.isBlank()) {
                    TrainerSkill skill = new TrainerSkill();
                    skill.setSkillName(s);
                    skill.setPercentage(p != null ? p : 0);
                    skill.setTrainer(trainer);
                    skillList.add(skill);
                }
            }
        }

        //  Achievements
        List<TrainerAchievement> achievementList = new ArrayList<>();

        if (achievements != null) {
            for (String a : achievements) {
                if (a != null && !a.isBlank()) {
                    TrainerAchievement achievement = new TrainerAchievement();
                    achievement.setTitle(a);
                    achievement.setTrainer(trainer);
                    achievementList.add(achievement);
                }
            }
        }

        trainer.setSkills(skillList);
        trainer.setAchievements(achievementList);

        trainerRepository.save(trainer);
    }
    public void updateTrainer(
            UUID trainerId,
            int experienceYears,
            String specialization,
            int salary,
            String bio,
            List<String> skills,
            List<Integer> percentages,
            List<String> achievements
    ) {

        Trainer trainer = trainerRepository.findById(trainerId)
                .orElseThrow(() -> new RuntimeException("Trainer not found"));

        trainer.setExperienceYears(experienceYears);
        trainer.setSpecialization(specialization);
        trainer.setSalary(salary);
        trainer.setBio(bio);

        //  Clear old data
        trainer.getSkills().clear();
        trainer.getAchievements().clear();

        //  Skills update
        if (skills != null) {
            for (int i = 0; i < skills.size(); i++) {

                String s = skills.get(i);
                Integer p = (percentages != null && i < percentages.size())
                        ? percentages.get(i) : 0;

                if (s != null && !s.isBlank()) {
                    TrainerSkill skill = new TrainerSkill();
                    skill.setSkillName(s);
                    skill.setPercentage(p != null ? p : 0);
                    skill.setTrainer(trainer);
                    trainer.getSkills().add(skill);
                }
            }
        }

        //  Achievements update
        if (achievements != null) {
            for (String a : achievements) {
                if (a != null && !a.isBlank()) {
                    TrainerAchievement achievement = new TrainerAchievement();
                    achievement.setTitle(a);
                    achievement.setTrainer(trainer);
                    trainer.getAchievements().add(achievement);
                }
            }
        }

        trainerRepository.save(trainer);
    }
    // Get all trainers
//    public Page<Trainer> getAllTrainers(Pageable pageable) {
//        return trainerRepository.findAll(pageable);
//    }
    public Page<Trainer> searchTrainers(String keyword, Boolean active, Pageable pageable) {

        if (keyword == null) {
            keyword = "";
        }

        return trainerRepository.searchTrainers(keyword, active, pageable);
    }

    //get active trainers
    public List<Trainer> getAllActiveTrainers() {
        return trainerRepository.findAllByActiveTrue();
    }
    // Get trainer by ID
    public Trainer getTrainerById(UUID trainerId) {
        return trainerRepository.findById(trainerId)
                .orElseThrow(() -> new RuntimeException("Trainer not found"));
    }
    public List<Trainer> getLatestTrainers(int limit) {
        List<Trainer> all = trainerRepository.findAllByActiveTrue();
        return all.stream().limit(limit).toList();
    }

    // Toggle trainer active status
    public boolean toggleTrainer(UUID trainerId) {
        Trainer trainer = getTrainerById(trainerId);
        trainer.setActive(!trainer.isActive());
        trainerRepository.save(trainer);
        return trainer.isActive();
    }

    // Get all active trainers
    public List<Trainer> getActiveTrainers() {
        return trainerRepository.findAllByActiveTrue();
    }

    // Count members of a trainer
    public long getMemberCount(UUID trainerId) {
        return memberRepository.countByTrainer_TrainerId(trainerId);
    }

    // Trainer performance
    public List<Map<String, Object>> getTrainerPerformance() {
        List<Object[]> data = trainerRepository.trainerWithMemberCount();
        List<Map<String, Object>> list = new ArrayList<>();

        for (Object[] row : data) {
            Trainer trainer = (Trainer) row[0];
            Long count = (Long) row[1];

            Map<String, Object> map = new HashMap<>();
            map.put("trainer", trainer);
            map.put("count", count);
            list.add(map);
        }
        return list;
    }

    // Get logged-in trainer by principal
    public Trainer getLoggedInTrainer(Principal principal) {
        return trainerRepository.findByUser_Email(principal.getName())
                .orElseThrow(() -> new RuntimeException("Trainer not found"));
    }

    // Update attendance
    public void updateAttendanceByTrainer(UUID attendanceId, boolean present, Trainer trainer) {
        Attendance attendance = attendanceRepository.findById(attendanceId)
                .orElseThrow(() -> new RuntimeException("Attendance not found"));

        if (attendance.getMember().getTrainer() == null ||
                !attendance.getMember().getTrainer().getTrainerId().equals(trainer.getTrainerId())) {
            throw new RuntimeException("Unauthorized action");
        }

        attendance.setPresent(present);
        attendanceRepository.save(attendance);
    }
    // Calculate attendance percentage for a member
    public double calculateAttendancePercentage(UUID memberId) {
        int total = attendanceRepository.countByMember_MemberId(memberId);
        int present = attendanceRepository.countByMember_MemberIdAndPresent(memberId,true);

        if(total == 0) return 0;
        return ((double) present / total) * 100;
    }
    //get member
//    public List<MemberProgress> getMemberProgress(UUID memberId) {
//        return progressRepository.findByMember_MemberIdOrderByRecordDateDesc(memberId);
//    }
    // Get member progress with trainer validation
    public List<MemberProgress> getMemberProgress(UUID memberId, Principal principal) {
        Trainer trainer = getLoggedInTrainer(principal);

        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new RuntimeException("Member not found"));

        if(member.getTrainer() == null ||
                !member.getTrainer().getTrainerId().equals(trainer.getTrainerId())) {
            throw new RuntimeException("Unauthorized access");
        }

        return progressRepository.findByMember_MemberIdOrderByRecordDateDesc(memberId);
    }
    public MemberProgress getLatestProgress(Member member){
        return progressRepository
                .findTopByMemberOrderByRecordDateDesc(member);
    }

    // Add member progress (weight, body fat, BMI)
    public void addMemberProgress(UUID memberId, double weight, double bodyFat,String notes, Principal principal) {
        Trainer trainer = getLoggedInTrainer(principal);

        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new RuntimeException("Member not found"));

        if(member.getTrainer() == null ||
                !member.getTrainer().getTrainerId().equals(trainer.getTrainerId())) {
            throw new RuntimeException("Unauthorized: Cannot update this member's progress");
        }

        if(member.getHeight() <= 0) {
            throw new RuntimeException("Invalid member height. Cannot calculate BMI");
        }

        MemberProgress progress = new MemberProgress();
        progress.setMember(member);
        progress.setWeight(weight);
        progress.setBodyFat(bodyFat);
        progress.setRecordDate(LocalDate.now());
        progress.setNotes(notes);
        progress.setBmi(weight / Math.pow(member.getHeight(), 2));

        progressRepository.save(progress);
    }
    //get memberProgress check
    public MemberProgress getMemberProgressById(UUID progressId, Principal principal) {
        Trainer trainer = getLoggedInTrainer(principal);

        MemberProgress progress = progressRepository.findById(progressId)
                .orElseThrow(() -> new RuntimeException("Progress not found"));

        Member member = progress.getMember();

        if(member.getTrainer() == null ||
                !member.getTrainer().getTrainerId().equals(trainer.getTrainerId())) {
            throw new RuntimeException("Unauthorized access");
        }

        return progress;
    }
    //update progress
    public void updateProgress(UUID progressId,double weight,double bodyFat,String notes,Principal principal) {

        Trainer trainer = getLoggedInTrainer(principal);

        MemberProgress progress = progressRepository.findById(progressId)
                .orElseThrow(() -> new RuntimeException("Progress not found"));

        Member member = progress.getMember();

        if(member.getTrainer() == null || !member.getTrainer().getTrainerId().equals(trainer.getTrainerId())) {
            throw new RuntimeException("Unauthorized: Cannot update this member's progress");
        }
        progress.setWeight(weight);
        progress.setNotes(notes);
        progress.setBodyFat(bodyFat);
        progress.setBmi(weight / Math.pow(member.getHeight(), 2));
        progressRepository.save(progress);

    }
    //delete progress
    public void deleteProgress(UUID progressId,Principal principal) {

        Trainer trainer = getLoggedInTrainer(principal);

        MemberProgress progress = progressRepository.findById(progressId)
                        .orElseThrow(() -> new RuntimeException("Progress not found"));

        Member member = progress.getMember();

        if (member.getTrainer() == null || !member.getTrainer().getTrainerId().equals(trainer.getTrainerId())) {
            throw new RuntimeException("Unauthorized: Cannot delete this member's progress");
        }
        progressRepository.deleteById(progressId);
    }
    // Count active members
    public long getActiveMembersCount(UUID trainerId) {
        return memberRepository.countByTrainer_TrainerId(trainerId);
    }
    //=====================Dashboard Data=====================

}
