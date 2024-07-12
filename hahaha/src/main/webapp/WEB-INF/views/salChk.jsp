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
   #salTable{
      position: relative;
      left: 50px;
   }
   #salTable td:nth-child(2){
      text-align:left;
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
   
   });
</script>
</head>
<%
   String username = (String)session.getAttribute("username");
   Integer amountOb = (Integer)session.getAttribute("amount");
   if (amountOb == null) amountOb = 0;
   int amount = (int)amountOb;
   int tax = (int)(amount * 0.15);
   int real = amount + 50000 - tax;
%>
<body>
<jsp:include page="header.jsp"/>
<br><hr>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급여 확인하기</b>
<hr>
<br><br><br>
<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<table id="salTable" border="1">
    <thead>
        <tr>
            <th colspan="2">급여명세서</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>당신의 이번 달 월급</td>
            <td><fmt:formatNumber pattern="#,###" value="<%=amount %>"/>원</td>
        </tr>
        <tr>
            <td>성과급</td>
            <td><fmt:formatNumber pattern="#,###" value="50000"/>원</td>
        </tr>
        <tr>
            <td>세금</td>
            <td><fmt:formatNumber pattern="#,###" value="<%=tax %>"/>원</td>
        </tr>
        <tr>
            <td>실지급액</td>
            <td><fmt:formatNumber pattern="#,###" value="<%=real %>"/>원</td>
        </tr>
        <tr>
            <td colspan="2">지급일은 이번 달 1일입니다.</td>
        </tr>
    </tbody>
</table>


</body>
</html>