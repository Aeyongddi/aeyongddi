<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TRACER</title>
    <link rel="stylesheet" href="${path}/assets/css/portal.css">
    <script defer src="${path}/assets/plugins/fontawesome/js/all.min.js"></script>
    <link rel="stylesheet" href="${path}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/a00_com/project/task.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
</head>
<body>
    <div class="sprint-container">
        <div class="sprint-header">
            <h2>
                <input type="checkbox" id="select-all" onclick="toggleAll(this)">
            </h2>
            <h2 class="title" id="sprint-title">HUM 1 스프린트</h2>
            <button class="add-date" onclick="openModal()">제목변경</button>
            <select onchange="handleSelectChange(this.value)">
                <option value="">선택</option>
                <option value="delete">삭제</option>
            </select>
        </div>
        <ul class="issue-list">
            <c:forEach var="task" items="${taskList}">
                <li class="issue-item" id="issue-item-${task.tkid}">
                    <input type="checkbox" class="issue-checkbox" id="issue-${task.tkid}" value="${task.tkid}">
                    <label for="issue-${task.tkid}" class="issue-key">${task.tkid}</label>
                    <span class="issue-summary" onclick="openEditContainer('${task.tkid}', '${task.name}', '${task.description}', '${task.sid}', '${task.approvalStatus}')">
                        ${task.name}
                    </span>
                    <span class="issue-status">
                        <select class="form-select" name="status-${task.tkid}" id="status-${task.tkid}" onchange="updateStatus('${task.tkid}', this.value)">
                            <option value="진행중" ${task.approvalStatus == '진행중' ? 'selected' : ''}>진행중</option>
                            <option value="완료" ${task.approvalStatus == '완료' ? 'selected' : ''}>완료</option>
                        </select>
                    </span>
                </li>
            </c:forEach>
        </ul>
        <button class="add-issue" onclick="openTextarea()">+ 이슈 만들기</button>
        <div class="textarea-container" id="textarea-container">
            <textarea id="issue-name" placeholder="이슈 제목을 입력하세요..."></textarea>
            <div class="date-picker-wrapper">
                시작 날짜 : <input type="text" id="issue-start-date" class="custom-date-input" value="시작 날짜 입력하세요. 클릭"> 종료 날짜 : <input type="text" id="issue-end-date" class="custom-date-input" value="종료 날짜 입력하세요. 클릭">
            </div>
            <div class="form-group">
                <label for="issue-author">작성자</label>
                <input type="text" id="issue-author" class="form-control" value="${sessionScope.userNickname}" readonly>
            </div>
            <div class="btn-container">
                <button type="button" class="btn btn-primary" onclick="saveIssue()">저장</button>
                <button type="button" class="btn btn-secondary" onclick="closeTextarea()">닫기</button>
            </div>
        </div>
    </div>

    <!-- 수정창 코드 -->
    <div class="edit-container" id="edit-container">
        <div class="edit-header">
            <label for="edit-name"></label>
            <input type="text" id="edit-name">
        </div>
        <div class="edit-content">
            <form id="edit-form">
                <input type="hidden" id="edit-tkid">
                <input type="hidden" id="edit-email" value="${sessionScope.userEmail}" readonly>  
                <div class="form-group">
                    <label for="edit-description">설명</label>
                    <textarea id="edit-description" class="form-control"></textarea>
                </div>
                <div class="form-group">
                    <input type="hidden" id="edit-sid" class="form-control">
                </div>
                <div class="form-group">
                    <label for="edit-start_date">시작 날짜 수정</label>
                    <input type="date" id="edit-start_date" class="form-control">
                </div>
                <div class="form-group">
                    <label for="edit-end_date">종료 날짜 수정</label>
                    <input type="date" id="edit-end_date" class="form-control">
                </div>
                <div class="form-group">
                    <label for="edit-author">작성자</label>
                    <input type="text" id="edit-author" class="form-control" value="${sessionScope.userNickname}" readonly>
                </div>
                <div class="form-group">
                    <label for="approval-status">결재 상태</label>
                    <input type="text" id="approval-status" class="form-control" readonly>
                </div>
            </form>
            <div class="edit-content">
                <button type="button" class="btn btn-primary" onclick="updateTask()">업데이트</button>
                <button type="button" class="btn btn-secondary" onclick="closeEditContainer()">닫기</button>
            </div>
            <div class="edit-content">
                <button type="button" class="btn btn-warning" onclick="requestApproval()">결재 요청</button>
            </div>
        </div>
    </div>

    <!-- 모달 창 코드 -->
    <div id="details-modal" class="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal()">&times;</span>
            <h2>이슈 상세 정보</h2>
            <form id="details-form">
                <div class="form-group">
                    <label for="details-tkid">TKID</label>
                    <input type="text" id="details-tkid" class="form-control" readonly>
                </div>
                <div class="form-group">
                    <label for="details-name">이름</label>
                    <input type="text" id="details-name" class="form-control" readonly>
                </div>
                <div class="form-group">
                    <label for="details-description">설명</label>
                    <textarea id="details-description" class="form-control" readonly></textarea>
                </div>
                <div class="form-group">
                    <label for="details-sid">SID</label>
                    <input type="text" id="details-sid" class="form-control" readonly>
                </div>
                <div class="form-group">
                    <label for="details-start_date">시작 날짜</label>
                    <input type="date" id="details-start_date" class="form-control" readonly>
                </div>
                <div class="form-group">
                    <label for="details-end_date">종료 날짜</label>
                    <input type="date" id="details-end_date" class="form-control" readonly>
                </div>
                <div class="form-group">
                    <label for="details-author">작성자</label>
                    <input type="text" id="details-author" class="form-control" readonly>
                </div>
                <div class="form-group">
                    <label for="details-approval_status">결재 상태</label>
                    <input type="text" id="details-approval_status" class="form-control" readonly>
                </div>
            </form>
            <button type="button" class="btn btn-secondary" onclick="closeModal()">닫기</button>
        </div>
    </div>

    <script>
    function openEditContainer(tkid, name, description, sid, approvalStatus) {
        const editTkIdElement = document.getElementById('edit-tkid');
        const editNameElement = document.getElementById('edit-name');
        const editDescriptionElement = document.getElementById('edit-description');
        const editSidElement = document.getElementById('edit-sid');
        const approvalStatusElement = document.getElementById('approval-status');
        const emailElement = document.getElementById('edit-email');

        editTkIdElement.value = tkid;
        editNameElement.value = name;
        editDescriptionElement.value = description;
        editSidElement.value = sid;
        approvalStatusElement.value = approvalStatus;
        emailElement.value = "${sessionScope.userEmail}";

        document.getElementById('edit-container').style.display = 'block';
    }

    function generateUUID() { 
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
            var r = Math.random() * 16 | 0,
                v = c === 'x' ? r : (r & 0x3 | 0x8);
            return v.toString(16);
        });
    }

    function requestApproval() {
        const approvalData = {
            apid: generateUUID(),
            content: document.getElementById('edit-description').value,
            email: document.getElementById('edit-email').value,
            approvalStatus: '결재 대기',
            nickname: document.getElementById('edit-author').value
        };

        $.ajax({
            type: "POST",
            url: "/requestApproval",
            contentType: "application/json",
            data: JSON.stringify(approvalData),
            success: function(response) {
                alert(response);
                window.location.href = "/approval";
            },
            error: function(xhr, status, error) {
                console.error("Status: ", status);
                console.error("Error: ", error);
                console.error("Response: ", xhr.responseText);
                alert(xhr.responseText);
            }
        });
    }

    function updateTask() {
        const tkid = document.getElementById('edit-tkid').value;
        const name = document.getElementById('edit-name').value;
        const description = document.getElementById('edit-description').value;
        const sid = document.getElementById('edit-sid').value;
        const approvalStatus = document.getElementById('approval-status').value;

        const taskData = {
            tkid: tkid,
            name: name,
            description: description,
            sid: sid,
            approvalStatus: approvalStatus
        };

        $.ajax({
            type: "POST",
            url: "/updateTask",
            contentType: "application/json",
            data: JSON.stringify(taskData),
            success: function(response) {
                alert(response);
                location.reload(); 
            },
            error: function(xhr, status, error) {
                console.error("Status: ", status);
                console.error("Error: ", error);
                console.error("Response: ", xhr.responseText);
                alert(xhr.responseText);
            }
        });
    }

    function openModal(tkid, name, description, sid, startDate, endDate, author, approvalStatus) {
        document.getElementById('details-tkid').value = tkid;
        document.getElementById('details-name').value = name;
        document.getElementById('details-description').value = description;
        document.getElementById('details-sid').value = sid;
        document.getElementById('details-start_date').value = startDate;
        document.getElementById('details-end_date').value = endDate;
        document.getElementById('details-author').value = author;
        document.getElementById('details-approval_status').value = approvalStatus;
        
        document.getElementById('details-modal').style.display = 'block';
    }

    function closeModal() {
        document.getElementById('details-modal').style.display = 'none';
    }
    </script>

    <div id="title-modal" class="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal()">&times;</span>
            <h2>제목 변경</h2>
            <input type="text" id="title-input" placeholder="새 제목을 입력하세요">
            <button type="button" onclick="updateTitle()">등록</button>
        </div>
    </div>

    <jsp:include page="/headerSidebar.jsp" />
    <script src="${path}/assets/plugins/popper.min.js"></script>
    <script src="${path}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="${path}/assets/js/app.js"></script>
    <script src="${path}/assets/plugins/jquery/jquery.min.js"></script>
    <script src="${path}/assets/js/taskjs.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>    
</body>
</html>
