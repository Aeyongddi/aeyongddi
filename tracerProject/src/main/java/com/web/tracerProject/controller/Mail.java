package com.web.tracerProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class Mail {
	
	//http://localhost:5656/mail
	@GetMapping("/mail")
	public String mailForm() {
		return "mailForm";
	}
	
	@PostMapping("/mail")
	public String sendMail() {
		return "mailForm";
	}
}
