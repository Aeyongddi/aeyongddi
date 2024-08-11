<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>TRACER - 1대1 채팅</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
    <!-- jQuery UI CSS -->
    <link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
    <!-- FontAwesome for icons -->
    <script defer src="${path}/assets/plugins/fontawesome/js/all.min.js"></script>

    <!-- Custom Styles -->
    <style>
        body {
            display: flex;
            height: 100vh;
            margin: 0;
        }
        .chat-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            padding: 20px;
        }
        .chat-header {
            background: #333;
            color: #fff;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .chat-body {
            flex: 1;
            padding: 10px;
            overflow-y: auto;
            border: 1px solid #ccc;
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
    </style>

    <!-- jQuery -->
    <script src="${path}/a00_com/jquery.min.js"></script>
    <!-- SockJS and StompJS -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row mt-4">
            <div class="col-md-4">
                <h4>사용자 목록</h4>
                <div id="privateChatList"></div>
            </div>
            <div class="col-md-8">
                <div class="chat-header">
                    <h5 id="chatTitle">대화 중: <span id="currentChatUser"></span></h5>
                </div>
                <div id="chatArea" class="chat-body" style="height: 400px; overflow-y: auto; border: 1px solid #ccc;">
                    <div id="chatMessageArea"></div>
                </div>
                <div class="chat-footer mt-2">
                    <div class="input-group mb-2">
                        <input id="receiver" type="text" class="form-control" placeholder="받을 사람의 이메일을 입력 또는 선택하세요"> <!-- 받을 사람의 ID 저장 -->
                    </div>
                    <div class="input-group">
                        <input id="msg" type="text" class="form-control" placeholder="내용을 입력해주세요">
                        <button id="sndBtn" class="btn btn-success">전송</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        var userNickname = '${userNickname}';
        var userEmail = '${userEmail}';
        var socket = new SockJS('/ws');
        var stompClient = Stomp.over(socket);

        $(document).ready(function () {
            stompClient.connect({}, function (frame) {
                console.log('Connected: ' + frame);

                // 사용자 목록 가져오기
                stompClient.subscribe('/topic/user-list', function (message) {
                    updateUserList(JSON.parse(message.body));
                });

                // 개인 채팅 메시지 수신
                stompClient.subscribe('/user/queue/messages', function (message) {
                    revMsg(message.body);
                });

                // 메시지 전송 버튼 클릭 시
                $("#sndBtn").click(function () {
                    sendPrivateMessage();
                });

                // Enter 키로 메시지 전송
                $("#msg").keyup(function (event) {
                    if (event.keyCode === 13) {
                        sendPrivateMessage();
                    }
                });
            });
        });

        function sendPrivateMessage() {
            var content = $("#msg").val();
            var receiver = $("#receiver").val();

            if (content.trim() === "" || receiver.trim() === "") {
                alert("내용과 받을 사람을 모두 입력해야 합니다.");
                return;
            }

            var message = {
                sender: userNickname,
                receiver: receiver,
                content: content
            };

            stompClient.send("/app/hello", {}, JSON.stringify(message));
            addMessageToChat(userNickname, content, true);
            $("#msg").val(""); // 입력창 초기화
        }

        function revMsg(data) {
            var message = JSON.parse(data);
            addMessageToChat(message.nickname, message.content, false);
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

        function updateUserList(users) {
            $("#privateChatList").empty();
            users.forEach(function(user) {
                addUserToChatList(user.email, user.nickname);
            });
        }

        function addUserToChatList(receiver, userName) {
            var userButton = $("<button></button>")
                .addClass("btn btn-secondary btn-block")
                .text(userName)
                .data("receiver", receiver)
                .click(function () {
                    $("#receiver").val(receiver); // 선택한 사용자의 이메일을 받는 사람 칸에 입력
                    $("#currentChatUser").text(userName);
                    $("#chatMessageArea").empty(); // 기존 대화 내용 초기화
                });

            $("#privateChatList").append(userButton);
        }
    </script>
</body>
</html>
