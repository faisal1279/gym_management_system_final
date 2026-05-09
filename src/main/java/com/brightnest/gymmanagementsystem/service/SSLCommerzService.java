package com.brightnest.gymmanagementsystem.service;

import com.brightnest.gymmanagementsystem.model.Member;
import com.brightnest.gymmanagementsystem.model.Membership;
import com.brightnest.gymmanagementsystem.model.Payment;
import com.brightnest.gymmanagementsystem.model.User;
import com.brightnest.gymmanagementsystem.repository.MemberRepository;
import com.brightnest.gymmanagementsystem.repository.MembershipRepository;
import com.brightnest.gymmanagementsystem.repository.PaymentRepository;
import com.brightnest.gymmanagementsystem.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class SSLCommerzService {

    private final MemberService memberService;

    @Value("${ssl.store.id}")
    private String storeId;

    @Value("${ssl.store.password}")
    private String storePassword;

    private final UserRepository userRepository;
    private final MemberRepository memberRepository;
    private final MembershipRepository membershipRepository;
    private final PaymentRepository paymentRepository;



//public String initPayment(UUID membershipId, String email) {
//
//    User user = userRepository.findByEmail(email);
//
//    if(user == null){
//        throw new RuntimeException("User not found");
//    }
//
//    Member member = memberRepository.findByUser(user)
//            .orElseThrow(() -> new RuntimeException("Member not found"));
//
//    Membership membership = membershipRepository.findById(membershipId)
//            .orElseThrow(() -> new RuntimeException("Membership not found"));
//
//    String transactionId = UUID.randomUUID().toString();
//
//    // OPTIONAL: save payment PENDING (VERY IMPORTANT)
//    Payment payment = new Payment();
//    payment.setMember(member);
//    payment.setAmount(membership.getPrice());
//    payment.setMethod("SSLCommerz");
//    payment.setSuccess(false);
//    payment.setPaymentDate(LocalDate.now());
//    paymentRepository.save(payment);
//
//    String url = "https://sandbox.sslcommerz.com/gwprocess/v4/api.php";
//
//    RestTemplate restTemplate = new RestTemplate();
//
//    HttpHeaders headers = new HttpHeaders();
//    headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
//
//    MultiValueMap<String, String> data = new LinkedMultiValueMap<>();
//
//    data.add("store_id", storeId);
//    data.add("store_passwd", storePassword);
//
//    data.add("value_a", user.getEmail());
//
//    data.add("total_amount", String.valueOf(membership.getPrice()));
//    data.add("currency", "BDT");
//
//    // 🔥 IMPORTANT: use payment ID as tran_id
//    data.add("tran_id", payment.getPaymentId().toString());
//
//    data.add("success_url", "http://localhost:8080/payment/success");
//    data.add("fail_url", "http://localhost:8080/payment/fail");
//    data.add("cancel_url", "http://localhost:8080/payment/cancel");
//
//    data.add("cus_name", user.getFirstName());
//    data.add("cus_email", user.getEmail());
//    data.add("cus_phone", user.getPhone());
//
//    data.add("product_name", membership.getName());
//    data.add("product_category", "Membership");
//    data.add("product_profile", "general");
//
//    HttpEntity<MultiValueMap<String, String>> request =
//            new HttpEntity<>(data, headers);
//
//    ResponseEntity<String> response =
//            restTemplate.postForEntity(url, request, String.class);
//
//    JSONObject jsonObject = new JSONObject(response.getBody());
//
//    return jsonObject.getString("GatewayPageURL");
//}

    public String initPayment(UUID membershipId, String email) {

        User user = userRepository.findByEmail(email);

        if(user == null){
            throw new RuntimeException("User not found");
        }

        // FIRST get membership
        Membership membership = membershipRepository.findById(membershipId)
                .orElseThrow(() -> new RuntimeException("Membership not found"));

        Member member = memberRepository.findByUser(user)
                .orElseGet(() ->
                        memberService.createMemberForOnlinePayment(
                                user,
                                membership
                        )
                );

//        Membership membership = membershipRepository.findById(membershipId)
//                .orElseThrow(() -> new RuntimeException("Membership not found"));

        String transactionId = UUID.randomUUID().toString();

        // SAVE PENDING PAYMENT
        Payment payment = new Payment();

        payment.setMember(member);
        payment.setAmount(membership.getPrice());

        payment.setMethod("SSLCommerz");
        payment.setGateway("SSLCommerz");

        payment.setTransactionId(transactionId);

        payment.setSuccess(false);

        payment.setPaymentDate(LocalDate.now());

        paymentRepository.save(payment);

        String url = "https://sandbox.sslcommerz.com/gwprocess/v4/api.php";

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();

        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> data = new LinkedMultiValueMap<>();

        data.add("store_id", storeId);
        data.add("store_passwd", storePassword);

        data.add("total_amount",
                String.valueOf(membership.getPrice()));

        data.add("currency", "BDT");

        // IMPORTANT
        data.add("tran_id", transactionId);

        data.add("success_url",
                "http://localhost:8080/payment/success");

        data.add("fail_url",
                "http://localhost:8080/payment/fail");

        data.add("cancel_url",
                "http://localhost:8080/payment/cancel");

        data.add("cus_name", user.getFirstName());

        data.add("cus_email", user.getEmail());

        data.add("cus_phone", user.getPhone());

        data.add("product_name", membership.getName());

        data.add("product_category", "Membership");

        data.add("product_profile", "general");

        HttpEntity<MultiValueMap<String, String>> request =
                new HttpEntity<>(data, headers);

        ResponseEntity<String> response =
                restTemplate.postForEntity(
                        url,
                        request,
                        String.class
                );

        JSONObject jsonObject =
                new JSONObject(response.getBody());

        return jsonObject.getString("GatewayPageURL");
    }
}