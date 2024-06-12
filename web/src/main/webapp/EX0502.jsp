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
String name = request.getParameter("name");
String email = request.getParameter("email");
String age = request.getParameter("age");
%>
<h3> 안녕하세요, <%=name %> 님</h3>
<h3> 당신의 이메일은 <%=email %>이고 </h3>
<h3> 나이는 <%=email %>입니다. </h3>
<%
String qust1 = request.getParameter("qust1");
String qust2 = request.getParameter("qust2");
String qust3 = request.getParameter("qust3");
%>
<h3> 답변 1. <%=qust1 %></h3>
<h3> 답변 2. <%=qust2 %></h3>
<h3> 답변 3. <%=qust3 %></h3>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String point = request.getParameter("point");
%>
<h3> id: <%=id %></h3>
<h3> pwd:  <%=pwd %></h3>
<h3> point:  <%=point %></h3>

<%
String hobby1 = request.getParameter("hobby1");
String hobby2 = request.getParameter("hobby2");
String hobby3= request.getParameter("hobby3");
%>
<h3> 취미는: <%=hobby1 %></h3>
<h3> 취미는: <%=hobby2 %></h3>
<h3> 취미는: <%=hobby3 %></h3>
</body>
</html>