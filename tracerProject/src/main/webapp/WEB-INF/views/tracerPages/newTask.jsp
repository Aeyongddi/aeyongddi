<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>TRACER - TODO</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="assets/css/portal.css">

<!-- jQuery 먼저 로드 -->
<script src="${path}/a00_com/jquery.min.js"></script>
<!-- Bootstrap JS 로드 -->
<script src="${path}/a00_com/bootstrap.min.js"></script>
</head>

<body class="app">
	<jsp:include page="/headerSidebar.jsp" />

	<div class="app-wrapper">
		<div class="app-content pt-3 p-md-3 p-lg-4">
			<div class="container-xl">
				<div class="row g-3 mb-4 align-items-center justify-content-between">
					<div class="col-auto">
						<h1 class="app-page-title mb-0">작업 관리</h1>
					</div>
				</div>

				<!-- Button to trigger modal -->
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#addTaskModal">작업 추가</button>

				<!-- Add Task Modal -->
				<div class="modal fade" id="addTaskModal" tabindex="-1"
					aria-labelledby="addTaskModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="addTaskModalLabel">Add Task</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form action="/newTask/add" method="post">
									<input type="hidden" name="tkid" value="${task.tkid}" /> <input
										type="hidden" name="sid" value="${sids[0]}" /> <input
										type="hidden" name="endYn" value="false" />

									<div class="form-group">
										<label for="name">제목</label> <input type="text"
											class="form-control" id="name" name="name" required>
									</div>

									<div class="form-group">
										<label for="description">설명</label>
										<textarea class="form-control" id="description"
											name="description" required></textarea>
									</div>

									<div class="form-group">
										<label for="startDate">시작 날짜</label> <input type="date"
											class="form-control" id="startDate" name="startDate" required>
									</div>

									<div class="form-group">
										<label for="endDate">종료 날짜</label> <input type="date"
											class="form-control" id="endDate" name="endDate">
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">닫기</button>
										<button type="submit" class="btn btn-primary">추가하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

				<!-- Task List -->
				<div class="app-card app-card-orders-table shadow-sm mb-5">
					<div class="app-card-body">
						<div class="table-responsive">
							<table class="table app-table-hover mb-0 text-left">
								<thead>
									<tr>
										<th class="cell">Task ID</th>
										<th class="cell">제목</th>
										<th class="cell">시작 날짜</th>
										<th class="cell">종료 날짜</th>
										<th class="cell">상태</th>
										<th class="cell">수정/삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="task" items="${tasks}">
										<tr>
											<td class="cell">${task.tkid}</td>
											<td class="cell">${task.name}</td>
											<td class="cell"><fmt:formatDate
													value="${task.startDate}" pattern="yyyy-MM-dd" /></td>
											<td class="cell"><fmt:formatDate value="${task.endDate}"
													pattern="yyyy-MM-dd" /></td>
											<td class="cell"><select
												class="form-control status-select"
												data-taskid="${task.tkid}">
													<option value="false" ${!task.endYn ? 'selected' : ''}>진행
														중</option>
													<option value="true" ${task.endYn ? 'selected' : ''}>완료</option>
											</select></td>
											<td class="cell">
												<!-- 수정 버튼 -->
												<button type="button" class="btn btn-sm btn-secondary"
													data-bs-toggle="modal"
													data-bs-target="#editTaskModal-${task.tkid}">수정</button>

												<!-- 삭제 버튼 -->
												<form action="/newTask/delete" method="post"
													style="display: inline;">
													<input type="hidden" name="tkid" value="${task.tkid}" /> <input
														type="hidden" name="sid" value="${task.sid}" />
													<button type="submit" class="btn btn-sm btn-danger">삭제</button>
												</form>
											</td>
										</tr>

										<!-- 수정 모달 -->
										<div class="modal fade" id="editTaskModal-${task.tkid}"
											tabindex="-1"
											aria-labelledby="editTaskModalLabel-${task.tkid}"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title"
															id="editTaskModalLabel-${task.tkid}">작업 수정</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<form action="/newTask/update" method="post">
															<input type="hidden" name="tkid" value="${task.tkid}" />
															<input type="hidden" name="sid" value="${task.sid}" />

															<div class="form-group">
																<label for="name-${task.tkid}">제목</label> <input
																	type="text" class="form-control" id="name-${task.tkid}"
																	name="name" value="${task.name}" required>
															</div>

															<div class="form-group">
																<label for="description-${task.tkid}">설명</label>
																<textarea class="form-control"
																	id="description-${task.tkid}" name="description"
																	required>${task.description}</textarea>
															</div>

															<div class="form-group">
																<label for="startDate-${task.tkid}">시작 날짜</label> <input
																	type="date" class="form-control"
																	id="startDate-${task.tkid}" name="startDate"
																	value="${task.startDate}" required>
															</div>

															<div class="form-group">
																<label for="endDate-${task.tkid}">종료 날짜</label> <input
																	type="date" class="form-control"
																	id="endDate-${task.tkid}" name="endDate"
																	value="${task.endDate}">
															</div>

															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-bs-dismiss="modal">닫기</button>
																<button type="submit" class="btn btn-primary">수정하기</button>
															</div>
														</form>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer class="app-footer">
			<div class="container text-center py-3">
				<small class="copyright">Designed with by <a
					class="app-link" href="http://themes.3rdwavemedia.com"
					target="_blank">Xiaoying Riley</a> for developers
				</small>
			</div>
		</footer>
	</div>

	<script>
    $(document).ready(function() {
        // 모든 편집 버튼에 대해 모달 창을 열 수 있도록 설정
        $('.btn-secondary').on('click', function() {
            var target = $(this).data('bs-target');
            $(target).modal('show');
        });

        // 상태 변경 시 AJAX 요청을 통해 상태 업데이트
        $('.status-select').on('change', function() {
            const taskId = $(this).data('taskid');
            const newStatus = $(this).val() === "true";

            fetch('/newTask/updateStatus', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    tkid: taskId,
                    endYn: newStatus
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('현재 상태가 수정되었습니다.');
                } else {
                    alert('현재 상태가 변경되지 않았습니다.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
        });
    });
    </script>

	<!-- Bootstrap JS 로드 -->
	<script src="assets/plugins/popper.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/app.js"></script>
</body>
</html>
