<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>TRACER - 채팅</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
    <script defer src="${path}/assets/plugins/fontawesome/js/all.min.js"></script>
    <style>
        body {
            display: flex;
            height: 100vh;
            margin: 0;
        }
        .sidebar {
            width: 250px;
            background: #f4f4f4;
            padding: 20px;
        }
        .chat-container {
            flex: 1;
            display: flex;
            flex-direction: column;
        }
        .chat-header {
            background: #333;
            color: #fff;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .chat-header .title {
            flex: 1;
            text-align: center;
        }
        .chat-body {
            flex: 1;
            padding: 10px;
            overflow-y: auto;
        }
        .chat-footer {
            padding: 10px;
            border-top: 1px solid #ccc;
        }
        .message {
            margin-bottom: 15px;
        }
        .message.sent {
            text-align: right;
        }
        .message.received {
            text-align: left;
        }
        .message .content {
            display: inline-block;
            padding: 10px;
            border-radius: 10px;
        }
        .message.sent .content {
            background: #daf8cb;
        }
        .message.received .content {
            background: #f1f0f0;
        }
        .message .timestamp {
            display: block;
            font-size: 0.75em;
            color: #888;
        }
        .message .nickname {
            font-weight: bold;
            margin-bottom: 5px;
            color: #444;
        }
        .active-chat {
            background-color: #007bff !important;
            color: #fff !important;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <h4 id="nicknameDisplay"></h4>
    <div>
        <h5>단체</h5>
        <button id="group-1" class="btn btn-secondary btn-block" onclick="changeChat('group', '단체 채팅1')">단체 채팅1</button>
        <button id="group-2" class="btn btn-secondary btn-block" onclick="changeChat('group', '단체 채팅2')">단체 채팅2</button>
        <button id="group-3" class="btn btn-primary btn-block" onclick="changeChat('group', '단체 채팅3')">단체 채팅3</button>
        <h5>개인</h5>
        <div id="privateChatList"></div>
    </div>
</div>
<div class="chat-container">
    <div class="chat-header">
        <div class="title">
            <h5 id="chatTitle">단체 채팅3</h5>
            <span class="badge bg-primary">
                <fmt:formatDate value="${currentDate}" pattern="yyyy-MM-dd" />
            </span>
        </div>
    </div>
    <div class="chat-body" id="chatArea">
        <div id="chatMessageArea"></div>
    </div>
    <div class="chat-footer">
        <div class="input-group">
            <input id="msg" type="text" class="form-control" placeholder="내용을 입력해주세요">
            <button id="sndBtn" class="btn btn-success">전송</button>
        </div>
    </div>
</div>

<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script>
var userNickname;
var userEmail = '${userEmail}';
var currentChatType = 'group';
var currentChatName = '단체 채팅3';
var socket = new WebSocket('ws://192.168.0.10:5656/chat');

$(document).ready(function () {
    function ws_conn() {
        socket.onopen = function (evt) {
            console.log("Connection opened");
        };
        socket.onmessage = function (evt) {
            console.log("Message received: ", evt.data);
            if(evt.data.startsWith("USER_LIST")) {
                updatePrivateChatList(JSON.parse(evt.data.substring(9)));
            } else {
                var message = JSON.parse(evt.data);
                if (message.nickname) {
                    userNickname = message.nickname;
                    $("#nicknameDisplay").text(userNickname + " 님");
                }
                revMsg(evt.data);
            }
        };
        socket.onclose = function () {
            console.log("Connection closed");
            const leaveMessage = {
                email: userEmail,
                nickname: userNickname,
                content: userNickname + "님이 퇴장하셨습니다!",
                chatType: currentChatType,
                chatName: currentChatName
            };
            revMsg(JSON.stringify(leaveMessage));
        };
    }

    $("#sndBtn").click(function () {
        sendMsg();
    });
    $("#msg").keyup(function (event) {
        if (event.keyCode === 13) {
            sendMsg();
        }
    });

    ws_conn();
});

function changeChat(type, name) {
    currentChatType = type;
    currentChatName = name;
    $("#chatTitle").text(name);
    $("#chatMessageArea").empty();
    updateActiveChatButton(type, name);
    // 여기에서 이전 채팅 기록을 가져오는 코드 추가 가능
}

function updateActiveChatButton(type, name) {
    // 모든 버튼에서 active-chat 클래스 제거
    $(".btn").removeClass("active-chat");

    // 현재 채팅 방 버튼에 active-chat 클래스 추가
    var chatId = type + '-' + name;
    $("#" + chatId).addClass("active-chat");
}

function sendMsg() {
    var content = $("#msg").val();
    if(content.trim() === "") {
        return;
    }
    console.log("Sending message: ", content);
    const message = {
        email: userEmail,
        nickname: userNickname,
        content: content,
        chatType: currentChatType,
        chatName: currentChatName
    };
    socket.send(JSON.stringify(message));
    $("#msg").val("");

    // 내가 보낸 메시지 화면에 추가
    addMessageToChat(userNickname, content, true);
}

function revMsg(data) {
    const message = JSON.parse(data);
    const nickname = message.nickname.trim();
    const content = message.content.trim();
    const chatType = message.chatType;
    const chatName = message.chatName;
    const isSender = (nickname === userNickname.trim());

    if(chatType === currentChatType && chatName === currentChatName) {
        console.log("Received message from:", nickname, " Content: ", content);
        // 메시지를 화면에 추가
        addMessageToChat(nickname, content, isSender);
    }
}

function addMessageToChat(nickname, content, isSender) {
    var timestamp = new Date().toLocaleTimeString();
    var msgObj = $("<div></div>").addClass("message").addClass(isSender ? "sent" : "received");
    var contentDiv = $("<div></div>").addClass("content").text(content);
    var timestampDiv = $("<div></div>").addClass("timestamp").text(timestamp);
    msgObj.append(contentDiv).append(timestampDiv);

    if (!isSender) {
        var nicknameDiv = $("<div></div>").addClass("nickname").text(nickname);
        msgObj.prepend(nicknameDiv);
    }

    $("#chatMessageArea").append(msgObj);
    $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight); // 스크롤을 맨 아래로 이동
}

function requestUserList() {
    const request = {
        type: "USER_LIST_REQUEST"
    };
    socket.send(JSON.stringify(request));
}

function updatePrivateChatList(users) {
    $("#privateChatList").empty();
    users.forEach(function(user) {
        if(user !== userNickname) {
            var userButton = $("<button></button>")
                .addClass("btn btn-secondary btn-block")
                .attr("id", "private-" + user)
                .attr("onclick", "changeChat('private', '" + user + "')")
                .text(user);
            $("#privateChatList").append(userButton);
        }
    });
}
</script>
</body>
</html>
