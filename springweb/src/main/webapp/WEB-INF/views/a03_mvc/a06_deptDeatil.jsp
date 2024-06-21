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
		// enter키 입력시 form submit 처리 방지.
		$("form").on("keydown", function(event) {
			/// 해당 이벤트가 event.keyCode는 13과 같은 event.key는 Enter키를
			// 입력시, 요청값을 서버에 전달하는 것을 
			if (event.key === "Enter") {
				// 방지 처리하는 기능 수행..
				event.preventDefault();
				return false;
			}
		})
		
		
		// // empnoDupck.do  ckDupEmp
		$("[name=empno]").keyup(function(){
			if(event.keyCode==13){
				$.ajax({
					url:"empnoDupck.do",
					data:"empno="+$(this).val(),
					dataType:"json",
					success:function(data){
						if(data.ckDupEmp > 0){
							alert("중복 등록된 사원번호가 있습니다.")
							$("[name=empno]").val("").focus()
						}else{
							alert("해당번호로 등록가능합니다")
						}				
					},
					error:function(err){
						console.log(err)
					}
				})
			}
			
		})
	});
	var msg = "${msg}"
		var proc = "${proc}"
		if(msg!=""){	// 공백이 아닐 때 처리
			alert(msg)
			if(proc=="수정"){
				alert("조회화면이동");
				location.href="deptList101.do"	
			}
		}
	
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>사원정보상세</h2>

</div>
<div class="container">
	<form method="post" action="deptInsert102.do"> <!-- 등록시 controller호출.. -->
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">부서번호</span>
		</div>
		<input type="number" name="deptno" class="form-control" value="${dept.deptno }" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">부서명</span>
		</div>
		<input name="dname" class="form-control" value="${dept.dname }" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="input-group-text  justify-content-center">지역</span>
		</div>
		<input name="loc" class="form-control" value="${dept.loc }" />	
	</div>	
					
	<div style="text-align:right;">
			<input type="button" class="btn btn-primary" value="수정" id="uptBtn"/>
			<input type="button" class="btn btn-warning" value="삭제" id="delBtn"/>
			<input type="button" class="btn btn-primary" value="메인화면으로" id="mainBtn"/>
	</div>	
	</form>	
	<script type="text/javascript">
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				$("form").submit()
			}
		})
		$("delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="deptDelete102.do?deptno="+$["name=deptno]").val()
			}
		})
		$("#mainBtn").click(function(){
			location.href="deptList101.do"
		})
	
	</script>
</div>	
</body>
</html>