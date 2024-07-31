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
        // 세션에서 닉네임 가져오기
        String userNickname = (String) session.getAttribute("userNickname");
        if (userNickname != null) {
            d.addAttribute("userNickname", userNickname);
        } else {
            // 세션에 닉네임이 없으면 기본값 설정 (예: "Guest")
            d.addAttribute("userNickname", "Guest");
        }
        d.addAttribute("socketServer", socketServer);
        return "tracerPages/chatting";
    }
}
