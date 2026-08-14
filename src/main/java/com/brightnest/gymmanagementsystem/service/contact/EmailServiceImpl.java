package com.brightnest.gymmanagementsystem.service.contact;

import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;


@Service
@RequiredArgsConstructor
public class EmailServiceImpl implements EmailService{
    private final JavaMailSender mailSender;

    private final TemplateEngine templateEngine;

    @Override
    public void sendEmail(
            String to,
            String subject,
            String reply,
            String name
    ){

        try{

            Context context=new Context();

            context.setVariable("name",name);

            context.setVariable("reply",reply);

            String html=
                    templateEngine.process(
                            "email/reply-email",
                            context
                    );

            MimeMessage mimeMessage=
                    mailSender.createMimeMessage();

            MimeMessageHelper helper=
                    new MimeMessageHelper(
                            mimeMessage,
                            true
                    );

            helper.setTo(to);

            helper.setSubject(subject);

            helper.setText(html,true);

            mailSender.send(mimeMessage);

        }
        catch (Exception e){

            throw new RuntimeException(e);

        }

    }
}
