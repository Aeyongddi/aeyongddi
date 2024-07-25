package com.web.tracerProject.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.tracerProject.service.NSerMail;
import com.web.tracerProject.vo.Mail;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class NContMail {
	 private final NSerMail mservice;
	 
	    @GetMapping("/mail/send")
	    public String main() {
	        return "";
	    }
	 
	    @PostMapping("/mail/sendSingupSuccess")
	    public ResponseEntity<String> sendSingupSuccess(Mail mail, @RequestParam("email") String email
	    													, @RequestParam("nickname") String nickname) {
	        return ResponseEntity.ok(mservice.sendSingupSuccess(mail, email, nickname));
	    }
}
