<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String prodName = request.getParameter("prodName");
String prodPrice = request.getParameter("prodPrice");
%>
<h3> 물건명: <%=prodName %></h3>
<h3> 물건명: <%=prodPrice %></h3>
<h3> 물건명: ${param.prodName}</h3>
<h3> 가격: ${param.prodPrice}</h3>
</body>
</html>