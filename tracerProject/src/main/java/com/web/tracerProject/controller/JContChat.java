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
    public String chatting(Model d, HttpSession session) {
        // 세션에서 닉네임과 이메일 가져오기
        String userNickname = (String) session.getAttribute("userNickname");
        String userEmail = (String) session.getAttribute("userEmail");
        
        if (userNickname == null) {
            // 닉네임이 설정되지 않은 경우 기본값 설정
            userNickname = "Guest";
        }
        
        d.addAttribute("userNickname", userNickname);
        d.addAttribute("userEmail", userEmail);
        d.addAttribute("socketServer", socketServer);
        return "tracerPages/chatting";
    }
}
