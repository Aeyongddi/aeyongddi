<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>TRACER - 자원 관리</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" contents="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="favicon.ico">
<script defer src="assets/plugins/fontawesome/js/all.min.js"></script>
<link id="theme-style" rel="stylesheet" href="assets/css/portal.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
.app-card-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.app-card-header .left-section {
	display: flex;
	align-items: center;
}

.app-card-header .left-section select {
	margin-left: 10px;
}
</style>
<script>
	function calculateRemainingDays(expiryDate) {
		const now = new Date();
		const expiry = new Date(expiryDate);
		const diffTime = expiry - now;
		const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
		let years = Math.floor(diffDays / 365);
		let months = Math.floor((diffDays % 365) / 30);
		let days = (diffDays % 365) % 30;
		return {
			totalDays : diffDays,
			years : years,
			months : months,
			days : days
		};
	}
	function updateRemainingDays() {
		document
				.querySelectorAll('.expiry-date')
				.forEach(
						function(elem) {
							const expiryDate = elem.dataset.expiry;
							const remaining = calculateRemainingDays(expiryDate);
							elem.innerHTML = `${remaining.totalDays}일 남음 (${remaining.years}년 ${remaining.months}월 ${remaining.days}일)`;
						});
	}
	document.addEventListener('DOMContentLoaded', updateRemainingDays);
	function formatPrice(price) {
		return price.toLocaleString() + ' 원';
	}
	document.addEventListener('DOMContentLoaded', function() {
		document.querySelectorAll('.software-price').forEach(function(elem) {
			const price = parseInt(elem.innerText.replace(/[^0-9]/g, ''), 10);
			elem.innerText = formatPrice(price);
		});
	});
