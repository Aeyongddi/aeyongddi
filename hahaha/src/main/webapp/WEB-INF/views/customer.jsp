<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAE - 고객정보 조회</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<jsp:include page="header.jsp" />
<style>
td {
	text-align: center;
}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
	src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api"
	type="text/javascript"></script>

<script type="text/javascript">
	//주민번호 유효성 검사
	function validateSSN(ssnFront, ssnBack) {
		const ssnRegexFront = /^\d{6}$/;
		const ssnRegexBack = /^\d{7}$/;
		return ssnRegexFront.test(ssnFront) && ssnRegexBack.test(ssnBack);
	}

	// 여권번호 유효성 검사
	function validatePassport(passport) {
		const passportRegex = /^[A-Z]{1}\d{8}$/;
		return passportRegex.test(passport);
	}

	function showDetails(id, name, ssn, email, passport, phone, address) {
		document.getElementById('modal-customer-id').value = id;
		document.getElementById('modal-name').value = name;
		document.getElementById('modal-ssn-front').value = ssn.split('-')[0];
		document.getElementById('modal-ssn-back').value = ssn.split('-')[1];
		document.getElementById('modal-email').value = email;
		document.getElementById('modal-passport').value = passport;
		document.getElementById('modal-phone').value = phone;
		document.getElementById('modal-address').value = address;
		$('#detailModal').modal('show');
	}

	function updateCustomer() {
		if (confirm("수정하시겠습니까?")) {
			const ssnFront = document.getElementById('modal-ssn-front').value;
			const ssnBack = document.getElementById('modal-ssn-back').value;
			const passport = document.getElementById('modal-passport').value;

			if (!validateSSN(ssnFront, ssnBack)) {
				alert("유효하지 않은 주민등록번호 형식입니다. 올바른 형식: YYYYMMDD-XXXXXXX");
				return;
			}

			if (!validatePassport(passport)) {
				alert("유효하지 않은 여권번호 형식입니다. 올바른 형식: A12345678");
				return;
			}

			const customer = {
				customer_id : document.getElementById('modal-customer-id').value,
				name : document.getElementById('modal-name').value,
				ssn : ssnFront + '-' + ssnBack,
				email : document.getElementById('modal-email').value,
				passport_number : document.getElementById('modal-passport').value,
				phone : document.getElementById('modal-phone').value,
				address : document.getElementById('modal-address').value
			};

			$.ajax({
				type : 'POST',
				url : 'updateCustomer.do',
				dataType : 'json',
				data : customer,
				success : function(response) {
					alert(response.msg === 'success' ? '수정성공' : '수정실패');
					if (response.msg === 'success') {
						location.reload(); // 수정 후 페이지를 새로고침하여 변경 사항을 반영
					}
				},
				error : function(xhr, status, error) {
					alert('수정 실패: ' + xhr.responseText); // 에러 메시지 로깅
				}
			});
		}
	}

	function deleteCustomer() {
		if (confirm("삭제하시겠습니까?")) {
			const ssn = document.getElementById('modal-ssn').value;

			$.ajax({
				type : 'POST',
				url : 'deleteCustomer.do',
				dataType : 'json',
				data : {
					ssn : ssn
				},
				success : function(response) {
					alert(response.msg === 'success' ? '삭제성공' : '삭제실패');
					if (response.msg === 'success') {
						location.reload(); // 삭제 후 페이지를 새로고침하여 변경 사항을 반영
					}
				},
				error : function(xhr, status, error) {
					alert('삭제 실패: ' + xhr.responseText); // 에러 메시지 로깅
				}
			});
		}
	}
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>고객정보 조회</h2>
	</div>
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input placeholder="이름" name="name" class="form-control mr-sm-2" />
				&nbsp; <input placeholder="전화번호" name="phone"
					class="form-control mr-sm-2" /> &nbsp; <input placeholder="여권번호"
					name="passport_number" class="form-control mr-sm-2" />
				<button class="btn btn-info" type="submit">
					<i class="bi bi-search"> <svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path
								d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
                        </svg>
					</i>
				</button>
			</nav>
		</form>
		<table class="table table-hover table-striped">
			<thead>
				<tr class="table-success text-center">
					<th>이름</th>
					<th>주민번호</th>
					<th>이메일</th>
					<th>여권번호</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>자세히 보기</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cus" items="${cusList}">
					<tr>
						<td>${cus.name }</td>
						<td>${cus.ssn.substring(0, 8)}******</td>
						<td>${cus.email }</td>
						<td>${cus.passport_number }</td>
						<td>${cus.phone }</td>
						<td>${cus.address }</td>
						<td>
							<button type="button" class="btn btn-success"
								onclick="showDetails('${cus.customer_id}', '${cus.name}', '${cus.ssn}', '${cus.email}', '${cus.passport_number}', '${cus.phone}', '${cus.address}')">
								<i class="bi bi-archive-fill"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-archive-fill"
										viewBox="0 0 16 16">
                                        <path
											d="M12.643 15C13.979 15 15 13.845 15 12.5V5H1v7.5C1 13.845 2.021 15 3.357 15zM5.5 7h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1M.8 1a.8.8 0 0 0-.8.8V3a.8.8 0 0 0 .8.8h14.4A.8.8 0 0 0 16 3V1.8a.8.8 0 0 0-.8-.8z" />
                                    </svg>
								</i>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="modal fade" id="detailModal" tabindex="-1" role="dialog"
		aria-labelledby="detailModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="detailModalLabel">고객 상세 정보</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="frm02" class="form" method="post">
						<input type="hidden" id="modal-customer-id">
						<div class="form-group">
							<label for="modal-name"><strong>이름:</strong></label> <input
								type="text" class="form-control" id="modal-name" readonly>
						</div>
						<div class="form-group row">
							<div class="col-md-5">
								<label for="modal-ssn-front"><strong>생년월일</strong></label> <input
									type="text" class="form-control" id="modal-ssn-front"
									maxlength="6">
							</div>
							<div class="col-md-1 text-center">
								<label>&nbsp;</label>
								<div>-</div>
							</div>
							<div class="col-md-6">
								<label for="modal-ssn-back"><strong>주민번호 뒷자리:</strong></label> <input
									type="password" class="form-control" id="modal-ssn-back"
									maxlength="7">
							</div>
						</div>

						<div class="form-group">
							<label for="modal-email"><strong>이메일:</strong></label> <input
								type="email" class="form-control" id="modal-email" readonly>
						</div>
						<div class="form-group">
							<label for="modal-passport"><strong>여권번호:</strong></label> <input
								type="text" class="form-control" id="modal-passport">
						</div>
						<div class="form-group">
							<label for="modal-phone"><strong>전화번호:</strong></label> <input
								type="text" class="form-control" id="modal-phone" readonly>
						</div>
						<div class="form-group">
							<label for="modal-address"><strong>주소:</strong></label> <input
								type="text" class="form-control" id="modal-address" readonly>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning"
						onclick="updateCustomer()">수정하기</button>
					<button type="button" class="btn btn-danger"
						onclick="deleteCustomer()">삭제하기</button>
						
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
