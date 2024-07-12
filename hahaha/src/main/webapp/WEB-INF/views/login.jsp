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
<script type="text/javascript">
   $(document).ready(function(){

   	$("#loginBtn").click(function(){
   		
   		if($("[name=user_employee_id]").val() == '') $("[name=user_employee_id]").val(0)
   		var user_employee_id = $("[name=user_employee_id]").val()
        var password = $("[name=password]").val()
	   	 $.ajax({
	         url: '${path}/loginChk.do', 
	         method: 'post',
	         dataType:'json',
	         data: {
	        	 user_employee_id: user_employee_id,
	        	 password: password
	         },
	         success: function(response) {
	               alert(response.isUser)
	                if (response.isUser === '로그인성공') {
	                   if(response.dname === '운항및운항관리부서')
	                          location.href = '${path}/ReservationList.do';
	                   if(response.dname === '고객관리부서')
	                          location.href = '${path}/customerList.do';
	                   if(response.dname === '재무부서')
	                          location.href = '${path}/financialreport.do';
	                   if(response.dname === '인사부서')
	                          location.href = '${path}/humanRsrc.do';
	                } else {
	                    alert('유효한 아이디와 비밀번호가 아닙니다.')
	                }
	            },
	         error: function() {
	             alert('유효한 아이디와 비밀번호가 아닙니다!');
	         }
	     });
   		})
   });
</script>
</head>

<body>
<div id="loginContainer">
<b>로그인</b>
<hr>
<img src="logo.png" width="35" height="35"/><b>Human Air ERP</b>
<br><br>
<form id="loginForm" method="post">
  <!-- Email input -->
  <div data-mdb-input-init class="form-outline mb-4">
    <input type="number" name="user_employee_id" id="form2Example1" class="form-control inputId" />
    <label class="form-label" for="form2Example1"><b>아이디</b></label>
  </div>

  <!-- Password input -->
  <div data-mdb-input-init class="form-outline mb-4">
    <input name="password" type="password" id="form2Example2" class="form-control inputPwd" />
    <label class="form-label" for="form2Example2"><b>비밀번호</b></label>
  </div>

  
  <!-- Submit button -->
  <button  id="loginBtn" type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-block mb-4">로그인</button>

  <!-- Register buttons -->
  <div class="text-center">
    <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-link btn-floating mx-1">
      <i class="fab fa-facebook-f"></i>
    </button>
    
    <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-link btn-floating mx-1">
      <i class="fab fa-google"></i>
    </button>

    <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-link btn-floating mx-1">
      <i class="fab fa-twitter"></i>
    </button>

    <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-link btn-floating mx-1">
      <i class="fab fa-github"></i>
    </button>
  </div>
</form>
</div>
</body>
</html>