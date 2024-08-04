<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TRACER</title>
<link rel="stylesheet" href="${path}/assets/css/portal.css">
<!-- FontAwesome JS -->
<script defer src="${path}/assets/plugins/fontawesome/js/all.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${path}/assets/plugins/bootstrap/css/bootstrap.min.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="${path}/a00_com/project/task.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<style>
#edit-name {
    border: none;
}

.edit-container {
    display: none;
    position: fixed;
    top: 0;
    right: 0;
    width: 50%;
    height: 100%;
    background-color: white;
    box-shadow: -2px 0 5px rgba(0, 0, 0, 0.5);
    padding: 20px;
    z-index: 1000;
}

.edit-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #ccc;
    padding-bottom: 20px;
}

.edit-content {
    margin-top: 20px;
}

.issue-summary {
    cursor: pointer;
}

.issue-summary:hover {
    text-decoration: underline;
}

.textarea-container {
    display: none;
    margin-top: 20px;
}

.calendar {
    position: absolute;
    border: 1px solid #ccc;
    background-color: white;
    padding: 10px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    z-index: 1000;
}

.calendar.hidden {
    display: none;
}

.calendar .day {
    display: inline-block;
    width: 30px;
    height: 30px;
    text-align: center;
    line-height: 30px;
    cursor: pointer;
    margin: 2px;
}

-- 닫기 css
.textarea-container {
    display: none;
    margin-top: 20px;
}

