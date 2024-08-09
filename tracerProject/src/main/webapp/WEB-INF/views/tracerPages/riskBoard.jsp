<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- Custom Styles -->
<style>
.custom-select-width {
	width: 150px; /* 검색 select 박스 너비 조정 */
}

.modal-header {
	background-color: #17A663; /* 배경색상 설정 */
	color: #ffffff; /* 텍스트 색상 흰색 */
}

.btn-primary {
	background-color: #17A663; /* 버튼 배경색상 설정 */
	border-color: #17A663; /* 버튼 테두리 색상 설정 */
	color: #ffffff; /* 버튼 텍스트 색상 흰색 */
}

.btn-primary:hover {
	background-color: #138c53; /* 버튼 호버 시 배경색상 설정 */
	border-color: #138c53; /* 버튼 호버 시 테두리 색상 설정 */
}

.table thead th {
	font-size: 1.2rem; /* 글씨 크기를 1.2rem으로 설정 */
}
</style>
</head>

<body>
	<jsp:include page="/headerSidebar.jsp" />

	<div class="app-wrapper">
		<div class="app-content pt-3 p-md-3 p-lg-4">
			<div class="container-xl">
				<br> <br>

				<!-- Page Header and Utilities -->
				<div class="row g-3 mb-4 align-items-center justify-content-between">
					<div class="col-auto">
						<h1 class="app-page-title mb-0">게시판</h1>
					</div>
					<div class="col-auto">
						<div class="page-utilities">
							<div
								class="row g-2 justify-content-start justify-content-md-end align-items-center">
								<!-- Search Form -->
								<div class="col-auto">
									<form action="/search" method="get">
										<input type="text" name="searchText" value="${searchText}"
											placeholder="검색어"> <select name="searchType">
											<option value="title"
												${searchType == 'title' ? 'selected' : ''}>제목</option>
											<option value="name"
												${searchType == 'name' ? 'selected' : ''}>작성자</option>
										</select>
										<button type="submit">검색</button>
									</form>
								</div>
								<!-- Register Button -->
								<div class="col-auto">
									<a class="btn app-btn-secondary" id="openModalButton"
										data-bs-toggle="modal" data-bs-target="#orderDetailsModal">등록</a>
								</div>
							</div>
						</div>
					</div>

					<!-- Orders Table Tabs -->
					<nav id="orders-table-tab"
						class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
						<a class="flex-sm-fill text-sm-center nav-link active"
							id="orders-all-tab" data-bs-toggle="tab" href="#orders-all"
							role="tab" aria-controls="orders-all" aria-selected="true">리스트
							게시판</a>
					</nav>

					<!-- Orders Table Content -->
					<div class="tab-content" id="orders-table-tab-content">
						<div class="tab-pane fade show active" id="orders-all"
							role="tabpanel" aria-labelledby="orders-all-tab">
							<div class="app-card app-card-orders-table shadow-sm mb-5">
								<div class="app-card-body">
									<div class="table-responsive">
										<table class="table app-table-hover mb-0 text-left">
											<thead class="table-header">
												<tr>
													<th class="cell">제목</th>
													<th class="cell">게시일</th>
													<th class="cell">링크</th>
													<th class="cell">작성자</th>
													<th class="cell">이메일</th>
													<th class="cell">진행사항</th>
													<th class="cell">결재</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="boa" items="${boardList}">
													<tr>
														<td class="cell"
															onclick="openEditModal('${boa.bid}', '${boa.title}', '${boa.content}', '${boa.email}', '${boa.cid}', '${boa.sid}', '${boa.uf}', '${boa.name}')">${boa.title}</td>
														<td class="cell"><fmt:formatDate
																value="${boa.upt_date}" pattern="yyyy-MM-dd HH:mm" /></td>
											        	<td class="cell"><c:if test="${not empty boa.uf}">
                                                            <a href="${boa.uf}" target="_blank">${boa.uf}</a>
                                                        </c:if></td>
														<td class="cell"
															onclick="openEditModal('${boa.bid}', '${boa.title}', '${boa.content}', '${boa.email}', '${boa.cid}', '${boa.sid}', '${boa.uf}', '${boa.name}')">${boa.name}</td>
														<td class="cell"
															onclick="openEditModal('${boa.bid}', '${boa.title}', '${boa.content}', '${boa.email}', '${boa.cid}', '${boa.sid}', '${boa.uf}', '${boa.name}')">${boa.email}</td>
														<td class="cell"><select class="form-select"
															id="modal-endYN-${boa.bid}" name="endYN"
															onchange="updateStatus('${boa.bid}', this.value)">
																<option value="0" ${boa.endYN ? 'selected' : ''}>진행중</option>
																<option value="1" ${!boa.endYN ? 'selected' : ''}>완료</option>
														</select></td>
														<td class="cell"><a href="#"
															class="btn-sm app-btn-secondary"
															onclick="deleteBoard('${boa.bid}'); return false;">삭제</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Pagination -->
					<nav class="app-pagination">
						<ul class="pagination justify-content-center">
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1" aria-disabled="true">Previous</a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</nav>

					<!-- Modal -->
					<div class="modal fade" id="orderDetailsModal" tabindex="-1"
						aria-labelledby="orderDetailsModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="orderDetailsModalLabel">게시판 등록</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="닫기"></button>
								</div>
								<div class="modal-body">
									<form id="orderDetailsForm">
										<div class="mb-3">
											<label for="modal-title" class="form-label">제목</label> <input
												type="text" class="form-control" id="modal-title"
												name="title" required>
										</div>
										<div class="mb-3">
											<label for="modal-content" class="form-label">내용</label>
											<textarea class="form-control" id="modal-content"
												name="content" rows="3" required></textarea>
										</div>
										<div class="mb-3">
											<label for="modal-email" class="form-label">이메일</label> <input
												type="email" class="form-control" id="modal-email"
												name="email">
										</div>
										<div class="mb-3">
											<label for="modal-cid" class="form-label">댓글 ID</label> <input
												type="text" class="form-control" id="modal-cid" name="cid"
												required>
										</div>
										<div class="mb-3">
											<label for="modal-sid" class="form-label">프로젝트 ID</label> <input
												type="text" class="form-control" id="modal-sid" name="sid"
												required>
										</div>
										<div class="mb-3">
											<label for="modal-uf" class="form-label">URL</label> <input
												type="text" class="form-control" id="modal-uf" name="uf">
										</div>
										<div class="mb-3">
											<label for="modal-name" class="form-label">이름</label> <input
												type="text" class="form-control" id="modal-name" name="name">
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary">등록</button>
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">닫기</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>

					<!-- 수정하는 모달창 -->
					<div class="modal fade" id="editDetailsModal" tabindex="-1"
						aria-labelledby="editDetailsModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="editDetailsModalLabel">게시판 수정</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="닫기"></button>
								</div>
								<div class="modal-body">
									<form id="editDetailsForm">
										<input type="hidden" id="edit-bid" name="bid">

										<!-- 제목 입력 필드 -->
										<div class="mb-3">
											<label for="edit-title" class="form-label">제목</label> <input
												type="text" class="form-control" id="edit-title"
												name="title" required>
										</div>

										<!-- 내용 입력 필드 -->
										<div class="mb-3">
											<label for="edit-content" class="form-label">내용</label>
											<textarea class="form-control" id="edit-content"
												name="content" rows="5" required></textarea>
										</div>

										<!-- URL 입력 필드 -->
										<div class="mb-3">
                                             <label for="edit-uf" class="form-label">URL</label> <input
                                              type="text" class="form-control" id="edit-uf" name="uf">
                                        </div>

										<!-- 진행상태 선택 필드 -->
										<div class="mb-3">
											<label for="edit-endYN" class="form-label">진행상태</label> <select
												class="form-select" id="edit-endYN" name="endYN">
												<option value="0">진행중</option>
												<option value="1">완료</option>
											</select>
										</div>

										<!-- 모달 푸터 -->
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary">수정</button>
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">닫기</button>
											<button type="button" class="btn btn-success"
												id="approve-btn">결재 올리기</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- Javascript -->
					<script src="assets/plugins/popper.min.js"></script>
					<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
					<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
					<script type="text/javascript">
					$(document).ready(function() {
					    // '등록' 버튼 클릭 시 AJAX 요청을 보낼 수 있도록 설정
					    $("#orderDetailsForm").on("submit", function(event) {
					        event.preventDefault(); // 폼 제출 기본 동작 방지

					        // 사용자 입력을 가져오기
					        var formData = {
					            title: $("#modal-title").val(),
					            content: $("#modal-content").val(),
					            email: $("#modal-email").val(),
					            cid: $("#modal-cid").val(),
					            sid: $("#modal-sid").val(),
					            uf: $("#modal-uf").val(),
					            name: $("#modal-name").val()
					        };

					        // AJAX 요청 보내기
					        $.ajax({
					            url: '/boardListInsert',
					            type: 'POST',
					            contentType: 'application/json',
					            data: JSON.stringify(formData),
					            success: function(response) {
					                console.log("Success:", response);
					                alert("등록 성공");
					                $('#orderDetailsModal').modal('hide');
					                location.reload();
					            },
					            error: function(xhr, status, error) {
					                console.error("Error:", error);
					                alert("등록 실패하였습니다.");
					            }
					        });
					    });

					    // 상태 업데이트 함수
					    function updateStatus(bid, newStatus) {
					        $.ajax({
					            url: '/updateBoardStatus',
					            type: 'POST',
					            contentType: 'application/json',
					            data: JSON.stringify({
					                bid: bid,
					                endYN: newStatus === '1'
					            }),
					            success: function(response) {
					                console.log('Status updated successfully:', response);
					            },
					            error: function(xhr, status, error) {
					                console.error('Error updating status:', error);
					                alert('상태 업데이트 중 오류가 발생했습니다.');
					            }
					        });
					    }

					    // 상태 변경 시 호출되는 이벤트 핸들러
					    $('select[name="endYN"]').on('change', function() {
					        var bid = $(this).attr('id').split('-').pop(); // ID에서 bid 추출
					        var newStatus = $(this).val(); // 선택된 값 (0 또는 1)
					        updateStatus(bid, newStatus);
					    });

					    // 수정 모달 열기
					   window.openEditModal = function(bid, title, content, uf, email, cid, sid, name) {
    console.log("UF:", uf); // 콘솔에서 확인
    $("#edit-bid").val(bid);
    $("#edit-title").val(title);
    $("#edit-content").val(content);
    $("#edit-uf").val(uf);
    $("#edit-email").val(email); // email 값을 넣는 것이 좋을 수도 있습니다.
    $("#edit-cid").val(cid);
    $("#edit-sid").val(sid);
    $("#edit-name").val(name);
    $("#editDetailsModal").modal('show');
};

					    // '수정' 버튼 클릭 시 AJAX 요청을 보낼 수 있도록 설정
					    $("#editDetailsForm").on("submit", function(event) {
					        event.preventDefault(); // 폼 제출 기본 동작 방지

					        // 사용자 입력을 가져오기
					        var formData = {
					            bid: $("#edit-bid").val(),
					            title: $("#edit-title").val(),
					            content: $("#edit-content").val(),
					            uf: $("#edit-uf").val(),
					            endYN: $("#edit-endYN").val()
					        };

					        // AJAX 요청 보내기
					        $.ajax({
					            url: '/boardUpdate',
					            type: 'POST',
					            contentType: 'application/json',
					            data: JSON.stringify(formData),
					            success: function(response) {
					                console.log("Success:", response);
					                alert("수정 성공");
					                $('#editDetailsModal').modal('hide');
					                location.reload();
					            },
					            error: function(xhr, status, error) {
					                console.error("Error:", error);
					                alert("수정 실패하였습니다.");
					            }
					        });
					    });
					});
						// 삭제하는 코드
						function deleteBoard(bid) {
							if (confirm('정말 삭제하시겠습니까?')) {
								$.ajax({
									url : '/delete/' + bid, // 삭제 URL
									type : 'DELETE',
									success : function(response) {
										alert(response); // 서버로부터 받은 응답 메시지 표시
										location.reload(); // 페이지 새로고침
									},
									error : function(xhr, status, error) {
										console.error('Error:', error);
										alert('삭제 중 오류가 발생했습니다.');
									}
								});
							}
						}
					</script>
					<!-- Page Specific JS -->
					<script src="assets/js/app.js"></script>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
