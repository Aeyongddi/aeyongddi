<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title> TRACER - 자원 관리 </title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico">
    <script defer src="assets/plugins/fontawesome/js/all.min.js"></script>
    <link id="theme-style" rel="stylesheet" href="assets/css/portal.css">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
                <!-- 인적 자원 관리 탭 -->
                <div class="tab-pane fade show active" id="hr-management" role="tabpanel" aria-labelledby="hr-management-tab">
                    <div id="app">
                        <hr-management></hr-management>
                    </div>
                </div>

                <!-- 예산 관리 탭 -->
                <div class="tab-pane fade" id="budget-management" role="tabpanel" aria-labelledby="budget-management-tab">
                    <div id="budget-management-section">
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
                                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addBudgetModal">예산 추가</button>
                                    <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#reduceBudgetModal">예산 삭감</button>
                                    <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#assignBudgetModal">새 프로젝트 예산 부여</button>
                                </div>
                            </div>
                            <div class="app-card-body p-3 p-lg-4">
                                <div class="text-center">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-4">
                                            <h4>전체 예산</h4>
                                            <p id="total-budget">0 원</p>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="chart-container" style="position: relative; height:40vh; width:40vw; margin: 0 auto;">
                                                <canvas id="budgetDonutChart"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 자산 관리 탭 -->
                <div class="tab-pane fade" id="asset-management" role="tabpanel" aria-labelledby="asset-management-tab">
                    <div class="app-card app-card-orders-table shadow-sm mb-5">
                        <div class="app-card-body">
                            <div class="left-section mb-3">
                                <label for="assetProjectSelect" class="form-label">프로젝트 선택</label>
                                <select class="form-select" id="assetProjectSelect">
                                    <option value="">전체</option>
                                    <c:forEach var="project" items="${projectList}">
                                        <option value="${project.pid}">${project.title}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addAssetModal">자산 추가</button>
                            <div class="table-responsive">
                                <table class="table app-table-hover mb-0 text-left">
                                    <thead>
                                        <tr>
                                            <th class="cell">자산 이름</th>
                                            <th class="cell">구매일/임대일</th>
                                            <th class="cell">만료일</th>
                                            <th class="cell">가격</th>
                                            <th class="cell">사용중인 프로젝트</th>
                                        </tr>
                                    </thead>
                                    <tbody id="asset-table-body">
                                        <c:forEach var="asset" items="${assetList}">
                                            <tr data-pid="${asset.pid}">
                                                <td class="cell">${asset.software_name}</td>
                                                <td class="cell"><fmt:formatDate value="${asset.license_purchase_date}" pattern="yyyy-MM-dd"/></td>
                                                <td class="cell"><fmt:formatDate value="${asset.license_expiry_date}" pattern="yyyy-MM-dd"/></td>
                                                <td class="cell software-price"><fmt:formatNumber value="${asset.software_price}" type="number" pattern="#,###"/> 원</td>
                                                <td class="cell">${asset.projectTitle}</td>
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
            <small class="copyright">Designed with by <a class="app-link" href="http://themes.3rdwavemedia.com" target="_blank">Xiaoying Riley</a> for developers</small>
        </div>
    </footer>
</div>

<!-- 예산 추가 모달 -->
<div class="modal fade" id="addBudgetModal" tabindex="-1" aria-labelledby="addBudgetModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addBudgetModalLabel">예산 추가</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addBudgetForm" method="post">
                    <div class="mb-3">
                        <label for="addBudgetProjectSelect" class="form-label">프로젝트 선택</label>
                        <select class="form-select" id="addBudgetProjectSelect" name="pid" required>
                            <c:forEach var="project" items="${projectList}">
                                <option value="${project.pid}">${project.title}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="addBudgetAmount" class="form-label">금액</label>
                        <input type="number" class="form-control" id="addBudgetAmount" name="amount" required>
                    </div>
                    <button type="submit" class="btn btn-primary">저장</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 예산 삭감 모달 -->
<div class="modal fade" id="reduceBudgetModal" tabindex="-1" aria-labelledby="reduceBudgetModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reduceBudgetModalLabel">예산 삭감</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="reduceBudgetForm" method="post">
                    <div class="mb-3">
                        <label for="reduceBudgetProjectSelect" class="form-label">프로젝트 선택</label>
                        <select class="form-select" id="reduceBudgetProjectSelect" name="pid" required>
                            <c:forEach var="project" items="${projectList}">
                                <option value="${project.pid}">${project.title}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="reduceBudgetAmount" class="form-label">금액</label>
                        <input type="number" class="form-control" id="reduceBudgetAmount" name="amount" required>
                    </div>
                    <button type="submit" class="btn btn-danger">삭감</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 새 프로젝트 예산 부여 모달 -->
