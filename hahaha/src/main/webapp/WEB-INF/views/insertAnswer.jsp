<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
    td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>고객 문의 응답 게시판</h2>
</div>

<div class="container">
    <form id="frm01" class="form" method="post" action="boardInsert.do">
        <input type="hidden" name="inquiry_id" value="${board.inquiry_id != null ? board.inquiry_id : 0}"/>
        <div class="form-group">
            <label for="customer_id">작성자</label>
            <input type="text" class="form-control" id="customer_id" name="customer_id" readonly value="${board.customer_id}">
        </div>
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" value="${board.title}">
        </div>
        <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control" id="content" name="content" readonly>${board.content}</textarea>
        </div>
        <div class="form-group">
            <label for="response">답변 내용</label>
            <textarea class="form-control" id="response" name="response">${board.response}</textarea>
        </div>
        <div class="form-group">
            <label for="status">응답 상태</label>
            <select class="form-control" id="status" name="status">
                <option value="미응답" ${board.status == '미응답' ? 'selected' : ''}>미응답</option>
                <option value="응답완료" ${board.status == '응답완료' ? 'selected' : ''}>응답완료</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">저장</button>
    </form>
</div>
</body>
</html>