</script>
</head>
<body>
	<jsp:include page="/headerSidebar.jsp" />
	<div class="app-wrapper">
		<div class="app-content pt-3 p-md-3 p-lg-4">
			<div class="container-xl">
				<br>
				<br>
				<h1 class="app-page-title">자원 관리</h1>
				<nav id="orders-table-tab"
					class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
					<a class="flex-sm-fill text-sm-center nav-link active"
						id="hr-management-tab" data-bs-toggle="tab" href="#hr-management"
						role="tab" aria-controls="hr-management" aria-selected="true">인적
						자원 관리</a> <a class="flex-sm-fill text-sm-center nav-link"
						id="budget-management-tab" data-bs-toggle="tab"
						href="#budget-management" role="tab"
						aria-controls="budget-management" aria-selected="false">예산 관리</a>
					<a class="flex-sm-fill text-sm-center nav-link"
						id="asset-management-tab" data-bs-toggle="tab"
						href="#asset-management" role="tab"
						aria-controls="asset-management" aria-selected="false">자산 관리</a>
				</nav>
				<div class="tab-content" id="orders-table-tab-content">
					<div class="tab-pane fade show active" id="hr-management"
						role="tabpanel" aria-labelledby="hr-management-tab">
						<div class="app-card app-card-orders-table shadow-sm mb-5">
							<div class="app-card-body">
								<div class="table-responsive">
									<table class="table app-table-hover mb-0 text-left">
										<thead>
											<tr>
												<th class="cell">이름</th>
												<th class="cell">이메일</th>
												<th class="cell">생일</th>
												<th class="cell">전화번호</th>
												<th class="cell">팀</th>
												<th class="cell">진행중인 프로젝트</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="user" items="${userInfoList}">
												<tr>
													<td class="cell">${user.name}</td>
													<td class="cell">${user.email}</td>
													<td class="cell"><fmt:formatDate value="${user.birth}"
															pattern="yyyy-MM-dd" /></td>
													<td class="cell">${user.phone}</td>
													<td class="cell"><c:forEach var="team"
															items="${user.teams}">
                                                        ${team.tid}<br>
														</c:forEach></td>
													<td class="cell"><c:forEach var="project"
															items="${user.projects}">
                                                        ${project.title}<br>
														</c:forEach></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					<!-- 예산 관리 탭 -->
					<div class="tab-pane fade" id="budget-management" role="tabpanel"
						aria-labelledby="budget-management-tab">
						<div class="app-card app-card-chart h-100 shadow-sm">
							<div class="app-card-header p-3 border-0">
								<div class="left-section">
									<h4 class="app-card-title">예산 현황</h4>
									<select
										class="form-select form-select-sm ms-3 d-inline-flex w-auto"
										id="budgetProjectSelect">
										<c:forEach var="project" items="${projectList}">
											<option value="${project.pid}">${project.title}</option>
										</c:forEach>
									</select>
								</div>
								<div class="card-header-action">
									<a href="#">자세히 보기</a>
								</div>
							</div>
							<div class="app-card-body p-3 p-lg-4">
								<div class="chart-container"
									style="position: relative; height: 40vh; width: 80vw">
									<canvas id="budgetDonutChart"></canvas>
								</div>
							</div>
						</div>
					</div>

					<!-- 자산 관리 탭 -->
					<div class="tab-pane fade" id="asset-management" role="tabpanel"
						aria-labelledby="asset-management-tab">
						<div class="app-card app-card-orders-table shadow-sm mb-5">
							<div class="app-card-body">
								<button class="btn btn-primary" data-bs-toggle="modal"
									data-bs-target="#addAssetModal">자산 추가</button>
								<div class="table-responsive">
									<table class="table app-table-hover mb-0 text-left">
										<thead>
											<tr>
												<th class="cell">자산 종류</th>
												<th class="cell">자산 이름</th>
												<th class="cell">구매일</th>
												<th class="cell">만료일</th>
												<th class="cell">가격</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="asset" items="${assetList}">
												<tr>
													<td class="cell"><c:choose>
															<c:when test="${asset.rtype == 'LICENSE'}">라이센스</c:when>
															<c:when test="${asset.rtype == 'FEE'}">이용료</c:when>
															<c:when test="${asset.rtype == 'EQUIPMENT'}">장비</c:when>
														</c:choose></td>
													<td class="cell">${asset.software_name}</td>
													<td class="cell"><fmt:formatDate
															value="${asset.license_purchase_date}"
															pattern="yyyy-MM-dd" /></td>
													<td class="cell"><fmt:formatDate
															value="${asset.license_expiry_date}" pattern="yyyy-MM-dd" /></td>
													<td class="cell software-price">${asset.software_price}</td>
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
		<footer class="app-footer">
			<div class="container text-center py-3">
				<small class="copyright">Designed with by <a
					class="app-link" href="http://themes.3rdwavemedia.com"
					target="_blank">Xiaoying Riley</a> for developers
				</small>
			</div>
		</footer>
	</div>

	<!-- 자산 추가 모달 -->
	<div class="modal fade" id="addAssetModal" tabindex="-1" aria-labelledby="addAssetModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="addAssetModalLabel">자산 추가</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <form id="addAssetForm">
	                    <div class="mb-3">
	                        <label for="assetProjectSelect" class="form-label">프로젝트 선택</label>
	                        <select class="form-select" id="assetProjectSelect" name="pid" required>
	                            <c:forEach var="project" items="${projectList}">
	                                <option value="${project.pid}">${project.title}</option>
	                            </c:forEach>
	                        </select>
	                    </div>
	                    <div class="mb-3">
	                        <label for="assetType" class="form-label">자산 종류</label>
	                        <select class="form-select" id="assetType" name="rtype" required>
	                            <option value="LICENSE">라이센스</option>
	                            <option value="FEE">이용료</option>
	                            <option value="EQUIPMENT">장비</option>
	                        </select>
	                    </div>
	                    <div class="mb-3">
	                        <label for="softwareName" class="form-label">자산 이름</label>
	                        <input type="text" class="form-control" id="softwareName" name="software_name" required>
	                    </div>
	                    <div class="mb-3">
	                        <label for="licensePurchaseDate" class="form-label">구매일</label>
	                        <input type="date" class="form-control" id="licensePurchaseDate" name="license_purchase_date" required>
	                    </div>
	                    <div class="mb-3">
	                        <label for="licenseExpiryDate" class="form-label">만료일</label>
	                        <input type="date" class="form-control" id="licenseExpiryDate" name="license_expiry_date" required>
	                    </div>
	                    <div class="mb-3">
	                        <label for="softwarePrice" class="form-label">가격</label>
	                        <input type="number" class="form-control" id="softwarePrice" name="software_price" required>
	                    </div>
	                    <button type="submit" class="btn btn-primary">저장</button>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>

	<!-- Javascript -->
	<script src="assets/plugins/popper.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugins/chart.js/chart.min.js"></script>
	<script src="assets/js/app.js"></script>
	<script>
		$(document).ready(function() {
			function updateChart(pid) {
				$.ajax({
					url : '/getBudget',
					type : 'GET',
					data : { pid : pid },
					success : function(data) {
						console.log(data);
						budgetDonutChart.data.datasets[0].data = [
							data.assigned_budget,
							data.used_budget
						];
						budgetDonutChart.update();
					},
					error : function(xhr, status, error) {
						console.error('Error: ' + error);
					},
					dataType : 'json'
				});
			}

			var ctx = document.getElementById('budgetDonutChart').getContext('2d');
			var budgetDonutChart = new Chart(ctx, {
				type : 'doughnut',
				data : {
					labels : [ '할당 예산', '사용 예산' ],
					datasets : [ {
						data : [ 0, 0 ], // 초기값으로 비워둠
						backgroundColor : [ '#36a2eb', '#ff6384' ]
					} ]
				},
				options : {
					responsive : true,
					maintainAspectRatio : false,
					legend : { position : 'top' },
					animation : { animateScale : true, animateRotate : true },
					tooltips : {
						callbacks : {
							label : function(tooltipItem, data) {
								var label = data.labels[tooltipItem.index];
								var value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
								return label + ': ' + value.toLocaleString() + ' 원';
							}
						}
					}
				}
			});

			$('#budgetProjectSelect').change(function() {
				var selectedPid = $(this).val();
				updateChart(selectedPid);
			});

			// 초기 선택된 프로젝트에 대한 차트 업데이트
			var initialPid = $('#budgetProjectSelect').val();
			if (initialPid) {
				updateChart(initialPid);
			}

			// 자산 추가 폼 제출
			$('#addAssetForm').submit(function(event) {
				event.preventDefault();
				$.ajax({
					url : '/addAsset',
					type : 'POST',
					data : $(this).serialize(),
					success : function(data) {
						location.reload(); // 페이지를 새로고침하여 자산 목록을 업데이트합니다.
					},
					error : function(xhr, status, error) {
						console.error('Error: ' + error);
					}
				});
			});
		});
	</script>
</body>
</html>
