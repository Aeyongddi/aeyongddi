package com.web.tracerProject.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class JContChat {

    @Value("${socketServer}")
    private String socketServer;
    
    @GetMapping("/chatting")
    public String chatting(Model model, HttpSession session) {
        model.addAttribute("socketServer", socketServer);
        model.addAttribute("user_info", session.getAttribute("info"));
        return "tracerPages/chatting";
    }
}
