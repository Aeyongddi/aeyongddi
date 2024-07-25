package com.web.tracerProject.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.web.tracerProject.vo.Mail;

import lombok.AllArgsConstructor;


@AllArgsConstructor
@Service
public class NSerMail {
	private JavaMailSender mailSender;
	
	public String sendSimpleMessage(Mail mail) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("gimnamwon3131@gamil.com");
        message.setTo(mail.getAddress());
        message.setSubject(mail.getTitle());
        message.setText(mail.getContent());
        mailSender.send(message);
        return "메일전송완료";
    }
	public String sendSingupSuccess(Mail mail, @Param("email") String email
										, @Param("nickname") String nickname ) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("gimnamwon3131@gamil.com");
		message.setTo(email);
		message.setSubject("TRACER::" + nickname + "님의 회원가입을 진심으로 축하합니다.");
		message.setText(
				" -------------------------------- \n"
				+ "회원가입을 환영합니다\n\n"

				+ "TRACER PMS 서비스\n\n"

				+ "회원가입 절차가 완료되었습니다.\n"
				+ "로그인 후 서비스를 이용해 주시기 바랍니다.\n"
				+ "-------------------------------"
				);
		mailSender.send(message);
		System.out.println(email);
		
		return "메일전송완료";
	}
}
