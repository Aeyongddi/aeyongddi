<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko"> 
<head>
    <title>TRACER - 회원 목록</title>
    
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- CSS and JS includes -->
    <link id="theme-style" rel="stylesheet" href="assets/css/portal.css">
    <script src="${path}/a00_com/jquery.min.js"></script>
    <script src="${path}/a00_com/popper.min.js"></script>
    <script src="${path}/a00_com/bootstrap.min.js"></script>
    <script src="${path}/a00_com/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
        fetchUsers();

        $("form").on("keypress", function(event) {
            if (event.key === "Enter") {
                event.preventDefault(); 
            }
        });

        // 검색 버튼 클릭 이벤트
        $(".userSchBtn").click(function() {
            var form = $("form.schUser").serialize();
            console.log("Sending search request with data: ", form); // 디버깅용 로그 추가
            $.ajax({
                data: form,
                url: 'userList',
                type: 'POST',
                success: function(data) {
                    console.log("Received search response: ", data); // 디버깅용 로그 추가
                    $("tbody.userList").empty();
                    data.content.forEach(function(user) {
                        $("tbody.userList").append(
                            '<tr class="' + user.email + '">' +
                            '<td class="cell">' + user.email + '</td>' +
                            '<td class="cell">' + user.name + '</td>' +
                            '<td class="cell">' + formatDate(user.birth) + '</td>' +
                            '<td class="cell">' +
                            '<select class="auth-select" data-email="' + user.email + '">' +
                            '<option value="admin"' + (user.auth == "admin" ? ' selected' : '') + '>admin</option>' +
                            '<option value="manager"' + (user.auth == "manager" ? ' selected' : '') + '>manager</option>' +
                            '<option value="member"' + (user.auth == "member" ? ' selected' : '') + '>member</option>' +
                            '<option value="noauth"' + (user.auth == "noauth" ? ' selected' : '') + '>noauth</option>' +
                            '</select>' +
                            '</td>' +
                            '<td class="cell"><a class="btn-sm app-btn-secondary userDelBtn" href="#">삭제</a></td>' +
                            '</tr>'
                        );
                    });

                    // 페이지 네비게이션
                    $(".pagination").empty();
                    for (var i = 0; i < data.totalPages; i++) {
                        $(".pagination").append(
                            '<a href="#" class="page-link" data-page="' + i + '">' + (i + 1) + '</a> '
                        );
                    }

                    $(".page-link").click(function(event) {
                        event.preventDefault();
                        var page = $(this).data('page');
                        fetchUsers(page);
                    });

                    $(".userDelBtn").off('click').on('click', userDel);
                    $(".auth-select").off('change').on('change', authChange);
                },
                error: function(err) {
                    console.log("Search request failed: ", err); // 디버깅용 로그 추가
                }
            });
        });

        // 사용자 삭제 함수
        function userDel() {
            var that = this;
            if (confirm('정말 삭제하시겠습니까?')) {
                var email = $(that).parent().parent().attr('class');
                console.log("Deleting user with email: ", email); // 디버깅용 로그 추가
                $.ajax({
                    data: { email: email },
                    url: 'delUser',
                    type: 'POST',
                    success: function(data) {
                        fetchUsers();
                    },
                    error: function(err) {
                        console.log("Delete request failed: ", err); // 디버깅용 로그 추가
                    }
                });
            }
        }
        
        // 권한 수정 함수
        function authChange() {
            var email = $(this).data('email');
            var auth = $(this).val();
            console.log("Updating auth for email: ", email, " to: ", auth); // 디버깅용 로그 추가
            $.ajax({
                data: { email: email, auth: auth },
                url: 'uptUser',
                type: 'POST',
                success: function(data) {
                    fetchUsers();
                },
                error: function(err) {
                    console.log("Update auth request failed: ", err); // 디버깅용 로그 추가
                }
            });
        }
        
        function fetchUsers(page = 0, size = 10) {
            var form = $("form.schUser").serialize();
            console.log("Fetching users with data: ", form); // 디버깅용 로그 추가
            $.ajax({
                data: form + "&page=" + page + "&size=" + size,
                url: 'userList',
                type: 'POST',
                success: function(data) {
                    console.log("Received users data: ", data); // 디버깅용 로그 추가
                    $("tbody.userList").empty();
                    data.content.forEach(function(user) {
                        $("tbody.userList").append(
                            '<tr class="' + user.email + '">' +
                            '<td class="cell">' + user.email + '</td>' +
                            '<td class="cell">' + user.name + '</td>' +
                            '<td class="cell">' + formatDate(user.birth) + '</td>' +
                            '<td class="cell">' +
                            '<select class="auth-select" data-email="' + user.email + '">' +
                            '<option value="admin"' + (user.auth == "admin" ? ' selected' : '') + '>admin</option>' +
                            '<option value="manager"' + (user.auth == "manager" ? ' selected' : '') + '>manager</option>' +
                            '<option value="member"' + (user.auth == "member" ? ' selected' : '') + '>member</option>' +
                            '<option value="noauth"' + (user.auth == "noauth" ? ' selected' : '') + '>noauth</option>' +
                            '</select>' +
                            '</td>' +
                            '<td class="cell"><a class="btn-sm app-btn-secondary userDelBtn" href="#">삭제</a></td>' +
                            '</tr>'
                        );
                    });

                    $(".pagination").empty();
                    for (var i = 0; i < data.totalPages; i++) {
                        $(".pagination").append(
                            '<a href="#" class="page-link" data-page="' + i + '">' + (i + 1) + '</a> '
                        );
                    }

                    $(".page-link").click(function(event) {
                        event.preventDefault();
                        var page = $(this).data('page');
                        fetchUsers(page);
                    });

                    $(".userDelBtn").off('click').on('click', userDel);
                    $(".auth-select").off('change').on('change', authChange);
                },
                error: function(err) {
                    console.log("Fetch users request failed: ", err); // 디버깅용 로그 추가
                }
            });
        }

        // 날짜 형식 변환 함수
        function formatDate(date) {
            var d = new Date(date);
            var month = '' + (d.getMonth() + 1);
            var day = '' + d.getDate();
            var year = d.getFullYear();

            if (month.length < 2) month = '0' + month;
            if (day.length < 2) day = '0' + day;

            return [year, month, day].join('-');
        }
    });
    </script>