<div class="modal fade" id="assignBudgetModal" tabindex="-1" aria-labelledby="assignBudgetModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="assignBudgetModalLabel">새 프로젝트 예산 부여</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="assignBudgetForm" method="post">
                    <div class="mb-3">
                        <label for="assignBudgetProjectSelect" class="form-label">프로젝트 선택</label>
                        <select class="form-select" id="assignBudgetProjectSelect" name="pid" required>
                            <c:forEach var="project" items="${projectsWithNoAssignedBudget}">
                                <option value="${project.pid}">${project.title}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="assignBudgetAmount" class="form-label">금액</label>
                        <input type="number" class="form-control" id="assignBudgetAmount" name="amount" required>
                    </div>
                    <button type="submit" class="btn btn-success">부여</button>
                </form>
            </div>
        </div>
    </div>
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
                <form id="addAssetForm" method="post" action="/addAsset">
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
                        <label for="licensePurchaseDate" class="form-label">구매일/임대일</label>
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

<script src="assets/plugins/popper.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/plugins/chart.js/chart.min.js"></script>
<script src="assets/js/app.js"></script>

<!-- Vue.js 관련 코드 -->
<script>
Vue.component('hr-management', {
    data: function() {
        return {
            users: ${userInfoListJson},
            showForm: false,
            formData: {
                name: '',
                email: '',
                birth: '',
                phone: '',
                nickname: '',
                password: ''
            },
            editMode: false
        }
    },
    methods: {
        formatDate(date) {
            let d = new Date(date);
            return d.getFullYear() + '-' + ('0' + (d.getMonth() + 1)).slice(-2) + '-' + ('0' + d.getDate()).slice(-2);
        },
        showAddUserForm() {
            this.showForm = true;
            this.editMode = false;
            this.formData = { name: '', email: '', birth: '', phone: '', nickname: '', password: '' };
        },
        editUser(user) {
            this.showForm = true;
            this.editMode = true;
            this.formData = { ...user, password: '' }; // 비밀번호는 빈 문자열로 설정
        },
        saveUser() {
            if (this.editMode) {
                this.updateUser();
            } else {
                this.addUser();
            }
        },
        addUser() {
            axios.post('/addUser', this.formData, {
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(response => {
                this.users.push(response.data);
                this.showForm = false;
            })
            .catch(error => {
                console.error('Error:', error);
                alert('사용자 추가 실패: ' + error.response.data);
            });
        },
        updateUser() {
            axios.post('/updateUser', this.formData, {
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(response => {
                let index = this.users.findIndex(user => user.email === this.formData.email);
                if (index !== -1) {
                    this.$set(this.users, index, response.data);
                }
                this.showForm = false;
            })
            .catch(error => {
                console.error('Error:', error);
                alert('사용자 수정 실패: ' + error.response.data);
            });
        },
        deleteUser(email) {
            if (confirm('정말 삭제하시겠습니까?')) {
                axios.post('/deleteUser', { email: email }, {
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                .then(response => {
                    let index = this.users.findIndex(user => user.email === email);
                    if (index !== -1) {
                        this.users.splice(index, 1);
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('사용자 삭제 실패: ' + error.response.data);
                });
            }
        }
    },
    template: `
    <div>
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
                                <th class="cell">액션</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="user in users" :key="user.email">
                                <td class="cell">{{ user.name }}</td>
                                <td class="cell">{{ user.email }}</td>
                                <td class="cell">{{ formatDate(user.birth) }}</td>
                                <td class="cell">{{ user.phone }}</td>
                                <td class="cell">
                                    <div v-for="team in user.teams" :key="team.tid">{{ team.tid }}</div>
                                </td>
                                <td class="cell">
                                    <div v-for="project in user.projects" :key="project.title">{{ project.title }}</div>
                                </td>
                                <td class="cell">
                                    <button @click="editUser(user)">수정</button>
                                    <button @click="deleteUser(user.email)">삭제</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <button @click="showAddUserForm">사용자 추가</button>
            </div>
        </div>

        <!-- 사용자 추가/수정 모달 -->
        <div v-if="showForm">
            <form @submit.prevent="saveUser">
                <div>
                    <label>이름:</label>
                    <input v-model="formData.name" required>
                </div>
                <div>
                    <label>이메일:</label>
                    <input v-model="formData.email" required>
                </div>
                <div>
                    <label>생일:</label>
                    <input type="date" v-model="formData.birth" required>
                </div>
                <div>
                    <label>전화번호:</label>
                    <input v-model="formData.phone" required>
                </div>
                <div>
                    <label>닉네임:</label>
                    <input v-model="formData.nickname" required>
                </div>
                <div>
                    <label>비밀번호:</label>
                    <input type="password" v-model="formData.password" required>
                </div>
                <button type="submit">저장</button>
                <button @click="showForm = false">취소</button>
            </form>
        </div>
    </div>
    `
});

new Vue({
    el: '#app'
});
</script>

<!-- 기존 JavaScript 코드 (Vue.js와 별도로 동작) -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    // 모든 모달 초기화 코드 제거 (불필요할 수 있음)
    // var modals = document.querySelectorAll('.modal');
    // modals.forEach(function(modalElement) {
    //     var modalInstance = bootstrap.Modal.getOrCreateInstance(modalElement);
    // });

    // 예산 관리 차트 초기화 함수
    function updateChart(pid) {
        $.ajax({
            url: '/getBudget',
            type: 'GET',
            data: { pid: pid },
            success: function(data) {
                // 전체 예산 표시 업데이트
                var totalBudget = data.assigned_budget || 0;
                $('#total-budget').text(totalBudget.toLocaleString() + ' 원');
                
                // 차트 데이터 업데이트
                budgetDonutChart.data.datasets[0].data = [totalBudget - data.used_budget, data.used_budget];
                budgetDonutChart.update();
            },
            error: function(xhr, status, error) {
                console.error('Error: ' + error);
            },
            dataType: 'json'
        });
    }

    // 차트 초기화 코드
    var ctx = document.getElementById('budgetDonutChart').getContext('2d');
    var budgetDonutChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ['남은 예산', '사용 예산'],
            datasets: [{
                data: [0, 0], // 초기값으로 비워둠
                backgroundColor: ['#36a2eb', '#ff6384'] // 남은 예산: 파란색, 사용 예산: 빨간색
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

    // 예산 추가 폼 제출 처리
    $('#addBudgetForm').on('submit', function(event) {
        event.preventDefault();
        const formData = $(this).serialize();
        $.post('/addBudget', formData, function(response) {
            alert(response);
            window.location.reload(); // 페이지 새로고침
        }).fail(function(xhr) {
            alert('예산 추가 실패: ' + xhr.responseText);
        });
    });

    // 예산 삭감 폼 제출 처리
    $('#reduceBudgetForm').on('submit', function(event) {
        event.preventDefault();
        const formData = $(this).serialize();
        $.post('/reduceBudget', formData, function(response) {
            alert(response);
            window.location.reload(); // 페이지 새로고침
        }).fail(function(xhr) {
            alert('예산 삭감 실패: ' + xhr.responseText);
        });
    });

    // 새 프로젝트 예산 부여 폼 제출 처리
    $('#assignBudgetForm').on('submit', function(event) {
        event.preventDefault();
        const formData = $(this).serialize();
        $.post('/assignBudget', formData, function(response) {
            alert(response);
            window.location.reload(); // 페이지 새로고침
        }).fail(function(xhr) {
            alert('새 프로젝트 예산 부여 실패: ' + xhr.responseText);
        });
    });
    
 	// 자산 관리 필터링 기능
    const assetProjectSelect = document.getElementById('assetProjectSelect');
    const assetTableBody = document.getElementById('asset-table-body');

    assetProjectSelect.addEventListener('change', function() {
        const selectedPid = this.value;
        const rows = assetTableBody.getElementsByTagName('tr');

        for (let row of rows) {
            if (selectedPid === "" || row.getAttribute('data-pid') === selectedPid) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        }
    });

    // 자산 추가 폼 제출 처리
    $('#addAssetForm').on('submit', function(event) {
        event.preventDefault();
        const formData = new FormData(this);
        fetch('/addAsset', {
            method: 'POST',
            body: formData
        })
        .then(response => response.text())
        .then(data => {
            alert(data);
            window.location.reload(); // 페이지 새로고침
        })
        .catch(error => {
            console.error('Error:', error);
            alert('자산 추가 실패: ' + error.message);
        });
    });

});
</script>

</body>
</html>
