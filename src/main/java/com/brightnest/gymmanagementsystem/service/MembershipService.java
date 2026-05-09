package com.brightnest.gymmanagementsystem.service;

import com.brightnest.gymmanagementsystem.model.Membership;
import com.brightnest.gymmanagementsystem.model.MembershipFeature;
import com.brightnest.gymmanagementsystem.repository.MembershipRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RequiredArgsConstructor
@Service
public class MembershipService {
    private final MembershipRepository membershipRepository;

    public void createMembership(String name,int duration,double price,List<String> features) {
        Membership membership = new Membership();
        membership.setName(name);
        membership.setDurationInDays(duration);
        membership.setPrice(price);
        membership.setActive(true);

        List<MembershipFeature> featureList = new ArrayList<>();
        for (String f : features) {
            if (f != null && !f.isBlank()) {

                MembershipFeature feature = new MembershipFeature();
                feature.setFeatureName(f);
                feature.setMembership(membership);

                featureList.add(feature);
            }
        }
        membership.setFeatures(featureList);
        membershipRepository.save(membership);
    }
    public void updateMembership(
            UUID id,
            String name,
            int duration,
            double price,
            List<String> features) {

        Membership membership = membershipRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Membership not found"));

        // Update basic info
        membership.setName(name);
        membership.setDurationInDays(duration);
        membership.setPrice(price);

        // 🔥 IMPORTANT: clear old features
        membership.getFeatures().clear();

        // Add new features
        List<MembershipFeature> newFeatures = new ArrayList<>();

        for (String f : features) {
            if (f != null && !f.isBlank()) {

                MembershipFeature feature = new MembershipFeature();
                feature.setFeatureName(f);
                feature.setMembership(membership);

                newFeatures.add(feature);
            }
        }

        membership.getFeatures().addAll(newFeatures);

        membershipRepository.save(membership);
    }
    public void deleteMembership(UUID id) {

        Membership membership = membershipRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Membership not found"));

        membership.setActive(false); // deactivate
        membershipRepository.save(membership);
    }

    public List<Membership> getAllMemberships() {
        return membershipRepository.findAll();
    }

    public List<Membership> getAllActiveMemberships() {
        return membershipRepository.findByActiveTrue();
    }

    // ✅ Latest 3 (home page)
    public List<Membership> getLatest3() {
        return membershipRepository
                .findTop3ByActiveTrueOrderByMembershipIdDesc();
    }

}
