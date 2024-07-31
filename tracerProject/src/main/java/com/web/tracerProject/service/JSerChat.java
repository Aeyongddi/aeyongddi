package com.web.tracerProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.JDaoChat;
import com.web.tracerProject.vo.Chatting;

@Service
public class JSerChat {

    @Autowired
    private JDaoChat jDaoChat;

    public void saveChatMessage(Chatting chatMessage) {
        jDaoChat.saveChatMessage(chatMessage);
    }

    public String getNicknameByEmail(String email) {
        return jDaoChat.getNicknameByEmail(email);
    }
}
