package com.web.tracerProject.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JContChat {

	@Value("${socketServer}")
	private String socketServer;
	
	// http://localhost:5656/chatting
	@GetMapping("chatting")
	public String chatting(Model d) {
		d.addAttribute("socketServer", socketServer);
		return "tracerPages/chatting";
	}
}
