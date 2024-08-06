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
        .chat-header .icons {
            display: flex;
            gap: 10px;
            align-items: center; /* 중앙 정렬 추가 */
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
        /* 닉네임 설정 모달 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
            padding-top: 60px;
        }
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 300px;
        }
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .modal-header h2 {
            margin: 0;
        }
        .modal-footer {
            display: flex;
            justify-content: flex-end;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <h4 id="userNickname">${userNickname} 님</h4>
    <div>
        <h5>단체</h5>
        <button id="group-1" class="btn btn-secondary btn-block" onclick="changeChat('group', '단체 채팅1', this)">단체 채팅1</button>
        <button id="group-2" class="btn btn-secondary btn-block" onclick="changeChat('group', '단체 채팅2', this)">단체 채팅2</button>
        <button id="group-3" class="btn btn-secondary btn-block" onclick="changeChat('group', '단체 채팅3', this)">단체 채팅3</button>
        <h5>접속 중인 사용자</h5>
        <div id="privateChatList"></div>
    </div>
</div>
<div class="chat-container">
    <div class="chat-header">
        <h5 id="chatTitle">단체 채팅1</h5>
        <div class="icons">
            <span class="badge bg-primary"><fmt:formatDate value="${currentDate}" pattern="yyyy년 MM월 dd일"/></span>
            <i class="fas fa-search"></i>
            <i class="fas fa-ellipsis-v"></i>
            <button id="clearChatBtn" class="btn btn-danger">채팅 기록 삭제</button>
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

<!-- 닉네임 설정 모달 -->
<div id="nicknameModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>닉네임 설정</h2>
        </div>
        <div class="modal-body">
            <input id="nicknameInput" type="text" placeholder="${userNickname}" class="form-control">
        </div>
        <div class="modal-footer">
            <button id="saveNicknameBtn" class="btn btn-primary">저장</button>
        </div>
    </div>
</div>

<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script>
var userNickname = '${userNickname}';
var userEmail = '${userEmail}';
var currentChatType = 'group';
var currentChatName = '단체 채팅1';
var socket = new WebSocket('ws://192.168.0.10:5656/chat');

$(document).ready(function () {
    showNicknameModal();

    function initializeChat() {
        loadChatHistory();  // 페이지 로드 시 채팅 기록 불러오기

        socket.onopen = function (evt) {
            console.log("Connection opened");
            const joinMessage = {
                email: userEmail,
                nickname: userNickname,
                content: userNickname + "님이 입장하셨습니다!"
            };
            socket.send(JSON.stringify(joinMessage));
            // 현재 채팅방을 강조
            highlightCurrentChatButton();
        };

        socket.onmessage = function (evt) {
            console.log("Message received: ", evt.data);
            if (evt.data.startsWith("USER_LIST")) {
                handleUserList(evt.data.substring(9));
            } else {
                revMsg(evt.data);
            }
        };

        socket.onclose = function () {
            console.log("Connection closed");
            alert(userNickname + "님이 퇴장하셨습니다!");
        };

        $("#sndBtn").click(function () {
            sendMsg();
        });

        $("#msg").keyup(function (event) {
            if (event.keyCode === 13) {
                sendMsg();
            }
        });

        $("#clearChatBtn").click(function () {
            clearChatHistory();
        });
    }

    function showNicknameModal() {
        $("#nicknameModal").show();
        $("#nicknameInput").val(userNickname); // placeholder 설정
        $("#nicknameInput").focus();

        $("#nicknameInput").keyup(function (event) {
            if (event.keyCode === 13) {
                saveNickname();
            }
        });

        $("#saveNicknameBtn").click(function () {
            saveNickname();
        });
    }

    function saveNickname() {
        var newNickname = $("#nicknameInput").val().trim();
        if (newNickname) {
            userNickname = newNickname;
            $("#userNickname").text(userNickname + " 님");
            $("#nicknameModal").hide();
            initializeChat();
        } else {
            alert("닉네임을 입력해주세요.");
        }
    }

    function highlightCurrentChatButton() {
        // 모든 버튼에서 active-chat 클래스 제거
        $(".btn").removeClass("active-chat");

        // 현재 채팅방 버튼에 active-chat 클래스 추가
        $("button:contains('" + currentChatName + "')").addClass("active-chat");
    }
});

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

    // 자신이 보낸 메시지를 UI에 추가
    addMessageToChat(userNickname, content, true);
    saveMessageToLocalStorage(message);  // 로컬 저장소에 메시지 저장
}

function revMsg(data) {
    const message = JSON.parse(data);
    const nickname = message.nickname.trim();
    const content = message.content.trim();
    const chatType = message.chatType;
    const chatName = message.chatName;
    const isSender = (nickname === userNickname.trim());

    // 현재 채팅방의 메시지인 경우에만 표시
    if (chatType === currentChatType && (chatName === currentChatName || chatName === userNickname)) {
        console.log("Received message from:", nickname, " Content: ", content);
        addMessageToChat(nickname, content, isSender);

        // 수신한 메시지를 로컬 스토리지에 저장
        saveMessageToLocalStorage(message);
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

function saveMessageToLocalStorage(message) {
    var chatHistory = JSON.parse(localStorage.getItem("chatHistory_" + currentChatName)) || [];
    chatHistory.push(message);
    localStorage.setItem("chatHistory_" + currentChatName, JSON.stringify(chatHistory));
}

function loadChatHistory() {
    var chatHistory = JSON.parse(localStorage.getItem("chatHistory_" + currentChatName)) || [];
    chatHistory.forEach(function(message) {
        const nickname = message.nickname.trim();
        const content = message.content.trim();
        const isSender = (nickname === userNickname.trim());
        addMessageToChat(nickname, content, isSender);
    });
}

function clearChatHistory() {
    localStorage.removeItem("chatHistory_" + currentChatName);
    $("#chatMessageArea").empty();
}

function handleUserList(data) {
    const users = JSON.parse(data);
    $("#privateChatList").empty();
    users.forEach(function(user) {
        var userButton = $("<button></button>")
            .addClass("btn btn-secondary btn-block")
            .text(user)
            .click(function () {
                changeChat('private', user, userButton);
            });
        if (user === userNickname) {
            userButton.addClass("active-chat");
        }
        $("#privateChatList").append(userButton);
    });
}



function changeChat(type, name, button) {
    currentChatType = type;
    currentChatName = name;
    $("#chatTitle").text(name);
    $("#chatMessageArea").empty();
    loadChatHistory();  // 채팅방 변경 시 채팅 기록 불러오기
    updateActiveChatButton(button);
}

function updateActiveChatButton(button) {
    // 모든 버튼에서 active-chat 클래스 제거
    $(".btn").removeClass("active-chat");

    // 클릭된 버튼에 active-chat 클래스 추가
    $(button).addClass("active-chat");
}


</script>
</body>
</html>
