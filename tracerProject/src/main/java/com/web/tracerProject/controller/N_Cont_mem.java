package com.web.tracerProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.web.tracerProject.service.N_Ser_mem;

@Controller
public class N_Cont_mem {
	@Autowired(required=false)
	private N_Ser_mem service;
	
	// http://localhost:5656/login
	@GetMapping("login")
	public String login() {
		return "tracerPages/login";
	}
	
	@PostMapping("main")
	public String Main() {
		return "tracerPages/index";
	}
}
