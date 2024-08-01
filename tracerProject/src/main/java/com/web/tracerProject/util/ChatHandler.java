package com.web.tracerProject.util;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.tracerProject.service.JSerChat;
import com.web.tracerProject.vo.Chatting;

@Component
public class ChatHandler extends TextWebSocketHandler {

    private final Map<String, WebSocketSession> users = new ConcurrentHashMap<>();
    private final Map<WebSocketSession, String> userNicknames = new ConcurrentHashMap<>();
    private final AtomicInteger guestCounter = new AtomicInteger(1);  // 게스트 카운터

    @Autowired
    private JSerChat chatService;

    private ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String nickname = getNicknameFromSession(session); // 세션에서 닉네임을 가져오는 함수 (구현)

        if (nickname == null || nickname.isEmpty()) {
            // 로그인하지 않은 사용자라면 게스트 닉네임 할당
            nickname = "guest" + guestCounter.getAndIncrement();
        }

        userNicknames.put(session, nickname);
        users.put(session.getId(), session);
        System.out.println(nickname + "님 접속하셨습니다. 현재 접속자 수: " + users.size());
        sendUserList();
        sendJoinMessage(session, nickname);
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String payload = message.getPayload();
        System.out.println(session.getId() + "에서 온 메시지: " + payload);

        Map<String, String> messageMap = objectMapper.readValue(payload, Map.class);
        String type = messageMap.get("type");

        if ("USER_LIST_REQUEST".equals(type)) {
            sendUserList(session);
        } else {
            String sender = messageMap.get("email");
            String nickname = messageMap.get("nickname");
            String content = messageMap.get("content");
            String chatType = messageMap.get("chatType");
            String chatName = messageMap.get("chatName");

            Chatting chatMessage = new Chatting();
            chatMessage.setChid(UUID.randomUUID().toString());
            chatMessage.setEmail(sender);
            chatMessage.setSent_date(new Date());
            chatMessage.setContent(content);

            chatService.saveChatMessage(chatMessage);

            if ("private".equals(chatType)) {
                for (Map.Entry<WebSocketSession, String> entry : userNicknames.entrySet()) {
                    if (entry.getValue().equals(chatName)) {
                        entry.getKey().sendMessage(new TextMessage(payload));
                        break;
                    }
                }
            } else {
                for (Map.Entry<String, WebSocketSession> userEntry : users.entrySet()) {
                    WebSocketSession userSession = userEntry.getValue();
                    if (!userSession.getId().equals(session.getId())) {
                        userSession.sendMessage(new TextMessage(payload));
                    }
                }
            }
        }
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        System.out.println(session.getId() + " 에러 발생: " + exception.getMessage());
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String nickname = userNicknames.get(session);
        users.remove(session.getId());
        userNicknames.remove(session);
        System.out.println(nickname + "님 접속 종료");

        String leaveMessage = String.format("{\"nickname\":\"%s\", \"content\":\"%s님이 나가셨습니다\", \"chatType\":\"system\", \"chatName\":\"all\"}", nickname, nickname);
        for (WebSocketSession userSession : users.values()) {
            userSession.sendMessage(new TextMessage(leaveMessage));
        }
        sendUserList();
    }

    private void sendUserList() throws Exception {
        List<String> userList = new ArrayList<>(userNicknames.values());
        String userListMessage = "USER_LIST" + objectMapper.writeValueAsString(userList);
        for (WebSocketSession userSession : users.values()) {
            userSession.sendMessage(new TextMessage(userListMessage));
        }
    }

    private void sendUserList(WebSocketSession session) throws Exception {
        List<String> userList = new ArrayList<>(userNicknames.values());
        String userListMessage = "USER_LIST" + objectMapper.writeValueAsString(userList);
        session.sendMessage(new TextMessage(userListMessage));
    }

    private void sendJoinMessage(WebSocketSession session, String nickname) throws Exception {
        String joinMessage = String.format("{\"nickname\":\"%s\", \"content\":\"%s님이 입장하셨습니다\", \"chatType\":\"system\", \"chatName\":\"all\"}", nickname, nickname);
        for (WebSocketSession userSession : users.values()) {
            if (!userSession.getId().equals(session.getId())) {
                userSession.sendMessage(new TextMessage(joinMessage));
            }
        }
    }

    // 세션에서 사용자 닉네임을 가져오는 메서드
    private String getNicknameFromSession(WebSocketSession session) {
        // 예시로 세션 어트리뷰트에서 닉네임을 가져오는 로직
        return (String) session.getAttributes().get("nickname");
    }
}
