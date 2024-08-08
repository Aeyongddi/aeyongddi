<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Portal - Bootstrap 5 Admin Dashboard Template For
	Developers</title>
<!-- Meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Portal - Bootstrap 5 Admin Dashboard Template For Developers">
<meta name="author" content="Xiaoying Riley at 3rd Wave Media">
<link rel="shortcut icon" href="favicon.ico">
<!-- FontAwesome JS -->
<script defer src="assets/plugins/fontawesome/js/all.min.js"></script>
<!-- App CSS -->
<link id="theme-style" rel="stylesheet" href="assets/css/portal.css">
</head>

<style>
.custom-select-width {
	width: 110px; /* 원하는 너비로 조정 */
}

.modal-header {
    background-color: #17A663; /* 배경색상 설정 */
    color: #ffffff; /* 텍스트 색상 흰색 */
}



/* 등록 버튼 텍스트 색상 흰색 */
.btn-primary {
    background-color: #17A663; /* 버튼 배경색상 설정 */
    border-color: #17A663; /* 버튼 테두리 색상 설정 */
    color: #ffffff; /* 버튼 텍스트 색상 흰색 */
}

.btn-primary:hover {
    background-color: #138c53; /* 버튼 호버 시 배경색상 설정 */
    border-color: #138c53; /* 버튼 호버 시 테두리 색상 설정 */
}

-- 게시판 제목 게시일 조회수 글씨 크기
.table thead th {
    font-size: 32rem; /* 원하는 글씨 크기로 조정 (예: 1.2rem) */
}
</style>

<body>
	<jsp:include page="/headerSidebar.jsp" />
	<div class="app-wrapper">
		<div class="app-content pt-3 p-md-3 p-lg-4">
			<div class="container-xl">
				<br> <br>
				<div class="row g-3 mb-4 align-items-center justify-content-between">
					<div class="col-auto">
						<h1 class="app-page-title mb-0">Orders</h1>
					</div>
					<div class="col-auto">
						<div class="page-utilities">
							<div
								class="row g-2 justify-content-start justify-content-md-end align-items-center">
								<div class="col-auto">
									<form class="table-search-form row gx-1 align-items-center">
										<div class="col-auto">
											<input type="text" id="search-orders" name="searchorders"
												class="form-control search-orders" placeholder="Search">
										</div>
										<div class="col-auto">
											<button type="submit" class="btn app-btn-secondary">Search</button>
										</div>
									</form>
								</div>
								<div class="col-auto">
									<select class="form-select w-auto">
										<option selected value="option-1">All</option>
										<option value="option-2">This week</option>
										<option value="option-3">This month</option>
										<option value="option-4">Last 3 months</option>
									</select>
								</div>
								<div class="col-auto">
									<a class="btn app-btn-secondary" id="openModalButton"
										data-bs-toggle="modal" data-bs-target="#orderDetailsModal">등록</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<nav id="orders-table-tab"
					class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
					<a class="flex-sm-fill text-sm-center nav-link active"
						id="orders-all-tab" data-bs-toggle="tab" href="#orders-all"
						role="tab" aria-controls="orders-all" aria-selected="true">리스트게시판</a>
				</nav>

				<div class="tab-content" id="orders-table-tab-content">
					<div class="tab-pane fade show active" id="orders-all"
						role="tabpanel" aria-labelledby="orders-all-tab">
						<div class="app-card app-card-orders-table shadow-sm mb-5">
							<div class="app-card-body">
								<div class="table-responsive">
									<table class="table app-table-hover mb-0 text-left">
										<thead class="table-header">
											<tr>
												<th class="cell">게시판</th>
												<th class="cell">제목</th>
												<th class="cell">게시일</th>
												<th class="cell">조회수</th>
												<th class="cell">작성자</th>
												<th class="cell">진행사항</th>
												<th class="cell">결재</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="boa" items="${boardList}">
												<tr>
													<td class="cell">${boa.bid}</td>
													<td class="cell">${boa.title}</td>
													<td class="cell"><fmt:formatDate
															value="${boa.upt_date}" pattern="yyyy-MM-dd" /></td>
													<td class="cell">${boa.views}</td>
													<td class="cell">${boa.email}</td>
													<td class="cell"><select class="form-select"
														id="modal-endYN-${boa.bid}" name="endYN"
														onchange="updateStatus('${boa.bid}', this.value)">
															<option value="0" ${boa.endYN ? 'selected' : ''}>진행중</option>
															<option value="1" ${!boa.endYN ? 'selected' : ''}>완료</option>
													</select></td>
													<td class="cell"><a class="btn-sm app-btn-secondary"
														href="#">올리기</a> <a class="btn-sm app-btn-secondary"
														href="#">삭제</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

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

				<!-- 모달 창 -->
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
				<!-- Javascript -->
				<script src="assets/plugins/popper.min.js"></script>
				<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
				<script type="text/javascript">
				$(document).ready(function() {
				    // '등록' 버튼 클릭 시 AJAX 요청을 보낼 수 있도록 설정
				    $("#orderDetailsForm").on("submit", function(event) {
				        event.preventDefault(); // 폼 제출 기본 동작 방지

				        // 사용자 입력을 가져오기
				        var title = $("#modal-title").val();
				        var content = $("#modal-content").val(); // 사용자 입력이 없으면 빈 문자열로 처리
				        var uptDate = new Date().toISOString(); // 현재 날짜와 시간을 ISO 문자열로 변환
				        var views = parseInt($("#viewsInput").val(), 10); // 숫자로 변환
				        var btype = $("#btypeInput").val();
				        var cid = $("#modal-cid").val();
				        var email = $("#modal-email").val();
				        var sid = $("#modal-sid").val();

				        // AJAX 요청 보내기
				        $.ajax({
				            url : '/boardListInsert', // 서버의 엔드포인트 URL (수정 필요)
				            type : 'POST',
				            contentType : 'application/json',
				            data : JSON.stringify({
				                title : title,
				                content : content || null,  // 빈 문자열이 아니라 null로 설정
				                upt_date : uptDate,  // 자동으로 설정된 현재 날짜
				                views : isNaN(views) ? null : views, // 숫자가 아닌 경우 null로 설정
				                btype : btype,
				                cid : cid,
				                email : email,
				                sid : sid
				                // endYN을 보내지 않음
				            }),
				            success : function(response) {
				                console.log("Success:", response);
				                // 성공적으로 처리된 경우 사용자에게 알림
				                alert("등록 성공");
				                // 모달 닫기
				                $('#orderDetailsModal').modal('hide');
				                // 페이지 새로고침
				                location.reload();
				            },
				            error : function(xhr, status, error) {
				                console.error("Error:", error);
				                // 오류 발생 시 사용자에게 알림
				                alert("등록 실패하였습니다.");
				            }
				        });
				    });

				    // 상태 업데이트 함수
				    function updateStatus(bid, newStatus) {
				        $.ajax({
				            url : '/updateBoardStatus',
				            type : 'POST',
				            contentType : 'application/json',
				            data : JSON.stringify({
				                bid : bid,
				                endYN : newStatus === '1' // '1'은 true, '0'은 false
				            }),
				            success : function(response) {
				                console.log('Status updated successfully:', response);
				            },
				            error : function(xhr, status, error) {
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
				});
				</script>
				<!-- Page Specific JS -->
				<script src="assets/js/app.js"></script>
			</div>
		</div>
	</div>
</body>
</html>
