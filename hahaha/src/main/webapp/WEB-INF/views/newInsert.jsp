<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backweb.vo.*" 
    import="backweb.a04_database.*" 
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
	var proc="${proc}"
	if(msg!=""){
		alert(msg)
		if(proc=="삭제") {
			location.href="deptList101.do";
		}
	}
</script>
</head>

<body>
<jsp:include page="header.jsp"/>
<br><hr>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;신규사원등록</b>
<hr>
<br><br><br>
<%-- 
		
--%>
<div class="container" >
	<form id="insForm" method="post" action="newInsert.do"> 
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">사원ID</span>
		</div>
		<input type="number" name="user_employee_id" class="form-control" value=""/>	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">이름</span>
		</div>
		<input type="text" name="name" class="form-control" value=""/>	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">이메일</span>
		</div>
		<input type="text" name="email" class="form-control" value=""/>	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">전화번호</span>
		</div>
		<input type="number" name="phone" class="form-control" value=""/>	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">주소</span>
		</div>
		<input type="text" name="address" class="form-control" value=""/>	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">사용자명</span>
		</div>
		<input type="text" name="username" class="form-control" value="" />	
	</div>
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">역할</span>
		</div>
		<input type="text" name="role" class="form-control" value="" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">직책</span>
		</div>
		<input name="position" class="form-control" value=""/>	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">부서</span>
		</div>
		<input name="department" class="form-control" value=""/>	
	</div>	
	
	<div style="text-align:right;">
			<input type="button" class="btn btn-success" value="등록하기" id="insBtn"/>
			<input type="button" class="btn btn-primary" value="메인화면으로" id="mainBtn"/>
	</div>	
	</form>	
	<script type="text/javascript">
		$("#insBtn").click(function(){
			var isValid = true;
			if(confirm("등록하시겠습니까?")){
				if($("#insForm div input").each(function(){
					if($(this).val() ===''){
						isValid = false;
						return false;
					}
				}))
				if(!isValid){
					alert('모든 입력 창에 값을 입력해주세요.');
				}else{
					alert('등록이 완료되었습니다.')
					$("#insForm").submit()
				}
			}
		})
		$("#mainBtn").click(function(){
			location.href="humanRsrc.do"
		})
	</script>
</div>	
</body>
</html>