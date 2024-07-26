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
		$("h3").click(function(){
			$("div").find("span").css("font-size","30px")
		})
		$("h4").click(function(){
			$("div").children("span").css("background","red")
		})
		$("h1").click(function(){
			$("div").append("<span>안녕하세요</span>")
		})
	});
	// ex) 구매할 과일: [	] [장바구니 담기]
	//		구매할 육류: [	] [장바구니 담기]
	//		위 내용에서 장바구니 담기를 클릭 시, 아래 항목에 담아지게 처리
	//		단, 과일은 span으로 입력, 육류는 b 로 입력 처리
	//		[과일확인] [육류확인] ==> 각각 클릭 시, 구분하여 색상표현 핑크/노랑색
	//		사과, 바나나, 소고기, 딸기, 돼지고기
	
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h1>안녕하세요</h1>
  <h2>계층 구조 찾아가기</h2>
	<h3>Find로 span 찾기</h3>
	<h4>children로 span 찾기</h4>
	<div>
		<span>홍길동</span>이순신
	</div>
	<div>
		유관순<p><span>강감찬</span></p>
	</div>
</div>
<%-- 
# jquery DOM 계층 구조
1. html 태그는 기본적으로 계층 구조로 되어 있고, 이것에 대한 접근을 계층 구조 메서드에
	의해서 호출하여 처리를 하고 있다.
2. 계층 구조 기능 메서드
	1) children() : 하위에 있는 요소 객체들 접근
		<div>
			<p>
			<a>
			<h1>
		div 입장에서 p, a, h1 태그는 하위에 요소 객체이다.
	2) parents() : 상위에 있는 요소 객체들 접근
		<body>
			<div>
				<p>
					<h1>
		h1 입장에서는 p, div, body는 상위의 요소 객체들이다.
	3) parent() : 바로 상위에 있는 요소 객체
		<div>
			<p>
			<h1>
		p, h1은 div가 바로 상위에 있는 요소 객체이다.
	4) find("찾는 요소") : 하위에 있는 요소 객체를 찾는 처리
	5) next()/prev() : 같은 레벨의 요소에서 이전 요소, 이후 요소 객체에 대한 선택을 할 때, 주로 사용된다.
--%>
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    과일: <input type="text">
	    	<button type = "button" id="fruit">장바구니 담기</button>
	    육류: <input type="text">
	    	<button type = "button" id="protain">장바구니 담기</button>
	   <button type = "button" id="ckft">과일 확인</button>
	   <button type = "button" id="ckpt">육류 확인</button>
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