package com.web.tracerProject.util;

import java.util.Date;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.tracerProject.service.JSerChat;
import com.web.tracerProject.vo.Chatting;

@Component
public class ChatHandler extends TextWebSocketHandler {

    private final Map<String, WebSocketSession> users = new ConcurrentHashMap<>();

    @Autowired
    private JSerChat chatService;

    private ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        users.put(session.getId(), session);
        System.out.println(session.getId() + "님 접속하셨습니다. 현재 접속자 수: " + users.size());
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String payload = message.getPayload();
        System.out.println(session.getId() + "에서 온 메시지: " + payload);

        // JSON 형식으로 메시지를 파싱
        Map<String, String> messageMap = objectMapper.readValue(payload, Map.class);
        String sender = messageMap.get("email");
        String nickname = messageMap.get("nickname");
        String content = messageMap.get("content");

        // 메시지 데이터베이스에 저장
        Chatting chatMessage = new Chatting();
        chatMessage.setChid(UUID.randomUUID().toString());
        chatMessage.setEmail(sender);
        chatMessage.setSent_date(new Date());
        chatMessage.setContent(content);

        chatService.saveChatMessage(chatMessage);

        // 모든 사용자에게 메시지 전송 (발신자 포함)
        for (WebSocketSession userSession : users.values()) {
            userSession.sendMessage(new TextMessage(payload));
        }
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        System.out.println(session.getId() + " 에러 발생: " + exception.getMessage());
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        users.remove(session.getId());
        System.out.println(session.getId() + " 접속 종료");
    }
}