.btn-secondary {
    background-color: #5a6268;
    border: 1px solid #5a6268;
    color: white;
    margin-left: 10px;
}
.btn-secondary:hover {
    background-color: #5a6268;
    border-color: #5a6268;
}
--
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
            <span class="issue-count"> 3개 이슈 <select
                onchange="handleSelectChange(this.value)">
                    <option value="">선택</option>
                    <option value="edit">편집</option>
                    <option value="delete">삭제</option>
            </select>
            </span>
        </div>
        <ul class="issue-list">
            <c:forEach var="task" items="${taskList}">
                <li class="issue-item"><input type="checkbox"
                    class="issue-checkbox" id="issue-${task.tkid}" value="${task.tkid}">
                    <label for="issue-${task.tkid}" class="issue-key">${task.tkid}</label>
                    <span class="issue-summary"
                    onclick="openEditContainer('${task.tkid}', '${task.name}', '${task.description}', '${task.sid}')">
                        ${task.name} </span> <span class="issue-status"> <select
                        class="form-select" name="status-${task.tkid}"
                        id="status-${task.tkid}"
                        onchange="updateStatus('${task.tkid}', this.value)">
                            <option value="0" ${task.endYN ? '' : 'selected'}>진행중</option>
                            <option value="1" ${task.endYN ? 'selected' : ''}>완료</option>
                    </select>
                </span></li>
            </c:forEach>
        </ul>
        <button class="add-issue" onclick="openTextarea()">+ 이슈 만들기</button>
        <div class="textarea-container" id="textarea-container">
            <textarea id="issue-name" placeholder="이슈 제목을 입력하세요..."></textarea>
            <div class="date-picker-wrapper">
                시작 날짜 <input type="text" id="issue-start-date" class="custom-date-input"> 종료 날짜 <input type="text" id="issue-end-date" class="custom-date-input">
            </div>
            <button type="button" class="btn btn-primary" onclick="saveIssue()">저장</button>
            <button type="button" class="btn btn-secondary" onclick="closeTextarea()">닫기</button>
        </div>
    </div>
    <!-- 수정창 코드-->
    <div class="edit-container" id="edit-container">
        <div class="edit-header">
            <label for="edit-name"></label> <input type="text" id="edit-name"
                style="font-size: 72px">
        </div>
        <div class="edit-content">
            <form id="edit-form">
                <input type="hidden" id="edit-tkid">
                <div class="form-group">
                    <label for="edit-description">설명</label>
                  
                  0  <textarea id="edit-description" class="form-control"></textarea>
                </div>
                <div class="form-group">
                    <label for="edit-sid">SID</label> <input type="text" id="edit-sid"
                        class="form-control">
                </div>
            </form>
            <div>
                <button type="button" class="btn btn-primary"
                    onclick="updateReservation(${reservation.reservation})">업데이트</button>
            </div>
        </div>
    </div>

    <jsp:include page="/headerSidebar.jsp" />

    <script src="${path}/assets/plugins/popper.min.js"></script>
    <script src="${path}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="${path}/assets/js/app.js"></script>
    <script src="${path}/assets/plugins/jquery/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script>
        /* 모든 체크박스 요소를 선택 */
        function toggleAll(source) {
            const checkboxes = document.querySelectorAll('.issue-checkbox');
            checkboxes.forEach(checkbox => checkbox.checked = source.checked);
        }
        /* "편집" 또는 "삭제"를 선택 코드*/
        function handleSelectChange(action) {
            const checkboxes = document.querySelectorAll('.issue-checkbox:checked');
            const selectedTkIds = Array.from(checkboxes).map(cb => cb.value);

            if (action === "edit") {
                if (selectedTkIds.length === 1) {
                    const issue = document.querySelector(`.issue-item input[value="${selectedTkIds[0]}"]`);
                    const tkid = issue.value;
                    const name = issue.getAttribute('data-name');
                    const description = issue.getAttribute('data-description');
                    const sid = issue.getAttribute('data-sid');
                    openEditContainer(tkid, name, description, sid);
                } else {
                    alert("편집할 항목을 하나만 선택해 주세요.");
                }
            } else if (action === "delete") {
                deleteSelected(selectedTkIds);
            }
        }
        /* 이 함수는 이슈를 편집할 수 있는 컨테이너를 표시 코드*/
        function openEditContainer(tkid, name, description, sid) {
            document.getElementById('edit-tkid').value = tkid;
            document.getElementById('edit-name').value = name || '';
            document.getElementById('edit-description').value = description || '';
            document.getElementById('edit-sid').value = sid || '';
            document.getElementById('edit-container').style.display = 'block';
        }

        function closeEditContainer() {
            document.getElementById('edit-container').style.display = 'none';
        }

        function openTextarea() {
            document.getElementById('textarea-container').style.display = 'block';
        }

        /* 등록하는 코드 */
        function saveIssue() {
            const issueName = document.getElementById('issue-name').value.trim();
            const startDate = document.getElementById('issue-start-date').value;
            const endDate = document.getElementById('issue-end-date').value;

            if (issueName === '') {
                alert('제목을 입력해 주세요.');
                return;
            }

            $.ajax({
                url: '/taskListInsert',
                type: 'POST',
                data: JSON.stringify({
                    "name": issueName,
                    "description": null, // 기본값 설정
                    "sid": null, // 기본값 설정
                    "endYN": false, // 기본값 설정
                    "start_date": startDate || null, // 날짜 값 설정
                    "end_date": endDate || null // 날짜 값 설정
                }),
                contentType: 'application/json',
                success: function(response) {
                    console.log('성공:', response);
                    location.reload(); // 페이지 새로고침
                },
                error: function(xhr, status, error) {
                    console.error('오류:', error);
                }
            });
        }
        /* 삭제 하는 기능 */
        function deleteSelected(tkids) {
            if (tkids.length === 0) {
                alert('삭제할 항목을 선택해 주세요.');
                return;
            }

            if (confirm('선택한 항목을 삭제하시겠습니까?')) {
                $.ajax({
                    url: '/taskDelete',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({ ids: tkids }),
                    success: function (response) {
                        console.log('Response:', response);
                        location.reload(); // 페이지 새로고침
                    },
                    error: function (xhr, status, error) {
                        console.error('Error:', error);
                        alert('삭제 요청 중 오류가 발생했습니다.');
                    }
                });
            }
        }
        /* endYN DB에 바로 적용 하는 코드*/
        function updateStatus(tkid, status) {
            // status가 '0'이면 false, '1'이면 true로 변환
            const endYN = status === '1';

            $.ajax({
                url: '/updateTaskStatus',
                type: 'POST',
                data: JSON.stringify({ tkid: tkid, endYN: endYN }),
                contentType: 'application/json',
                success: function(response) {
                    console.log('Status updated:', response);
                },
                error: function(xhr, status, error) {
                    console.error('Error updating status:', error);
                }
            });
        }

        document.addEventListener('click', function(event) {
            const editContainer = document.getElementById('edit-container');
            if (editContainer.style.display === 'block' && !editContainer.contains(event.target) && !event.target.classList.contains('issue-summary')) {
                closeEditContainer();
            }
        });

        /*엔터키 등록하는 코드*/
        document.addEventListener('keydown', function (event) {
            if (event.key === 'Enter') {
                event.preventDefault();
                saveIssue();
            }
        });

        /* Flatpickr 설정 */
        document.addEventListener('DOMContentLoaded', function() {
            flatpickr("#issue-start-date", {
              dateFormat: "Y-m-d",
            });

            flatpickr("#issue-end-date", {
              dateFormat: "Y-m-d",
            });
        });

        function updateReservation(reservationId) {
            var formData = $('#form' + reservationId).serialize(); // 폼 데이터 직렬화

            $.ajax({
                type: "POST",
                url: "${path}/updateTask",
                data: formData,
                success: function(response) {
                    alert("예약이 성공적으로 업데이트되었습니다.");
                    $('#detailsModal' + reservationId).modal('hide'); // 모달 닫기
                    window.location.href = "${path}/taskList"; // 리스트 페이지로 이동
                },
                error: function(xhr, status, error) {
                    alert("업데이트 중 오류가 발생하였습니다: " + error);
                }
            });
        }
        
        // 저장 옆에 닫기 버튼 
        function closeTextarea() {
            document.getElementById('textarea-container').style.display = 'none';
        }
    </script>
</body>
</html>
