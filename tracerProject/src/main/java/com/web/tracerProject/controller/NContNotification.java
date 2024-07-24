package com.web.tracerProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NContNotification {
	// http://localhost:5656/notifications
	@GetMapping("notifications")
	public String notification() {
		return "tracerPages/notifications";
	}
}
