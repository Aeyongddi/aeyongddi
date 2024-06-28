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
   td{text-align:center;}
   .welcome{position:absolute; right:20px;}
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
</script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <a class="navbar-brand" href="test2.do">
      <img src="logo.png" alt="" width="35" height="35" class="d-inline-block align-text-top">
      Human Air ERP
    </a>
      <div class="navbar-nav">
        <a class="admin nav-link" href="" style="visibility: hidden;">계정관리</a>
        <a class="human-src nav-link" href="">부서배치</a>
        <a class="nav-link" href="">비행일정확인</a>
        <a class="nav-link" href="">급여확인</a>
        <a class="nav-link" href="">내정보</a>
        <p class="welcome">환영합니다.&nbsp;&nbsp;<b>홍길동</b>님</p>
      </div>
    </div>
  </div>
  
</nav>


</body>
</html>