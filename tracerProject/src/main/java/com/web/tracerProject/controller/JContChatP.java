package com.web.tracerProject.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;

import com.web.tracerProject.vo.PrivateMessage;

@Controller
public class JContChatP {
	
	private final SimpMessagingTemplate messagingTemplate;

    public JContChatP(SimpMessagingTemplate messagingTemplate) {
        this.messagingTemplate = messagingTemplate;
    }

    @MessageMapping("/hello")
    public void sendMessage(PrivateMessage message) {
        String receiver = message.getReceiver();

        if (StringUtils.hasText(receiver)) {
            messagingTemplate.convertAndSendToUser(receiver, "/queue/messages", message);
        } else {
            throw new IllegalArgumentException("Receiver must not be null or empty");
        }
    }
}

