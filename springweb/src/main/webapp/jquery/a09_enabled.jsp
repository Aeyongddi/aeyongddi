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
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("form").submit(function(){
			event.preventDefault(); // submit 자동 처리 되는 옵션 방지(기본 이벤트 방지 역할)
		})
		// => 이후에 submit()처리 시 이벤트 핸들러 메서드 정의 $("form").submit() 직접적으로 처리
		// type="button"에 대한 가상 클래스 선언 : button
		// <input type = "button", <button> 태그는 모두 공통 css로 설정 가능
		$(":button").css("border","3px red solid")
		// 비활성화 버튼을 눌렀을 때 처리 내용
		$("#disabled").click(function(){
			// 활성화된 내용을 비활성화로 변경
			$("input[type=text]:enabled").removeAttr("enabled") // enabled 속성값 삭제
			// 주의) 특정 속성 변경 시 기존 속성값을 삭제 후, 신규속성값 설정
			$("input[type=text]:enabled").attr("disabled","disabled") // enabled 속성값 삭제	
		})
		$("#enabled").click(function(){
			// 활성화를 클릭 시 비활성화된 내용을 활성화 처리
			$("input[type=text]:disabled").removeAttr("disabled") // enabled 속성값 삭제
			// 주의) 특정 속성 변경 시 기존 속성값을 삭제 후, 신규속성값 설정
			$("input[type=text]:disabled").attr("enabled","enabled") // enabled 속성값 삭제	
		})
	});
	/* 
	a10_select_enabled.jsp
	선택 select 회원/비회원
	회원	[	]	select의 change() 이벤트로 회원선택 시 회원 입력 항목 활성화 비회원항목 비활성화
	비회원	[	]							 비회원선택 시 비회원 입력 항목 활성화 회원항목 비활성화
	*/
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>form 요소 객체 활성/비활성화 처리</h2>
	<form>
		<fieldset>
			<input type="text" id="first">
			<input type="text" id="second" disabled="disabled">
			<input type="button" id="enabled" value="활성화">
			<button id="disabled">비활성화</button>
			<%--
			# 주의
			<button id="disabled">disable</button>
			button 태그 형태의 default type ? submit 이기에 
			이벤트 핸들러 메서드 연결처리 시 바로 전송되어 처리가 원하는대로 되지 않는 경우 다수
			왜냐하면 서버로 전송된 이후 화면에서 처리되기 때문이다.
			기능 이벤트 처리 시는 반드시 type="button"으로 설정하여야 한다.
			 --%>

		</fieldset>
	</form>
</div>
<%-- 
# show/hide와 enabled/disabled의 차이
1. hide()시에 단순히 보이지 않을 뿐이지 요청 객체로써 의미를 가지기에 
	요청값이 전달된다
2. 하지만 disalbed된 요청객체는 자체의 기능이 비활성화 되기에 요청객체로써 
	요청값 전달이 되지 않는다 (주의)
--%>
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="제목" name=""  class="form-control mr-sm-2" />
	    <input placeholder="내용" name=""  class="form-control mr-sm-2"/>
	    <button class="btn btn-info" type="submit">Search</button>
	    <button class="btn btn-success" 
	    	data-toggle="modal" data-target="#exampleModalCenter"
	        type="button">등록</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="50%">
   	<col width="15%">
   	<col width="15%">
   	<col width="10%">
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회</th>
      </tr>
    </thead>	
    <tbody>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    </tbody>
	</table>    
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="사원명 입력" name="ename">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="직책명 입력" name="job">
	      </div>
	     </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>