</head> 
<body class="app">   	
<jsp:include page="/headerSidebar.jsp"/> 
    <div class="app-wrapper">
        <div class="app-content pt-3 p-md-3 p-lg-4">
            <div class="container-xl">
                <div class="row g-3 mb-4 align-items-center justify-content-between">
                    <div class="col-auto">
                        <h1 class="app-page-title mb-0">회원 목록</h1>
                    </div>
                    <div class="col-auto">
                        <div class="page-utilities">
                            <div class="row g-2 justify-content-start justify-content-md-end align-items-center">
                                <div class="col-auto">
                                    <form class="schUser table-search-form row gx-1 align-items-center">
                                        <div class="col-auto">
                                            <select name="auth" class="auth-select">
									            <option value="">전체</option>
									            <option value="admin">admin</option>
									            <option value="manager">manager</option>
									            <option value="member">member</option>
									            <option value="noauth">noauth</option>
									        </select>
                                        </div>
                                        <div class="col-auto">
                                            <input type="text" id="search-orders" name="name" class="form-control search-orders" placeholder="사용자 이름 입력">
                                        </div>
                                        <div class="col-auto">
                                            <button type="button" class="userSchBtn btn app-btn-secondary">검색</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-content" id="orders-table-tab-content">
                    <div class="tab-pane fade show active" id="orders-all" role="tabpanel" aria-labelledby="orders-all-tab">
                        <div class="app-card app-card-orders-table shadow-sm mb-5">
                            <div class="app-card-body">
                                <table class="table app-table-hover mb-0 text-left">
                                    <thead>
                                        <tr>
                                            <th class="cell">email</th>
                                            <th class="cell">이름</th>
                                            <th class="cell">생일</th>
                                            <th class="cell">권한</th>
                                            <th class="cell">삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody class="userList">
                                        <!-- Content will be injected via AJAX -->
                                    </tbody>
                                </table>
                                <div class="pagination mt-3"></div> <!-- Page navigation -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="app-footer">
            <div class="container text-center py-3">
                <small class="copyright">Designed with <span class="sr-only">love</span><i class="fas fa-heart" style="color: #fb866a;"></i> by <a class="app-link" href="http://themes.3rdwavemedia.com" target="_blank">Xiaoying Riley</a> for developers</small>
            </div>
        </footer>
    </div>

    <!-- Javascript -->
    <script src="assets/plugins/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/app.js"></script> 
</body>
</html>
