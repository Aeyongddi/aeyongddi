<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세</title>
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="/headerSidebar.jsp" />

    <div class="container">
        <h1>공지사항 상세</h1>
        
        <c:if test="${not empty notice}">
            <h2>${notice.title}</h2>
            <p><strong>작성자:</strong> ${notice.nickname}</p>
            <p><strong>이메일:</strong> ${notice.email}</p>
            <p><strong>등록 날짜:</strong> <fmt:formatDate value="${notice.date_of_registration}" pattern="yyyy-MM-dd HH:mm" /></p>
            <p><strong>내용:</strong></p>
            <p>${notice.content}</p>
            <p><a href="index.jsp">목록으로 돌아가기</a></p>
        </c:if>
        
        <c:if test="${empty notice}">
            <p>공지사항을 찾을 수 없습니다.</p>
        </c:if>
    </div>
</body>
</html>