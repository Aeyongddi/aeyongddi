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
	$('form').on('keydown', function(event) {
        if (event.key === 'Enter') {
            event.preventDefault();
        }
    })
	$(".chgPwd").hide(400)
	$(".showChgPwd").click(function(){
		$(".chgPwd").show(400)
	})
	$(".clsBtn").click(function(){
		$(".chgPwd").hide(400)
	})
	$(".chgPwdBtn").click(function(){
		if($("[name=curPwd]").val() != '${user_info.password}')
			alert("현재 비밀번호가 일치하지 않습니다.")
		else if($("[name=password]").val() != $("[name=pwdChk]").val())
			alert("변경 비밀번호와 비밀번호 확인이 일치하지 않습니다.")
		else
			alert("3")
	})
})

function memChk(){
	$.ajax({
		url: '',
		type: 'POST',
		success: function(data){

		},
		error: function(err){
			
		}
	})
}

function chgPwd(){
	$.ajax({
		url: '',
		type: 'POST',
		success: function(data){

		},
		error: function(err){
			
		}
	})
}


</script>
<body class="app">   	
<jsp:include page="/headerSidebar.jsp"/>
    
    <div class="app-wrapper">
	    
	    <div class="app-content pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">
			    
			    <h1 class="app-page-title">My Account</h1>
                <div class="row gy-4">
	                <div class="col-12 col-lg-6">
		                <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">
						    <div class="app-card-header p-3 border-bottom-0">
						        <div class="row align-items-center gx-3">
							        <div class="col-auto">
								        <div class="app-icon-holder">
										    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
</svg>
									    </div><!--//icon-holder-->
						                
							        </div><!--//col-->
							        <div class="col-auto">
								        <h4 class="app-card-title">프로필</h4>
							        </div><!--//col-->
						        </div><!--//row-->
						    </div><!--//app-card-header-->
						    <div class="app-card-body px-4 w-100">
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label mb-2"><strong>프로필 사진</strong></div>
										    <div class="item-data"><img class="profile-image" src="assets/images/user.png" alt=""></div>
									    </div><!--//col-->
									    <div class="col text-end">
										    <a class="btn-sm app-btn-secondary" href="#">Change</a>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label"><strong>이름</strong></div>
									        <div class="item-data">${user_info.name }</div>
									    </div><!--//col-->
									    <div class="col text-end">
										    <a class="btn-sm app-btn-secondary" href="#">Change</a>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label"><strong>닉네임</strong></div>
									        <div class="item-data">${user_info.nickname }</div>
									    </div><!--//col-->
									    <div class="col text-end">
										    <a class="btn-sm app-btn-secondary" href="#">Change</a>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label"><strong>이메일</strong></div>
									        <div class="item-data">${user_info.email }</div>
									    </div><!--//col-->
									    <div class="col text-end">
										    <a class="btn-sm app-btn-secondary" href="#">Change</a>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
							    
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label"><strong>전화번호</strong></div>
									        <div class="item-data">
										        ${user_info.phone }
									        </div>
									    </div><!--//col-->
									    <div class="col text-end">
										    <a class="btn-sm app-btn-secondary" href="#">Change</a>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
						    </div><!--//app-card-body-->
						    <div class="app-card-footer p-4 mt-auto">
							   <a class="btn app-btn-secondary" href="#">Manage Profile</a>
						    </div><!--//app-card-footer-->
						   
						</div><!--//app-card-->
	                </div><!--//col-->
	                <div class="col-12 col-lg-6">
		                <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">
						    <div class="app-card-header p-3 border-bottom-0">
						        <div class="row align-items-center gx-3">
							        <div class="col-auto">
								        <div class="app-icon-holder">
										    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-sliders" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M11.5 2a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM9.05 3a2.5 2.5 0 0 1 4.9 0H16v1h-2.05a2.5 2.5 0 0 1-4.9 0H0V3h9.05zM4.5 7a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM2.05 8a2.5 2.5 0 0 1 4.9 0H16v1H6.95a2.5 2.5 0 0 1-4.9 0H0V8h2.05zm9.45 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm-2.45 1a2.5 2.5 0 0 1 4.9 0H16v1h-2.05a2.5 2.5 0 0 1-4.9 0H0v-1h9.05z"/>
