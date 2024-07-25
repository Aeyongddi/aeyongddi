<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html lang="ko"> 
<head>
    <title>Portal - Bootstrap 5 Admin Dashboard Template For Developers</title>
    
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <meta name="description" content="Portal - Bootstrap 5 Admin Dashboard Template For Developers">
    <meta name="author" content="Xiaoying Riley at 3rd Wave Media">    
    <link rel="shortcut icon" href="favicon.ico"> 
    
    <!-- FontAwesome JS-->
    <script defer src="assets/plugins/fontawesome/js/all.min.js"></script>
    
    <!-- App CSS -->  
    <link id="theme-style" rel="stylesheet" href="assets/css/portal.css">

</head> 
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	if(${msg!=null})
		alert("${msg}")
	$('form').on('keydown', 'input', function(event) {
         if (event.keyCode === 13) { 
               event.preventDefault();
               return false;
         }
    });
	$('.signupBtn').click(function(){
		if($('#signup-password').val()!=$('#signup-passwordChk').val())
			alert('비밀번호와 비밀번호 확인 입력이 일치하지 않습니다.')
		else{
			$.ajax({
				data: $("form").serialize(),
				url: 'mail/sendSingupSuccess',
				type: 'POST',
				success: function(data){
					console.log(data)
				},
				error: function(err){
					console.log(err)
				}
			})
			$('form').submit()		
		}
	})
})
</script>
<body class="app app-signup p-0">    	
    <div class="row g-0 app-auth-wrapper">
	    <div class="col-12 col-md-7 col-lg-6 auth-main-col text-center p-5">
		    <div class="d-flex flex-column align-content-end">
			    <div class="app-auth-body mx-auto">	
				    <div class="app-auth-branding mb-4"><a class="app-logo" href="signup"><img class="logo-icon me-2" src="/logo.png" alt="logo"></a></div>
					<h2 class="auth-heading text-center mb-4">TRACER 회원가입</h2>					
	
					<div class="auth-form-container text-start mx-auto">
						<form method="post" action="signup" class="auth-form auth-signup-form">         
							<div class="email mb-3">
							이름	
								<input id="signup-name" name="name" type="text" class="form-control signup-name" placeholder="이름 입력" required="required">
							닉네임	
								<input id="signup-name" name="nickname" type="text" class="form-control signup-name" placeholder="닉네임 입력" required="required">
							전화번호	
								<input id="signup-name" name="phone" type="text" class="form-control signup-name" placeholder="전화번호 입력 ( - 빼고 입력 )" required="required">
							생일	
								<input id="signup-name" name="birth" type="date" class="form-control signup-name" placeholder="생일 입력" required="required">
							이메일
								<input id="signup-email" name="email" type="email" class="form-control signup-email" placeholder="이메일 입력" required="required">
							인증번호	
								<input id="signup-name" type="text" class="form-control signup-name" placeholder="이름 입력" required="required">
							비밀번호
								<input id="signup-password" name="password" type="password" class="form-control signup-password" placeholder="비밀번호 입력" required="required">
							비밀번호 확인
								<input id="signup-passwordChk" type="password" class="form-control signup-password" placeholder="비밀번호 확인" required="required">
							</div>
						
							<div class="text-center">
								<button type="button" class="signupBtn btn app-btn-primary w-100 theme-btn mx-auto">회원가입</button>
							</div>
						</form>
						
						<div class="auth-option text-center pt-5">이미 계정이 있으신가요? <a class="text-link" href="login" >로그인 페이지로</a></div>
					</div>
					
					
				    
			    </div>
		    
			    <footer class="app-auth-footer">
				    <div class="container text-center py-3">
				         <!--/* This template is free as long as you keep the footer attribution link. If you'd like to use the template without the attribution link, you can buy the commercial license via our website: themes.3rdwavemedia.com Thank you for your support. :) */-->
			        <small class="copyright">Designed with by <a class="app-link" href="http://themes.3rdwavemedia.com" target="_blank">Xiaoying Riley</a> for developers</small>
				       
				    </div>
			    </footer><!--//app-auth-footer-->	
		    </div><!--//flex-column-->   
	    </div><!--//auth-main-col-->
	    <div class="col-12 col-md-5 col-lg-6 h-100 auth-background-col">
		    <div class="auth-background-holder">			    
		    </div>
		    <div class="auth-background-mask"></div>
		    <div class="auth-background-overlay p-3 p-lg-5">
			    <div class="d-flex flex-column align-content-end h-100">
				    <div class="h-100"></div>
				</div>
		    </div><!--//auth-background-overlay-->
	    </div><!--//auth-background-col-->
    
    </div><!--//row-->


</body>
</html> 

