<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp" />
    <meta charset="UTF-8">
    <title>Reservation List</title>
    <link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
    <link rel="stylesheet" href="${path}/a00_com/project/coco.css">
    <style>
        td { text-align:center; }
    </style>
    <script src="${path}/a00_com/jquery.min.js"></script>
    <script src="${path}/a00_com/popper.min.js"></script>
    <script src="${path}/a00_com/bootstrap.min.js"></script>
    <script src="${path}/a00_com/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script>
        $(document).ready(function() {
            $('.details-button').click(function() {
                var modalId = $(this).data('target');
                $(modalId).modal('show');                
            })            

        
    </script>
</head>

<body>
    <div class="jumbotron text-center">
        <h2>Human Air ERP</h2>
    </div>

    <div class="container">
        <form id="frm01" class="form" method="get" action="${path}/searchByScheduleParams2.do">
            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                <input placeholder="편명" name="flight_number" value="" class="form-control mr-sm-2" />
                <input type="date" placeholder="출발날짜" name="departure_timeStr" value="" class="form-control mr-sm-2"/>
                <input type="date" placeholder="도착날짜" name="arrival_timeStr" value="" class="form-control mr-sm-2"/>
                <button class="btn btn-info" type="submit">검색</button>
            </nav>
        </form>
        <table class="table table-hover table-striped table-bordered border-primary">
            <col width="20%"><!-- 이름 -->
            <col width="20%"><!-- 예약번호 -->
            <col width="20%"> <!-- 예약상태 -->
            <col width="20%"> <!-- 출발지 -->
            <col width="20%"> <!-- 출발지 -->
            
            <thead>
                <tr class="table-success text-center">    
                    <th>편명</th>
                    <th>출발지</th>
                    <th>출발날짜/시간</th>
                    <th>도착지</th>
                    <th>도착날짜/시간</th>
                </tr>
            </thead>    
            <tbody>
              <c:forEach var="sh" items="${scheduleList}">
               <tr>
                  <td>${sh.flight_number}</td>
                  <td>${sh.departure}</td>
                  <td><fmt:formatDate value="${sh.departure_time}" pattern="yyyy-MM-dd HH:mm"/></td>
                  <td>${sh.arrival}</td>
                  <td><fmt:formatDate value="${sh.arrival_time}" pattern="yyyy-MM-dd HH:mm"/></td>
               </tr>
            </c:forEach>
         </tbody>
        </table>
    </div> 
</body>
</html>
