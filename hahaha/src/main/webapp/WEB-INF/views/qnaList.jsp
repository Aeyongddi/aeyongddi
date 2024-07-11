<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp" />
<meta charset="UTF-8">
<title>고객 문의 응답 게시판</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
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
    $(document).ready(function() {
        $("#regBtn").click(function() {
            location.href = "boardInsertFrm.do";
        });
    });
</script>
</head>

<body>
    <div class="jumbotron text-center">
        <h2>고객 문의 응답 게시판</h2>
    </div>

    <div class="container">
        <form id="frm01" class="form" method="post" action="boardList.do">
            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                <input placeholder="작성자" name="customer_id" value="${param.customer_id}" class="form-control mr-sm-2" />
                <select name="status" class="form-control mr-sm-2">
                    <option value="" ${param.status == '' ? 'selected' : ''}>전체</option>
                    <option value="미응답" ${param.status == '미응답' ? 'selected' : ''}>미응답</option>
                    <option value="응답완료" ${param.status == '응답완료' ? 'selected' : ''}>응답완료</option>
                </select>
                <button class="btn btn-info" type="submit">Search</button>
                <button class="btn btn-success" type="button" id="regBtn">등록</button>
            </nav>
        </form>
        <table class="table table-hover table-striped">
            <col width="10%">
            <col width="50%">
            <col width="15%">
            <col width="15%">
            <thead>
                <tr class="table-success text-center">
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>응답 상태</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="qna" items="${boardList}">
                    <tr ondblclick="goDetail(${qna.inquiry_id})">
                        <td>${qna.inquiry_id}</td>
                        <td>${qna.title}</td>
                        <td>${qna.customer_id}</td>
                        <td>${qna.status}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <script type="text/javascript">
            function goDetail(no) {
                location.href = "boardInsertFrm.do?inquiry_id=" + no;
            }
        </script>
    </div>
</body>
</html>
