<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko"> 
<head>
    <title>할 일 목록</title>
    <!-- 메타 태그 -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="할 일 목록">
    <meta name="author" content="Xiaoying Riley at 3rd Wave Media">
    <link rel="shortcut icon" href="favicon.ico">
    <!-- FontAwesome JS-->
    <script defer src="${path}/assets/plugins/fontawesome/js/all.min.js"></script>
    <!-- App CSS -->
    <link id="theme-style" rel="stylesheet" href="${path}/assets/css/portal.css">
</head> 
<jsp:include page="/headerSidebar.jsp"/>
<body class="app">
    <!-- 등록 모달 -->
    <div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="registerModalLabel">할 일 등록</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="registerForm" action="${path}/boardListInsert.do" method="post">
                        <div class="mb-3">
                            <label for="registerTitle" class="form-label">제목</label>
                            <input type="text" class="form-control" id="registerTitle" name="title">
                        </div>
                        <div class="mb-3">
                            <label for="registerContent" class="form-label">내용</label>
                            <textarea class="form-control" id="registerContent" name="content"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="registerDueDate" class="form-label">마감일</label>
                            <input type="date" class="form-control" id="registerDueDate" name="upt_date">
                        </div>
                        <div class="mb-3">
                            <label for="registerStatus" class="form-label">상태</label>
                            <select class="form-select" id="registerStatus" name="btype">
                                <option value="해야 할 일">해야 할 일</option>
                                <option value="진행 중">진행 중</option>
                                <option value="완료">완료</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" id="saveRegister">저장</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 수정 모달 -->
    <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateModalLabel">할 일 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="updateForm" action="${path}/boardUpdate" method="post">
                        <div class="mb-3">
                            <label for="updateTitle" class="form-label">제목</label>
                            <input type="text" class="form-control" id="updateTitle" name="title">
                        </div>
                        <div class="mb-3">
                            <label for="updateContent" class="form-label">내용</label>
                            <textarea class="form-control" id="updateContent" name="content"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="updateDueDate" class="form-label">마감일</label>
                            <input type="date" class="form-control" id="updateDueDate" name="upt_date">
                        </div>
                        <div class="mb-3">
                            <label for="updateStatus" class="form-label">상태</label>
                            <select class="form-select" id="updateStatus" name="btype">
                                <option value="해야 할 일">해야 할 일</option>
                                <option value="진행 중">진행 중</option>
                                <option value="완료">완료</option>
                            </select>
                        </div>
                        <input type="hidden" id="updateTaskId" name="bid">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" id="saveUpdate">저장</button>
                </div>
            </div>
        </div>
    </div>

    <header class="app-header fixed-top"> 
        <!-- 기존의 header 코드 -->
    </header>

    <div class="app-wrapper">
        <div class="app-content pt-3 p-md-3 p-lg-4">
            <div class="container-xl">
                <div class="row g-3 mb-4 align-items-center justify-content-between">
                    <div class="col-auto">
                        <h1 class="app-page-title mb-0">할 일 목록</h1>
                    </div>
                    <div class="col-auto">
                        <div class="page-utilities">
                            <div class="row g-2 justify-content-start justify-content-md-end align-items-center">
                                <div class="col-auto">
                                    <form class="table-search-form row gx-1 align-items-center">
                                        <div class="col-auto">
                                            <input type="text" id="search-tasks" name="searchtasks" class="form-control search-tasks" placeholder="검색">
                                        </div>
                                        <div class="col-auto">
                                            <button type="submit" class="btn app-btn-secondary">검색</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-auto">
                                    <select class="form-select w-auto">
                                        <option selected value="option-1" disabled>전체</option>
                                        <option value="option-2">해야 할 일</option>
                                        <option value="option-3">진행 중</option>
                                        <option value="option-4">완료</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <nav id="tasks-table-tab" class="tasks-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
                    <a class="flex-sm-fill text-sm-center nav-link active" id="tasks-all-tab" data-bs-toggle="tab" role="tab" aria-controls="tasks-all" aria-selected="true">할 일 목록</a>
                </nav>

                <div class="tab-content" id="tasks-table-tab-content">
                    <div class="tab-pane fade show active" id="tasks-all" role="tabpanel" aria-labelledby="tasks-all-tab">
                        <div class="app-card app-card-tasks-table shadow-sm mb-5">
                            <div class="app-card-body">
                                <div class="table-responsive">
                                    <table class="table app-table-hover mb-0 text-left">
                                        <thead>
                                            <tr>
                                                <th class="cell">ID</th>
                                                <th class="cell">제목</th>
                                                <th class="cell">내용</th>
                                                <th class="cell">마감일</th>
                                                <th class="cell">상태</th>
                                                <th class="cell"><button class="btn-sm app-btn-secondary" data-bs-toggle="modal" data-bs-target="#registerModal">등록</button></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="task" items="${boardList}">
                                                <tr>
                                                    <td class="cell">${task.bid}</td>
                                                    <td class="cell">${task.title}</td>
                                                    <td class="cell">${task.content}</td>
                                                    <td class="cell">
                                                        <fmt:formatDate value="${task.upt_date}" pattern="yyyy-MM-dd"/>
                                                    </td>
                                                    <td class="cell">${task.btype}</td>
                                                    <td class="cell"><button class="btn-sm app-btn-secondary" data-bs-toggle="modal" data-bs-target="#updateModal" onclick="populateUpdateModal(${task.bid}, '${task.title}', '${task.content}', '${task.upt_date}', '${task.btype}')">수정</button></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div><!--//table-responsive-->
                            </div><!--//app-card-body-->
                        </div><!--//app-card-->
                    </div>
                </div>
            </div><!--//container-xl-->
        </div><!--//app-content-->
        <footer class="app-footer">
            <div class="container text-center py-3">
                <small class="copyright">Designed with by <a class="app-link" href="http://themes.3rdwavemedia.com" target="_blank">Xiaoying Riley</a> for developers</small>
            </div>
        </footer><!--//app-footer-->
    </div><!--//app-wrapper-->
    <!-- Javascript -->
    <script src="${path}/assets/plugins/popper.min.js"></script>
    <script src="${path}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Page Specific JS -->
    <script src="${path}/assets/js/app.js"></script>
    <script>
        function populateUpdateModal(bid, title, content, upt_date, btype) {
            $('#updateForm #updateTaskId').val(bid);
            $('#updateForm #updateTitle').val(title);
            $('#updateForm #updateContent').val(content);
            $('#updateForm #updateDueDate').val(upt_date);
            $('#updateForm #updateStatus').val(btype);
        }

        $(document).ready(function() {
            $('#saveRegister').click(function() {
                // 등록 폼 데이터 전송
                $('#registerForm').submit();
            });

            $('#saveUpdate').click(function() {
                // 수정 폼 데이터 전송
                $('#updateForm').submit();
            });
        });
    </script>
</body>
</html>
