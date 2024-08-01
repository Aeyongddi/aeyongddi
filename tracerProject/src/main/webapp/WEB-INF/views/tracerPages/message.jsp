<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chat Application</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    #chat-container {
        width: 80%;
        max-width: 800px;
        margin: 20px auto;
    }
    #message-box {
        width: 100%;
        height: 300px;
        border: 1px solid #ccc;
        padding: 10px;
        overflow-y: scroll;
        margin-bottom: 10px;
    }
    #input-container {
        display: flex;
        justify-content: space-between;
        width: 100%;
    }
    input[type="text"] {
        width: calc(100% - 100px);
        padding: 10px;
        margin-right: 10px;
    }
    button {
        padding: 10px 20px;
        cursor: pointer;
    }
</style>
</head>
<body>
<div id="chat-container">
    <h2>Chat Application</h2>
    <div id="message-box">
        <div id="show"></div>
    </div>
    <div id="input-container">
        <input type="text" id="curName" placeholder="현재사람" />
        <input type="text" id="name" placeholder="받을사람" />
        <input type="text" id="msg" placeholder="보낼메시지" />
        <button type="button" onclick="sendName()">전송</button>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
<script type="text/javascript">
	var socket = new WebSocket('ws://192.168.0.10:5656/chat');
    var stompClient = Stomp.over(socket);

    stompClient.connect({}, function(frame) {
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/greetings', function(greeting){
            var obj = JSON.parse(greeting.body);
            var curName = document.getElementById('curName').value;
            if(curName === obj.name) {
                document.querySelector("#show").innerHTML += obj.name + ": " + obj.msg + "<br>";
            } else {
                document.querySelector("#show").innerHTML += "익명: " + obj.msg + "<br>";
            }
        });
    });

    function sendName() {
        var curName = document.getElementById('curName').value;
        var name = document.getElementById('name').value;
        var msg = document.getElementById('msg').value;
        
        if (!curName || !name || !msg) {
            console.error("모든 입력 요소를 채워주세요.");
            return;
        }

        document.querySelector("#show").innerHTML += "나: " + msg + "<br>";
        stompClient.send("/app/hello", {}, JSON.stringify({'name': name, 'msg': msg}));
    }
</script>
</body>
</html>
