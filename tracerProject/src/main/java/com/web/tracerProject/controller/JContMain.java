package com.web.tracerProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JContMain {
	@Autowired(required = false)
	// private JSerMain service;
	
	// http://localhost:5656/main
	@PostMapping("main")
	public String main() {
		return "tracerPages/index";
	}
}