</svg>
									    </div><!--//icon-holder-->
						                
							        </div><!--//col-->
							        <div class="col-auto">
								        <h4 class="app-card-title">Preferences</h4>
							        </div><!--//col-->
						        </div><!--//row-->
						    </div><!--//app-card-header-->
						    <div class="app-card-body px-4 w-100">
							    
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label"><strong>Language </strong></div>
									        <div class="item-data">English</div>
									    </div><!--//col-->
									    <div class="col text-end">
										    <a class="btn-sm app-btn-secondary" href="#">Change</a>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label"><strong>Time Zone</strong></div>
									        <div class="item-data">Central Standard Time (UTC-6)</div>
									    </div><!--//col-->
									    <div class="col text-end">
										    <a class="btn-sm app-btn-secondary" href="#">Change</a>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label"><strong>Currency</strong></div>
									        <div class="item-data">$(US Dollars)</div>
									    </div><!--//col-->
									    <div class="col text-end">
										    <a class="btn-sm app-btn-secondary" href="#">Change</a>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label"><strong>Email Subscription</strong></div>
									        <div class="item-data">Off</div>
									    </div><!--//col-->
									    <div class="col text-end">
										    <a class="btn-sm app-btn-secondary" href="#">Change</a>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label"><strong>SMS Notifications</strong></div>
									        <div class="item-data">On</div>
									    </div><!--//col-->
									    <div class="col text-end">
										    <a class="btn-sm app-btn-secondary" href="#">Change</a>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
						    </div><!--//app-card-body-->
						    <div class="app-card-footer p-4 mt-auto">
							   <a class="btn app-btn-secondary" href="#">Manage Preferences</a>
						    </div><!--//app-card-footer-->
						   
						</div><!--//app-card-->
	                </div><!--//col-->
	                <div class="col-12 col-lg-6">
		                <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">
						    <div class="app-card-header p-3 border-bottom-0">
						        <div class="row align-items-center gx-3">
							        <div class="col-auto">
								        <div class="app-icon-holder">
										    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-shield-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M5.443 1.991a60.17 60.17 0 0 0-2.725.802.454.454 0 0 0-.315.366C1.87 7.056 3.1 9.9 4.567 11.773c.736.94 1.533 1.636 2.197 2.093.333.228.626.394.857.5.116.053.21.089.282.11A.73.73 0 0 0 8 14.5c.007-.001.038-.005.097-.023.072-.022.166-.058.282-.111.23-.106.525-.272.857-.5a10.197 10.197 0 0 0 2.197-2.093C12.9 9.9 14.13 7.056 13.597 3.159a.454.454 0 0 0-.315-.366c-.626-.2-1.682-.526-2.725-.802C9.491 1.71 8.51 1.5 8 1.5c-.51 0-1.49.21-2.557.491zm-.256-.966C6.23.749 7.337.5 8 .5c.662 0 1.77.249 2.813.525a61.09 61.09 0 0 1 2.772.815c.528.168.926.623 1.003 1.184.573 4.197-.756 7.307-2.367 9.365a11.191 11.191 0 0 1-2.418 2.3 6.942 6.942 0 0 1-1.007.586c-.27.124-.558.225-.796.225s-.526-.101-.796-.225a6.908 6.908 0 0 1-1.007-.586 11.192 11.192 0 0 1-2.417-2.3C2.167 10.331.839 7.221 1.412 3.024A1.454 1.454 0 0 1 2.415 1.84a61.11 61.11 0 0 1 2.772-.815z"/>
  <path fill-rule="evenodd" d="M10.854 6.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 8.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
</svg>
									    </div><!--//icon-holder-->
						                
							        </div><!--//col-->
							        <div class="col-auto">
								        <h4 class="app-card-title">Security</h4>
							        </div><!--//col-->
						        </div><!--//row-->
						    </div><!--//app-card-header-->
						    <div class="app-card-body px-4 w-100">
							    
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label"><strong>Password</strong></div>
									    </div><!--//col-->
									    <div class="col text-end">
										    <a class="btn-sm app-btn-secondary showChgPwd">Change</a>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label"><strong>Two-Factor Authentication</strong></div>
									        <div class="item-data">You haven't set up two-factor authentication. </div>
									    </div><!--//col-->
									    <div class="col text-end">
										    <a class="btn-sm app-btn-secondary" href="#">Set up</a>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
						    </div><!--//app-card-body-->
						    
						    <div class="app-card-footer p-4 mt-auto">
							   <a class="btn app-btn-secondary" href="#">Manage Security</a>
						    </div><!--//app-card-footer-->
						   
						</div><!--//app-card-->
	                </div>
	                
                </div><!--//row-->
			    
		    </div><!--//container-fluid-->
	    </div><!--//app-content-->
	    
	    <footer class="app-footer">
		    <div class="container text-center py-3">
		         <!--/* This template is free as long as you keep the footer attribution link. If you'd like to use the template without the attribution link, you can buy the commercial license via our website: themes.3rdwavemedia.com Thank you for your support. :) */-->
            <small class="copyright">Designed with by <a class="app-link" href="http://themes.3rdwavemedia.com" target="_blank">Xiaoying Riley</a> for developers</small>
		       
		    </div>
	    </footer><!--//app-footer-->
	    
    </div><!--//app-wrapper-->    					

<div class="modal chgPwd" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">비밀번호 변경하기</h5>
        <button type="button" class="btn-close clsBtn" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form>
      <div class="modal-body">
       	이메일
       	<input type="email" value="${user_info.email }" name="email" class="form-control mr-sm-2" placeholder="이메일 입력" required readonly/><br>
       	현재 비밀번호
        <input type="password" name="curPwd" class="form-control mr-sm-2" placeholder="현재 비밀번호 입력" required/><br>
        변경할 비밀번호
        <input type="password" name="password" class="form-control mr-sm-2" placeholder="변경할 비밀번호 입력" required/><br>
        비밀번호 확인
        <input type="password" name="pwdChk" class="form-control mr-sm-2" placeholder="비밀번호 확인 입력" required/><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary clsBtn" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary chgPwdBtn">비밀번호 변경하기</button>
      </div>
      </form>
    </div>
  </div>
</div>
 
    <!-- Javascript -->          
    <script src="assets/plugins/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>  
    
    <!-- Page Specific JS -->
    <script src="assets/js/app.js"></script> 

</body>
</html> 

