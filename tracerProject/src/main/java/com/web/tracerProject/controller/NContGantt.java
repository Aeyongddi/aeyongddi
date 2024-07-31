package com.web.tracerProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NContGantt {
	@GetMapping("timeline")
	public String timelineFrm() {
		return "tracerPages/timeline";
	}
}
