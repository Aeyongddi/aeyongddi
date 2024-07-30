package com.web.tracerProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.JDaoChat;
import com.web.tracerProject.vo.Chatting;

import java.util.List;

@Service
public class JSerChat {
    @Autowired
    private JDaoChat chatDao;

    public void saveChatMessage(Chatting chatMessage) {
        chatDao.saveChatMessage(chatMessage);
    }

    public List<Chatting> getAllChatMessages() {
        return chatDao.getAllChatMessages();
    }
}
