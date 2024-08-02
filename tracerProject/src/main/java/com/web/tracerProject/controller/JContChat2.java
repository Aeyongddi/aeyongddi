package com.web.tracerProject.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JContChat2 {
	// http://192.168.0.10:5656/message

    @GetMapping("/message")
    public String chatting() {
        return "tracerPages/message";
    }

    @MessageMapping("/hello")
    @SendTo("/topic/greetings")
    public String greeting(String message) {
        System.out.println("# 메시지 전송 #" + message);
        return message;
    }

    @MessageMapping("/private")
    public void privateMessage(String message) {
        System.out.println("# 개인 메시지 전송 #" + message);
    }
}
