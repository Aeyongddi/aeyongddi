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
	#loginContainer{
		position:absolute;left:35%;width:30%;top:25%;
	}
   td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<%
	String userPwd = (String)session.getAttribute("userPwd");
%>
<script type="text/javascript">
   $(document).ready(function(){
   		var userPwd = <%=userPwd%>
   		$("#chgPwd").click(function(){
   			if(userPwd!=$("[name=currPwd]").val()){
   				alert("현재 비밀번호가 올바르지 않습니다.")
   			}else if($("[name=chgPwd]").val()!=$("[name=chkChgPwd]").val()){
   				alert("변경 비밀번호가 동일하지 않습니다")
   			}else{
   				alert("비밀번호가 변경되었습니다.")
   				$("#chgPwdForm").submit();
   			}
   		})
   });
</script>
</head>

<body>
<jsp:include page="header.jsp"/>
<div id="loginContainer">
<b>비밀번호 변경하기</b>
<hr>
<img src="logo.png" width="35" height="35"/><b>Human Air ERP</b>
<br><br>

<form id="chgPwdForm" action="chgPwdSuccess.do">
  <!-- Password input -->
  <div data-mdb-input-init class="form-outline mb-4">
    <input name="currPwd" type="password" id="form2Example2" class="form-control" required/>
    <label class="form-label" for="form2Example2"><b>현재 비밀번호</b></label>
  </div>
  <div data-mdb-input-init class="form-outline mb-4">
    <input name="chgPwd" type="password" id="form2Example2" class="form-control" required/>
    <label class="form-label" for="form2Example2"><b>변경할 비밀번호</b></label>
  </div>
  <div data-mdb-input-init class="form-outline mb-4">
    <input name="chkChgPwd" type="password" id="form2Example2" class="form-control" required/>
    <label class="form-label" for="form2Example2"><b>변경 비밀번호 확인</b></label>
  </div>

  
  <!-- Submit button -->
  <button id="chgPwd" type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-block mb-4">비밀번호 변경하기</button>

  
</form>
</div>
</body>
</html>