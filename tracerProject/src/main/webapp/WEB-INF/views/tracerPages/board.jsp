<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>ToDo 리스트</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path}/assets/css/portal.css">
    <script src="${path}/assets/plugins/jquery.min.js"></script>
    <script src="${path}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="my-4">ToDo 리스트</h1>

        <div class="issue-container">
<c:forEach var="boa" items="${boardList}">
    <div class="issue-item d-flex align-items-center mb-3">
        <!-- 체크박스 상태 표시 -->
        <input type="checkbox" id="issue-${boa.bid}" class="me-2"
               <c:if test="${boa.is_end}">checked</c:if>>
        <label for="issue-${boa.bid}" class="flex-grow-1">${boa.bid}</label>
        <!-- 상태 표시 -->
        <span class="issue-status">
            ${boa.is_end ? '완료' : '미완료'}
        </span>
    </div>
</c:forEach>
            <div class="issue-item d-flex align-items-center mt-3">
                <button class="btn btn-primary" id="createIssueBtn">+ 이슈 만들기</button>
            </div>
            <div id="createIssueForm" class="d-none mt-3">
                <form id="createIssue" action="${path}/boardListInsert.do" method="post">
                    <div class="mb-3">
                        <input type="text" class="form-control" id="newIssueTitle" name="title" placeholder="제목">
                    </div>
                    <button type="submit" class="btn btn-primary">저장</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            $('#createIssueBtn').click(function() {
                $('#createIssueForm').toggleClass('d-none');
            });
        });
    </script>
</body>
</html>
