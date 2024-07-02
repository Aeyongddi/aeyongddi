<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAE - 재무제표 조회</title>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<jsp:include page="header.jsp"/>
<style>
    td{text-align:center;}
</style>
</head>
<body>
<div class="jumbotron text-center">
  <h2>재무제표 조회</h2>
</div>
<div class="container">
 <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" 
            id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" 
            aria-expanded="false">년도 선택 </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" id="yearDropdown">
                <a class="dropdown-item" href="#" data-year="2023">2023년</a>
                <a class="dropdown-item" href="#" data-year="2024">2024년</a>
            </div>
        </div>
        <p class="text-white" style="margin-left: 75%; margin-top: 20px;">단위: 억 원</p>
    </nav>
    <table class="table table-hover table-striped">
        <col width="16%">
        <col width="16%">
        <col width="16%">
        <col width="17%">
        <col width="16%">
        <thead>
            <tr class="table-success text-center">
                <th>분기</th>
                <th>기간</th>
                <th>총 수익</th>
                <th>총 지출</th>
                <th>순수익</th>
                <th>보유 자산</th>
            </tr>
        </thead>    
		<tbody>
            <c:forEach var="fin" items="${finList}" >
                <tr>
                    <td>${fin.report_id }</td>                 
                    <td>${fin.report_period }</td>
                    <td> <fmt:formatNumber value="${fin.total_revenue }" pattern="#,###"/></td>
                    <td> <fmt:formatNumber value="${fin.total_expense }" pattern="#,###"/></td>
                    <td> <fmt:formatNumber value="${fin.net_profit }" pattern="#,###"/></td>
                    <td> <fmt:formatNumber value="${fin.balance }" pattern="#,###"/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>    
</div>
</body>
</html>
