<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backweb.vo.*"
    import="backweb.a04_database.*"  
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
   .schForm{
   		text-align:center;
   		display:flex;
   		flex-direction:column;
   		align-items:center;
   	}
   	nav{
   		margin:0 auto;
   		display:inline-block;
   	}
   	.hidden{
   		display:none;
   	}
   	.link{
   		color:blue;
   		text-decoration:underline;
   	}
   	.link:hover{
   		cursor:pointer;
   	}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<c:set var="items" value="${fn:length(empList)}" />
<script type="text/javascript">
   $(document).ready(function(){
	   	const pages = Math.ceil(${items/10});
  		var currPage = 1.0;
  		$(".empSet0").removeClass('hidden')
   		
   		$("#prevPage").click(function(){
   			if(currPage>1){
	   			currPage--;
	   			$("#currPage").text(currPage)
	   			$(".empSet"+(currPage-1)).removeClass('hidden')
	   			$(".empSet"+(currPage)).addClass('hidden')
   			}
   		})
   		$("#nextPage").click(function(){
   			if(currPage<pages){
	   			currPage++;
	   			$("#currPage").text(currPage)
	   			$(".empSet"+(currPage-1)).removeClass('hidden')
	   			$(".empSet"+(currPage-2)).addClass('hidden')
   			}
   		})
   		
   		$("#newSubmit").click(function(){
   			location.href="newInsertFrm.do"
   		})
   });
   function detail(id){
	  location.href="humanRsrcDetail.do?user_employee_id="+id
   }
</script>
</head>

<body>
<jsp:include page="header.jsp"/>
<br><hr>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;부서배치</b>
<hr>
<br><br><br>
<div class="schForm">
	<form action="humanRsrcSch.do">
	<select name="department">
	    <option value="">부서목록</option>
	    <option value="운항및운항관리부서">운항 및 운항 관리 부서</option>
	    <option value="고객관리부서">고객 관리 부서</option>
	    <option value="재무부서">재무 부서</option>
	    <option value="인사부서">인사 부서</option>
	</select>
	
	<select name="position">
	    <option value="">직급</option>
	    <option value="관리자">관리자</option>
	    <option value="평사원">평사원</option>
	</select>
	
	<input name="name" type="text" placeholder="사원명"/>
	<input type="submit" value="검색"/>
	<input id="newSubmit" type="button" value="신규사원 등록"/>
	</form>
	
	
	<div class="container">
	
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="20%">
   	<col width="30%">
   	<col width="20%">
   	<col width="20%">
    <thead>
    
      <tr class=" text-center">
        <th>번호</th>
        <th>이름</th>
        <th>부서명</th>
        <th>직급</th>
        <th>조회</th>
      </tr>
    </thead>	
    <c:set var="cnt" value="0"/>
    <tbody>
    	<c:forEach var="emp" items="${empList}" varStatus="sts">
    	<c:if test="${sts.index%10==0}">
    		<c:set var="cnt" value="${cnt+1 }"/>
    	</c:if>
    	<tr class="empSet${cnt-1} hidden">
    	<td>${emp.user_employee_id}</td><td>${emp.name}</td>
    	<td>${emp.department }</td><td>${emp.position}</td>
    	<td class="link" onclick="detail(${emp.user_employee_id})">상세보기/수정</td></tr>
    	</c:forEach>
    </tbody>
	</table>    
	
</div>

	<nav aria-label="...">
	  	<ul class="pagination">
		    <li class="page-item" >
		      	<span class="page-link" id="prevPage">이전</span>
		    </li>
		    <li class="page-item active" aria-current="page">
		      	<span id="currPage" class="page-link">1</span>
		    </li>
		    <li class="page-item">
		      	<span class="page-link" id="nextPage">다음</span>
		    </li>
	  	</ul>
	</nav>
</div>
</body>
<script type="text/javascript">
	
</script>
</html>