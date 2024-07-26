<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스프린트 관리</title>
    <link rel="stylesheet" href="${path}/assets/css/portal.css">
    <!-- FontAwesome JS -->
    <script defer src="${path}/assets/plugins/fontawesome/js/all.min.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${path}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f5f7;
            margin: 0;
            padding: 0;
        }

        .sprint-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 700px;
            margin: 80px auto;
            padding: 20px;
            
        }

        .sprint-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }

        .sprint-header h2 {
            margin: 0;
            font-size: 20px;
            display: flex;
            align-items: center;
        }

        .add-date {
            background-color: transparent;
            border: none;
            color: #007bff;
            cursor: pointer;
            font-size: 14px;
        }

        .issue-count {
            font-size: 12px;
            color: #888;
        }

        .issue-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .issue-item {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }

        .issue-item:last-child {
            border-bottom: none;
        }

        .issue-key {
            width: 80px;
            font-weight: bold;
            color: #0052cc;
        }

        .issue-summary {
            flex-grow: 1;
            margin-left: 10px;
            color: #333;
        }

        .issue-status {
            font-size: 12px;
            color: #666;
        }

        .add-issue {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 3px;
            padding: 5px 10px;
            cursor: pointer;
            margin-top: 10px;
        }

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
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        
        .title {
          margin-left: 500px;
        }
    </style>
</head>
<body>

    <div class="sprint-container">
        <div class="sprint-header">
            <h2>
                <input type="checkbox" id="select-all" onclick="toggleAll(this)">
            </h2>
            <h2 class="title">HUM 1 스프린트</h2>
            <button class="add-date">날짜 추가</button>
            <span class="issue-count">3개 이슈
                <select onchange="handleSelectChange(this.value)">
                    <option value="">선택</option>
                    <option value="edit">편집</option>
                    <option value="delete">삭제</option>
                </select>
            </span>
        </div>
        <ul class="issue-list">
            <c:forEach var="boa" items="${boardList}">
                <li class="issue-item">
                    <input type="checkbox" class="issue-checkbox" id="issue-${boa.bid}">
                    <label for="issue-${boa.bid}" class="issue-key">${boa.bid}</label>
                    <span class="issue-summary">${boa.title}</span>
                    <span class="issue-status">
                        <select class="form-select" name="status-${boa.bid}" id="status-${boa.bid}">
                            <option value="0" ${boa.endYN ? '' : 'selected'}>진행중</option>
                            <option value="1" ${boa.endYN ? 'selected' : ''}>완료</option>
                        </select>
                    </span>
                </li>
            </c:forEach>
        </ul>
        <button class="add-issue">+ 이슈 만들기</button>
    </div>

    <!-- Modal -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>스프린트 이름 변경</h2>
            <input type="text" id="sprint-name" value="HUM 1 스프린트">
            <button onclick="saveName()">저장</button>
        </div>
    </div>

    <jsp:include page="/headerSidebar.jsp"/>

    <script src="${path}/assets/plugins/popper.min.js"></script>
    <script src="${path}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="${path}/assets/js/app.js"></script>
    <script>
        function toggleAll(source) {
            var checkboxes = document.querySelectorAll('.issue-checkbox');
            checkboxes.forEach(function(checkbox) {
                checkbox.checked = source.checked;
            });
        }

        function handleSelectChange(action) {
            var checkboxes = document.querySelectorAll('.issue-checkbox');
            var selectedIssues = [];
            checkboxes.forEach(function(checkbox) {
                if (checkbox.checked) {
                    selectedIssues.push(checkbox.id.replace('issue-', ''));
                }
            });

            if (action === "edit") {
                openModal();
            } else if (action === "delete") {
                deleteSelected(selectedIssues);
            }
        }

        function openModal() {
            var modal = document.getElementById("myModal");
            modal.style.display = "block";
        }

        function closeModal() {
            var modal = document.getElementById("myModal");
            modal.style.display = "none";
        }

        function saveName() {
            var newName = document.getElementById("sprint-name").value;
            document.querySelector('.title').innerText = newName;
            closeModal();
        }

        function deleteSelected(issueIds) {
            if (confirm("선택한 항목을 삭제하시겠습니까?")) {
                // 서버에 삭제 요청 보내기 (예: Ajax 호출)
                issueIds.forEach(function(id) {
                    console.log("Deleting issue with ID: " + id);
                    // 여기서 서버에 삭제 요청을 보냄
                });
            }
        }
    </script>
</body>
</html>
