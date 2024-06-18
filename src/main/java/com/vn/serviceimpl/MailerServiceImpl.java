package com.vn.serviceimpl;

import java.io.File;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.vn.model.MailInfo;
import com.vn.service.MailerService;
import com.vn.utils.SessionService;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class MailerServiceImpl implements MailerService {
    @Autowired
    JavaMailSender sender;
    @Autowired
    SessionService SessionService;

    @Override
    public void send(MailInfo mail) {
        // Tạo message
        MimeMessage message = sender.createMimeMessage();
        // Sử dụng Helper để thiết lập các thông tin cần thiết cho message
        MimeMessageHelper helper;
        try {
            helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(mail.getFrom());
            helper.setTo(mail.getTo());
            helper.setSubject(mail.getSubject());
            helper.setText(mail.getBody(), true);
            helper.setReplyTo(mail.getFrom());
            String[] cc = mail.getCc();
            if (cc != null && cc.length > 0) {
                helper.setCc(cc);
            }
            String[] bcc = mail.getBcc();
            if (bcc != null && bcc.length > 0) {
                helper.setBcc(bcc);
            }
            String[] attachments = mail.getAttachments();
            if (attachments != null && attachments.length > 0) {
                for (String path : attachments) {
                    File file = new File(path);
                    helper.addAttachment(file.getName(), file);
                }
            }
            // Gửi message đến SMTP server
            sender.send(message);
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    @Override
    public void send(String to, String subject, String body) {
        this.send(new MailInfo(to, subject, body));
    }

    List<MailInfo> list = new ArrayList<>();

    @Override
    public void queue(MailInfo mail) {
        list.add(mail);
    }

    @Override
    public void queue(String to, String subject, String body) {
        queue(new MailInfo(to, subject, body));
    }

    @Scheduled(fixedDelay = 5000)
    public void run() {
        while (!list.isEmpty()) {
            MailInfo mail = list.remove(0);
            try {
                this.send(mail);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private final Map<String, String> otpStorage = new HashMap<>();

    public String gererateOtp(String email) {
        SecureRandom random = new SecureRandom();
        String otp = String.format("%06d", random.nextInt(1000000));
        SessionService.set("otp", otp);
        otpStorage.put(email, otp);
        return otp;
    }

    public Boolean validateOtp(String email, String otp) {
        return otp.equals(SessionService.get("otp"));
    }
}