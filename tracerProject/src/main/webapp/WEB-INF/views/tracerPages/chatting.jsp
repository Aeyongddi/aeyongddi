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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/a00_com/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/a00_com/jquery-ui.css">
    <script defer src="assets/plugins/fontawesome/js/all.min.js"></script>
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
    </style>
</head>
<body>
<div class="sidebar">
    <h4>${user_info.nickname} 님</h4>
    <div>
        <h5>단체</h5>
        <button class="btn btn-secondary btn-block">단체 채팅1</button>
        <button class="btn btn-secondary btn-block">단체 채팅2</button>
        <button class="btn btn-primary btn-block">단체 채팅3</button>
        <h5>개인</h5>
        <button class="btn btn-secondary btn-block">개인1</button>
        <button class="btn btn-secondary btn-block">개인2</button>
    </div>
</div>
<div class="chat-container">
    <div class="chat-header">
        <h5>단체 채팅3</h5>
        <div class="icons">
            <span class="badge bg-primary">2024년 07월 19일</span>
            <i class="fas fa-search"></i>
            <i class="fas fa-ellipsis-v"></i>
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

<script src="${pageContext.request.contextPath}/a00_com/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/a00_com/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/a00_com/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/a00_com/jquery-ui.js"></script>
<script>
    var wsocket = null;
    $(document).ready(function () {
        ws_conn();
        $("#sndBtn").click(function () {
            sendMsg();
        });
        $("#msg").keyup(function () {
            if (event.keyCode === 13) {
                sendMsg();
            }
        });
    });

    function ws_conn() {
        var socketServer = '${socketServer}'.replace(/^"|"$/g, '');
        wsocket = new WebSocket(socketServer);
        wsocket.onopen = function (evt) {
            wsocket.send('${user_info.email}' + ":접속하셨습니다!");
        };
        wsocket.onmessage = function (evt) {
            revMsg(evt.data);
        };
        wsocket.onclose = function () {
            console.log('Connection closed');
        };
    }

    function sendMsg() {
        if (wsocket.readyState === WebSocket.OPEN) {
            wsocket.send('${user_info.email}' + ":" + $("#msg").val());
            $("#msg").val("");
        } else {
            alert('WebSocket connection is closed.');
        }
    }

    var mx = 0;

    function revMsg(msg) {
        var alignOpt = "left";
        var msgArr = msg.split(":");
        var sndId = msgArr[0];
        if ('${user_info.email}' === sndId) {
            alignOpt = "right";
            msg = msgArr[1];
        }
        var msgObj = $("<div></div>").addClass("message").addClass(alignOpt === "right" ? "sent" : "received");
        var content = $("<div></div>").addClass("content").text(msg);
        msgObj.append(content);
        $("#chatMessageArea").append(msgObj);

        var height = parseInt($("#chatMessageArea").height());
        mx += height + 20;
        $("#chatArea").scrollTop(mx);
    }
</script>
</body>
</html>
