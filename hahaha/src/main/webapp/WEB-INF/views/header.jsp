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
   #logout:hover{cursor:pointer;}
   #logout{
   	background-color: #f44336; /* 빨간색 배경 */
    color: white; /* 흰색 글자 */
    border: none; /* 테두리 없음 */
    padding: 5px 5px; /* 패딩 */
    text-align: center; /* 텍스트 가운데 정렬 */
    text-decoration: none; /* 텍스트 장식 없음 */
    display: inline-block; /* 인라인 블록 */
    font-size: 16px; /* 글자 크기 */
    margin: 4px 2px; /* 마진 */
    cursor: pointer; /* 커서 포인터 */
    border-radius: 12px; /* 둥근 테두리 */
    transition: background-color 0.3s ease; /* 배경색 전환 효과 */
   }
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">

   $(document).ready(function(){
   	$("#logout").click(function(){
   		alert('로그아웃 되었습니다.')
   	
   		location.href='logout.do';
   	})
   });
</script>
</head>
<body>

<%
	String username = (String)session.getAttribute("username");
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <a class="navbar-brand" href="test2.do">
      <img src="logo.png" alt="" width="35" height="35" class="d-inline-block align-text-top">
      Human Air ERP
    </a>
      <div class="navbar-nav">
        <a class="admin nav-link" href="" style="visibility: hidden;">계정관리</a>
        <a class="human-src nav-link" href="humanRsrc.do">인사관리</a>
       <!--  <a class="nav-link" href="">비행일정확인</a> -->
        <a class="nav-link" href="salChk.do">급여확인</a>
        <a class="nav-link" href="myInfo.do">내정보</a>
        <a class="nav-link" href="customerList.do">고객정보 조회</a>
        <a class="nav-link" href="financialreport.do">재무 제표 조회</a>
        <div class="welcome">환영합니다.&nbsp;&nbsp;<b><%=username %></b>님
  		<button id="logout">Log out</button></div>
      </div>
    </div>
  </div>
  
</nav>


</body>
</html>