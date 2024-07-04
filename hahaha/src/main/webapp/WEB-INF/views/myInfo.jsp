<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	.input-group-text{width:100%;background-color:linen;
		color:black;font-weight:bolder;}
	.input-group-prepend{width:20%;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
	
	});
	var msg="${msg}"
	if(msg!=""){
		alert(msg)
	}
</script>
</head>

<body>
<jsp:include page="header.jsp"/>
<br><hr>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내 정보</b>
<hr>
<br><br><br>
<%-- 
		
--%>
<div class="container" >
	<form method="post" action="myInfoUpt.do"> 
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">이름</span>
		</div>
		<input type="text" name="name" class="form-control" value="${emp.name }" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">주소</span>
		</div>
		<input type="text" name="address" class="form-control" value="${emp.address }" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">전화번호</span>
		</div>
		<input type="text" name="phone" class="form-control" value="${emp.phone }" />	
	</div>
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">이메일</span>
		</div>
		<input type="email" name="email" class="form-control" value="${emp.email }" />	
	</div>
	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">부서</span>
		</div>
		<input type="text" class="form-control" value="${emp.department }" readonly/>	
		
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">아이디</span>
		</div>
		<input type="text" name="user_employee_id" class="form-control" value="${emp.user_employee_id }" readonly/>	
	</div>
	<div class="input-group mb-3">	
		
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">직책</span>
		</div>
		<input type="text" class="form-control" value="${emp.position }" readonly/>	
	</div>	
	
	<div style="text-align:right;">
			<input type="button" class="btn btn-info" value="비밀번호 변경" id="chgBtn"/>
			<input type="button" class="btn btn-info" value="수정" id="uptBtn"/>
			<input type="button" class="btn btn-danger" value="삭제" id="delBtn"/>
			<input type="button" class="btn btn-secondary" value="초기화" id="initBtn"/>
			<input type="button" class="btn btn-primary" value="메인화면" id="mainBtn"/>
	</div>	
	</form>	
	<script type="text/javascript">
		$("#chgBtn").click(function(){
			location.href="chgPwd.do"
		})
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				$("form").submit()
			}
		})
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="myInfoDel.do?user_employee_id="+${emp.user_employee_id}
			}
		})
		$("#mainBtn").click(function(){
			location.href="humanRsrc.do"
		})
	
	</script>
</div>	
</body>
</html>