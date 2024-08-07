package com.web.tracerProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JContAppro {
	@RequestMapping("/approval")
	public String approval() {
		return "tracerPages/approval";
	}
	
}
