package com.web.tracerProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.web.tracerProject.service.NSerMem;
import com.web.tracerProject.vo.User_info;

@Controller
public class NContMem {
	@Autowired(required=false)
	private NSerMem service;
	
	// http://localhost:5656/login
	@GetMapping("login")
	public String login(User_info user_info) {
		if(service.schMember(user_info)=="로그인 성공")
			System.out.println("로그인 성공");
		return "tracerPages/login";
	}
	
	@PostMapping("main")
	public String main() {
		return "tracerPages/index";
	}
	
	@GetMapping("fullcalendar")
	public String fullcalendar() {
		return "a06_fullcalendarList";
	}
}
