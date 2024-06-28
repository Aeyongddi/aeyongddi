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
    <form id="frm01" class="form" method="post">
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" 
                id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" 
                aria-expanded="false">년도 선택 </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="#">2023년</a>
                    <a class="dropdown-item" href="#">2024년</a>
                </div>
            </div>
            <p class="text-white" style="margin-left: 80%; margin-top: 20px;">단위: 억 원</p>
        </nav>
    </form>
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
        <%-- <tbody>
            <c:forEach var="cus" items="${cusList}">
                <tr>
                    <td>${cus.name }</td>                 
                    <td>${cus.ssn }</td>
                    <td>${cus.email }</td>
                    <td>${cus.passport_number }</td>
                    <td>${cus.phone }</td>
                    <td>${cus.address }</td>
                </tr>
            </c:forEach>
        </tbody> --%>
        <tbody>
        	<tr>
        		<td>2023년 1분기</td>
        		<td>2023년 1월~3월</td>
        		<td>50,000</td>
        		<td>1,000</td>
        		<td>49,000</td>
        		<td>99,000</td>
        	</tr>
        </tbody>
    </table>    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="frm02" class="form" method="post">
          <div class="row">
            <div class="col">
              <input type="text" class="form-control" placeholder="사원명 입력" name="ename">
            </div>
            <div class="col">
              <input type="text" class="form-control" placeholder="직책명 입력" name="job">
            </div>
          </div>
        </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>
