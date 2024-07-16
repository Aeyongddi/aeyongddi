package com.web.tracerProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Test {
	// http://localhost:5656/testOpen
	@RequestMapping("/testOpen")
	private String testOpen() {
		return "a00_show";
	}
}
