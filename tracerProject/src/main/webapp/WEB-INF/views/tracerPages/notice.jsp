<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.tracerProject.vo.User_info"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>게시판 검색</title>
<!-- Meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="게시판 검색">
<meta name="author" content="작성자">
<link rel="shortcut icon" href="favicon.ico">

<!-- FontAwesome JS -->
<script defer src="assets/plugins/fontawesome/js/all.min.js"></script>

<!-- App CSS -->
<link id="theme-style" rel="stylesheet" href="assets/css/portal.css">
<!-- <link rel="stylesheet" href="${path}/a00_com/project/board.css"> -->

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="assets/plugins/bootstrap/css/bootstrap.min.css">
</head>
<style>
.title-cell {
	max-width: 150px; /* 대략 10글자에 해당하는 너비 */
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.custom-link {
	color: black; /* 검은색 텍스트 */
	text-decoration: none; /* 밑줄 제거 */
}

.custom-link:hover {
	text-decoration: underline; /* 호버 시 밑줄 추가 (선택 사항) */
}
</style>
</style>
<body>
	<jsp:include page="/headerSidebar.jsp" />
	<br>
	<br>
	<div class="app-wrapper">
		<div class="app-content pt-3 p-md-3 p-lg-4">
			<div class="container-xl">
				<br> <br>

				<!-- 페이지 헤더 및 유틸리티 -->
				<div class="row g-3 mb-4 align-items-center justify-content-between">
					<div class="col-auto">
						<h1>
							<a class="app-page-title mb-0 custom-link" href="#"
								onclick="redirectToNotice()">공지사항</a>
						</h1>
					</div>
					<div class="col-auto">
						<div class="page-utilities">
							<div
								class="row g-2 justify-content-start justify-content-md-end align-items-center">
								<!-- 검색 폼 -->
								<div class="col-auto">
									<form action="/searchNotices" method="get">
										<input type="text" name="searchText" value="${searchText}"
											placeholder="검색어"> <select name="searchType">
											<option value="title"
												${searchType == 'title' ? 'selected' : ''}>제목</option>
											<option value="nickname"
												${searchType == 'nickname' ? 'selected' : ''}>작성자</option>
										</select>
										<button type="submit">검색</button>
									</form>
								</div>
								<!-- 등록 버튼 -->
								<div class="col-auto">
									<a class="btn app-btn-secondary" id="openModalButton"
										data-bs-toggle="modal" data-bs-target="#noticeModal">등록</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<nav id="orders-table-tab"
					class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
					<a class="flex-sm-fill text-sm-center nav-link active"
						id="orders-all-tab" data-bs-toggle="tab" href="#orders-all"
						role="tab" aria-controls="orders-all" aria-selected="true">공지사항
						게시판</a>
				</nav>

				<div class="tab-content" id="orders-table-tab-content">
					<div class="tab-pane fade show active" id="orders-all"
						role="tabpanel" aria-labelledby="orders-all-tab">
						<div class="app-card app-card-orders-table shadow-sm mb-5">
							<div class="app-card-body">
								<div class="table-responsive">
									<table class="table app-table-hover mb-0 text-left">
										<thead>
											<tr>
												<th class="cell">작성자</th>
												<th class="cell">이메일</th>
												<th class="cell">제목</th>
												<th class="cell">등록날짜</th>
												<th class="cell">기타</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach var="no" items="${NoticeList}">
												<tr>
													<td class="cell">${no.nickname}</td>
													<td class="cell">${no.email}</td>
													<td class="cell title-cell">
                                                        <a href="${pageContext.request.contextPath}/NoticeDetail?vid=${no.vid}">${no.title}</a>
                                                    </td>
													<td class="cell"><fmt:formatDate
															value="${no.date_of_registration}"
															pattern="yyyy-MM-dd HH:mm" /></td>
													<td class="cell"><a href="#"
														class="btn-sm app-btn-primary"
														onclick="openEditModal('${no.vid}'); return false;">수정</a>
														<a href="#" class="btn-sm app-btn-secondary delete-btn"
														onclick="deleteNotice('${no.vid}'); return false;">삭제</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 모달 창 -->
		<div class="modal fade" id="noticeModal" tabindex="-1"
			aria-labelledby="noticeModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="noticeModalLabel">공지사항 등록</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form id="noticeForm">
							<div class="mb-3">
								<label for="title" class="form-label">제목</label> <input
									type="text" class="form-control" id="title" name="title"
									required>
							</div>
							<div class="mb-3">
								<label for="content" class="form-label">내용</label>
								<textarea class="form-control" id="content" name="content"
									rows="3" required></textarea>
							</div>
							<div class="mb-3">
								<label for=nickname class="form-label">작성자</label> <input
									type="text" class="form-control" id="nickname" name="nickname"
									required>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">이메일</label> <input
									type="email" class="form-control" id="email" name="email"
									required>
							</div>
							<div class="mb-3">
								<label for="start_dateStr" class="form-label">시작 날짜</label> <input
									type="date" class="form-control" id="start_dateStr"
									name="start_dateStr">
							</div>
							<div class="mb-3">
								<label for="end_dateStr" class="form-label">종료 날짜</label> <input
									type="date" class="form-control" id="end_dateStr"
									name="end_dateStr">
							</div>
							<div class="mb-3">
								<label for="link" class="form-label">Link</label> <input
									type="text" class="form-control" id="link" name="link" required>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" id="submitNotice"
							style="background-color: #17A663; border-color: #17A663;">등록</button>
					</div>
				</div>
			</div>
		</div>

		<footer class="app-footer">
			<div class="container text-center py-3">
				<small class="copyright">Designed with <span class="sr-only">love</span><i
					class="fas fa-heart" style="color: #fb866a;"></i> by <a
					class="app-link" href="http://themes.3rdwavemedia.com"
					target="_blank">Xiaoying Riley</a> for developers
				</small>
			</div>
		</footer>
	</div>

	<!-- Javascript -->
	<script src="assets/plugins/popper.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

	<!-- Page Specific JS -->
	<script src="assets/js/app.js"></script>

	<script>
	 // 자바스크립트 기능을 위한 예시
	document.getElementById('submitNotice').addEventListener('click', function() {
    var form = document.getElementById('noticeForm');
    var formData = new FormData(form);

    var data = {};
    formData.forEach((value, key) => {
        data[key] = value;
    });

    // 제목이 10글자를 초과하면 자릅니다.
    if (data.title && data.title.length > 10) {
        data.title = data.title.slice(0, 10) + '...';
    }

    if (data.start_dateStr) {
        data.start_dateStr = new Date(data.start_dateStr).toISOString().split('T')[0];
    }
    if (data.end_dateStr) {
        data.end_dateStr = new Date(data.end_dateStr).toISOString().split('T')[0];
    }

    console.log('Form data:', data); // 디버깅: 데이터 내용 확인

    fetch('/noticeListInsert', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => {
        if (response.ok) {
            return response.text();
        } else {
            throw new Error('Network response was not ok.');
        }
    })
    .then(data => {
        alert(data);
        if (data === '등록성공') {
            window.location.reload();
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('등록 실패: ' + error.message);
    });
});
	
    document.addEventListener("DOMContentLoaded", function() {
        var userEmail = "${user_info.email}"; // JSP에서 사용자 이메일을 가져옵니다.
        if (userEmail) {
            document.getElementById('email').value = userEmail; // 이메일 필드를 자동으로 채웁니다.
        }
    });

    
    
    // 삭제하는 코드
    function deleteNotice(vid) {
        if (confirm('정말로 삭제하시겠습니까?')) {
            console.log(`Deleting notice with vid: ${vid}`); // 디버깅: vid 값 확인
            fetch('/deleteNotice', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({ 'vid': vid })
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok.');
                }
                return response.text();
            })
            .then(result => {
                console.log('Delete response:', result); // 디버깅: 응답 내용 확인
                alert(result);
                if (result.includes('삭제 성공')) {
                    window.location.reload(); // 성공 시 페이지 새로고침
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('삭제 실패: ' + error.message);
            });
        }
    }

    // 닉네임 가져오는 코드
    window.onload = function () {
        var nicknameField = document.getElementById('nickname');
        <%User_info user_info = (User_info) session.getAttribute("user_info");
if (user_info != null) {
	out.print("nicknameField.value = '" + user_info.getNickname() + "';");
}%>
    };
    
    // 새로 고침하는 코드 
    function redirectToNotice() {
        window.location.href = "http://localhost:5656/Notice";
    }
    </script>
</body>
</html>