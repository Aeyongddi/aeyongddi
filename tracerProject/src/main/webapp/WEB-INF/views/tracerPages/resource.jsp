<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title> TRACER - 자원 관리 </title>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" contents="width=device-width, initial-scale=1.0">
    <meta name="description" content="Portal - Bootstrap 5 Admin Dashboard Template For Developers">
    <meta name="author" content="Xiaoying Riley at 3rd Wave Media">
    <link rel="shortcut icon" href="favicon.ico">
    <!-- FontAwesome JS-->
    <script defer src="assets/plugins/fontawesome/js/all.min.js"></script>
    <!-- App CSS -->
    <link id="theme-style" rel="stylesheet" href="assets/css/portal.css">
    <!-- Chart.js -->
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
</head>
<body>
<jsp:include page="/headerSidebar.jsp"/>
<div class="app-wrapper">
    <div class="app-content pt-3 p-md-3 p-lg-4">
        <div class="container-xl">
            <br><br>
            <h1 class="app-page-title">자원 관리</h1>
            <nav id="orders-table-tab" class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
                <a class="flex-sm-fill text-sm-center nav-link active" id="hr-management-tab" data-bs-toggle="tab" href="#hr-management" role="tab" aria-controls="hr-management" aria-selected="true">인적 자원 관리</a>
                <a class="flex-sm-fill text-sm-center nav-link" id="budget-management-tab" data-bs-toggle="tab" href="#budget-management" role="tab" aria-controls="budget-management" aria-selected="false">예산 관리</a>
                <a class="flex-sm-fill text-sm-center nav-link" id="asset-management-tab" data-bs-toggle="tab" href="#asset-management" role="tab" aria-controls="asset-management" aria-selected="false">자산 관리</a>
            </nav>
            <div class="tab-content" id="orders-table-tab-content">
                <div class="tab-pane fade show active" id="hr-management" role="tabpanel" aria-labelledby="hr-management-tab">
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
                                                <td class="cell"><fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd"/></td>
                                                <td class="cell">${user.phone}</td>
                                                <td class="cell">
                                                    <c:forEach var="team" items="${user.teams}">
                                                        ${team.tid}<br>
                                                    </c:forEach>
                                                </td>
                                                <td class="cell">
                                                    <c:forEach var="project" items="${user.projects}">
                                                        ${project.title}<br>
                                                    </c:forEach>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div><!--//table-responsive-->
                        </div><!--//app-card-body-->
                    </div><!--//app-card-->
                </div><!--//tab-pane-->

                <!-- 예산 관리 탭 -->
                <div class="tab-pane fade" id="budget-management" role="tabpanel" aria-labelledby="budget-management-tab">
                    <div class="app-card app-card-chart h-100 shadow-sm">
                        <div class="app-card-header p-3 border-0">
                            <div class="left-section">
                                <h4 class="app-card-title">예산 현황</h4>
                                <select class="form-select form-select-sm ms-3 d-inline-flex w-auto" id="projectSelect">
                                    <c:forEach var="project" items="${projectList}">
                                        <option value="${project.pid}">${project.title}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="card-header-action">
                                <a href="#">자세히 보기</a>
                            </div><!--//card-header-actions-->
                        </div><!--//app-card-header-->
                        <div class="app-card-body p-3 p-lg-4">
                            <div class="chart-container" style="position: relative; height:40vh; width:80vw">
                                <canvas id="budgetDonutChart"></canvas>
                            </div>
                        </div><!--//app-card-body-->
                    </div><!--//app-card-->
                </div><!--//tab-pane-->

                <!-- 자산 관리 탭 -->
                <div class="tab-pane fade" id="asset-management" role="tabpanel" aria-labelledby="asset-management-tab">
                    <div class="app-card app-card-orders-table shadow-sm mb-5">
                        <div class="app-card-body">
                            <div class="table-responsive">
                                <table class="table app-table-hover mb-0 text-left">
                                    <thead>
                                        <tr>
                                            <th class="cell">소프트웨어 이름</th>
                                            <th class="cell">라이센스 구매일</th>
                                            <th class="cell">라이센스 만료일</th>
                                            <th class="cell">소프트웨어 가격</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="asset" items="${assetList}">
                                            <tr>
                                                <td class="cell">${asset.softwareName}</td>
                                                <td class="cell"><fmt:formatDate value="${asset.licensePurchaseDate}" pattern="yyyy-MM-dd"/></td>
                                                <td class="cell"><fmt:formatDate value="${asset.licenseExpiryDate}" pattern="yyyy-MM-dd"/></td>
                                                <td class="cell">${asset.softwarePrice}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div><!--//table-responsive-->
                        </div><!--//app-card-body-->
                    </div><!--//app-card-->
                </div><!--//tab-pane-->
            </div><!--//tab-content-->
        </div><!--//container-xl-->
    </div><!--//app-content-->
    <footer class="app-footer">
        <div class="container text-center py-3">
            <small class="copyright">Designed with by <a class="app-link" href="http://themes.3rdwavemedia.com" target="_blank">Xiaoying Riley</a> for developers</small>
        </div>
    </footer><!--//app-footer-->
</div><!--//app-wrapper-->

<!-- Javascript -->
<script src="assets/plugins/popper.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- Charts JS -->
<script src="assets/plugins/chart.js/chart.min.js"></script>
<!-- Page Specific JS -->
<script src="assets/js/app.js"></script>
<script>
    $(document).ready(function() {
        function updateChart(pid) {
            $.ajax({
                url: '/getBudget',
                type: 'GET',
                data: { pid: pid },
                success: function(data) {
                    console.log(data);
                    budgetDonutChart.data.datasets[0].data = [data.assigned_budget, data.used_budget];
                    budgetDonutChart.update();
                },
                error: function(xhr, status, error) {
                    console.error('Error: ' + error);
                },
                dataType: 'json'
            });
        }

        var ctx = document.getElementById('budgetDonutChart').getContext('2d');
        var budgetDonutChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ['할당 예산', '사용 예산'],
                datasets: [{
                    data: [0, 0], // 초기값으로 비워둠
                    backgroundColor: ['#36a2eb', '#ff6384']
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                legend: {
                    position: 'top'
                },
                animation: {
                    animateScale: true,
                    animateRotate: true
                },
                tooltips: {
                    callbacks: {
                        label: function(tooltipItem, data) {
                            var label = data.labels[tooltipItem.index];
                            var value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
                            return label + ': ' + value.toLocaleString() + ' 원';
                        }
                    }
                }
            }
        });

        $('#projectSelect').change(function() {
            var selectedPid = $(this).val();
            updateChart(selectedPid);
        });

        // 초기 선택된 프로젝트에 대한 차트 업데이트
        var initialPid = $('#projectSelect').val();
        if (initialPid) {
            updateChart(initialPid);
        }
    });
</script>
</body>
</html>
