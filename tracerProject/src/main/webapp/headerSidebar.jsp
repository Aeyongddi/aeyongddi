
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="messages" />
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
	src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						// 채팅 모달 초기화
						$('#chatModal').hide();

						// 채팅 버튼 클릭 이벤트
						$('.openChatBtn').click(function() {
							$('#chatModal').show();
						});

						// 모달 닫기 버튼 클릭 이벤트
						$('.closeChatModal').click(function() {
							$('#chatModal').hide();
						});
					});

</script>
<header class="app-header fixed-top">
	<div class="app-header-inner">
		<div class="container-fluid py-2">
			<div class="app-header-content">
				<div class="row justify-content-between align-items-center">
					<div class="col-auto">
						<a id="sidepanel-toggler"
							class="sidepanel-toggler d-inline-block d-xl-none" href="#">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
								viewBox="0 0 30 30" role="img">
								<title>Menu</title><path stroke="currentColor"
									stroke-linecap="round" stroke-miterlimit="10" stroke-width="2"
									d="M4 7h22M4 15h22M4 23h22"></path></svg>
						</a>
					</div>
					<!--//col-->
					<div class="search-mobile-trigger d-sm-none col">
						<i class="search-mobile-trigger-icon fa-solid fa-magnifying-glass"></i>
					</div>
					<!--//col-->
					<div class="app-search-box col">
						<form class="app-search-form">
							<input type="text"
								placeholder="<fmt:message key='search.placeholder'/>"
								name="search" class="form-control search-input">
							<button type="submit" class="btn search-btn btn-primary"
								value="Search">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</form>
					</div>
					<!--//app-search-box-->
					<div class="app-utilities col-auto">
						<div class="app-utility-item">
							<a href="resource" title="Settings"> <!--//Bootstrap Icons: https://icons.getbootstrap.com/ -->
								<svg width="1em" height="1em" viewBox="0 0 16 16"
									class="bi bi-gear icon" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
										d="M8.837 1.626c-.246-.835-1.428-.835-1.674 0l-.094.319A1.873 1.873 0 0 1 4.377 3.06l-.292-.16c-.764-.415-1.6.42-1.184 1.185l.159.292a1.873 1.873 0 0 1-1.115 2.692l-.319.094c-.835.246-.835 1.428 0 1.674l.319.094a1.873 1.873 0 0 1 1.115 2.693l-.16.291c-.415.764.42 1.6 1.185 1.184l.292-.159a1.873 1.873 0 0 1 2.692 1.116l.094.318c.246.835 1.428.835 1.674 0l.094-.319a1.873 1.873 0 0 1 2.693-1.115l.291.16c.764.415 1.6-.42 1.184-1.185l-.159-.291a1.873 1.873 0 0 1 1.116-2.693l.318-.094c.835-.246.835-1.428 0-1.674l-.319-.094a1.873 1.873 0 0 1-1.115-2.692l.16-.292c.415-.764-.42-1.6-1.185-1.184l-.291.159A1.873 1.873 0 0 1 8.93 1.945l-.094-.319zm-2.633-.283c.527-1.79 3.065-1.79 3.592 0l.094.319a.873.873 0 0 0 1.255.52l.292-.16c1.64-.892 3.434.901 2.54 2.541l-.159.292a.873.873 0 0 0 .52 1.255l.319.094c1.79.527 1.79 3.065 0 3.592l-.319.094a.873.873 0 0 0-.52 1.255l.16.292c.893 1.64-.902 3.434-2.541 2.54l-.292-.159a.873.873 0 0 0-1.255.52l-.094.319c-.527 1.79-3.065 1.79-3.592 0l-.094-.319a.873.873 0 0 0-1.255-.52l-.292.16c-1.64.893-3.433-.902-2.54-2.541l.159-.292a.873.873 0 0 0-.52-1.255l-.319-.094c-1.79-.527-1.79-3.065 0-3.592l.319-.094a.873.873 0 0 0 .52-1.255l-.16-.292c-.892-1.64.902-3.433 2.541-2.54l.292.159a.873.873 0 0 0 1.255-.52l.094-.319z" />
                                    <path fill-rule="evenodd"
										d="M8 5.754a2.246 2.246 0 1 0 0 4.492 2.246 2.246 0 0 0 0-4.492zM4.754 8a3.246 3.246 0 1 1 6.492 0 3.246 3.246 0 0 1-6.492 0z" />
                                </svg>
							</a>
						</div>
						<!--//app-utility-item-->
						<%-- <div class="app-utility-item app-user-dropdown dropdown">
                            <ul class="dropdown-menu" aria-labelledby="user-dropdown-toggle">
                                <li><a class="dropdown-item" href="account"><fmt:message key='user.management'/></a></li>
                                <li><a class="dropdown-item" href="settings.jsp"><fmt:message key='settings'/></a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="logout"><fmt:message key='logout'/></a></li>
                            </ul>
                        </div><!--//app-user-dropdown-->  --%>
						<div class="app-utility-item app-user-dropdown dropdown">
							<a class="dropdown-toggle" id="user-dropdown-toggle"
								data-bs-toggle="dropdown" href="#" role="button"
								aria-expanded="false"><img src="assets/images/user.png"
								alt="user profile"></a>
							<ul class="dropdown-menu" aria-labelledby="user-dropdown-toggle">
								<li><a class="dropdown-item" href="account"><fmt:message
											key='user.management' /></a></li>
								<li><a class="dropdown-item" href="settings.jsp"><fmt:message
											key='settings' /></a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="logout"><fmt:message
											key='logout' /></a></li>
							</ul>
						</div>
						<!--//app-user-dropdown-->
					</div>
					<!--//app-utilities-->
				</div>
				<!--//row-->
			</div>
			<!--//app-header-content-->
		</div>
		<!--//container-fluid-->
	</div>
	<!--//app-header-inner-->
	<div id="app-sidepanel" class="app-sidepanel">
		<div id="sidepanel-drop" class="sidepanel-drop"></div>
		<div class="sidepanel-inner d-flex flex-column">
			<a href="#" id="sidepanel-close" class="sidepanel-close d-xl-none">&times;</a>
			<div class="app-branding">
				<a class="app-logo" href="index"><img class="logo-icon me-2"
					src="logo.png" alt="logo"><span class="logo-text">TRACER</span></a>
			</div>
			<!--//app-branding-->
			<nav id="app-nav-main" class="app-nav app-nav-main flex-grow-1">
				<ul class="app-menu list-unstyled accordion" id="menu-accordion">
					<li class="nav-item"><a class="nav-link" href="index"> <span
							class="nav-icon"> <svg width="1em" height="1em"
									viewBox="0 0 16 16" class="bi bi-house-door"
									fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
										d="M7.646 1.146a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5H9.5a.5.5 0 0 1-.5-.5v-4H7v4a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6zM2.5 7.707V14H6v-4a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v4h3.5V7.707L8 2.207l-5.5 5.5z" />
                                    <path fill-rule="evenodd"
										d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
                                </svg>
						</span> <span>메인 페이지[대시보드]</span>
					</a>
					<!--//nav-link--></li>
					<!--//nav-item-->
					<li class="nav-item"><a class="nav-link newProject" href="newPrj">
							<span class="nav-icon"> <svg width="1em" height="1em"
									viewBox="0 0 16 16" class="bi bi-house-door"
									fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
										d="M7.646 1.146a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5H9.5a.5.5 0 0 1-.5-.5v-4H7v4a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6zM2.5 7.707V14H6v-4a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v4h3.5V7.707L8 2.207l-5.5 5.5z" />
                                    <path fill-rule="evenodd"
										d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
                                </svg>
						</span> <span class="nav-link-text"><fmt:message key='new.project' /></span>
					</a>
					<!--//nav-link--></li>
					<!--//nav-item-->
					<li class="nav-item"><a class="nav-link" href="timeline">
							<span class="nav-icon"> <svg width="1em" height="1em"
									viewBox="0 0 16 16" class="bi bi-folder" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
                                    <path
										d="M9.828 4a3 3 0 0 1-2.12-.879l-.83-.828A1 1 0 0 0 6.173 2H2.5a1 1 0 0 0-1 .981L1.546 4h-1L.5 3a2 2 0 0 1 2-2h3.672a2 2 0 0 1 1.414.586l.828.828A2 2 0 0 0 9.828 3v1z" />
                                    <path fill-rule="evenodd"
										d="M13.81 4H2.19a1 1 0 0 0-.996 1.09l.637 7a1 1 0 0 0 .995.91h10.348a1 1 0 0 0 .995-.91l.637-7A1 1 0 0 0 13.81 4zM2.19 3A2 2 0 0 0 .198 5.181l.637 7A2 2 0 0 0 2.826 14h10.348a2 2 0 0 0 1.991-1.819l.637-7A2 2 0 0 0 13.81 3H2.19z" />
                                </svg>
						</span> <span>일정 관리[간트차트]</span>
					</a>
					<!--//nav-link--></li>
					<!--//nav-item-->
					<li class="nav-item"><a class="nav-link" href="calendar">
							<span class="nav-icon"> <svg width="1em" height="1em"
									viewBox="0 0 16 16" class="bi bi-card-list" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
										d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
                                    <path fill-rule="evenodd"
										d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 1 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 1 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 1 1 0 1h-7a.5.5 0 0 1-.5-.5z" />
                                    <circle cx="3.5" cy="5.5" r=".5" />
                                    <circle cx="3.5" cy="8" r=".5" />
                                    <circle cx="3.5" cy="10.5" r=".5" />
                                </svg>
						</span> <span>일정 관리[캘린더]</span>
					</a>
					<!--//nav-link--></li>
					<!--//nav-item-->
					<li class="nav-item has-submenu"><a
						class="nav-link submenu-toggle" href="#" data-bs-toggle="collapse"
						data-bs-target="#submenu-1" aria-expanded="false"
						aria-controls="submenu-1"> <span class="nav-icon"> <svg
									width="1em" height="1em" viewBox="0 0 16 16"
									class="bi bi-files" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
										d="M4 2h7a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2zm0 1a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h7a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H4z" />
                                    <path
										d="M6 0h7a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2v-1a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H6a1 1 0 0 0-1 1H4a2 2 0 0 1 2-2z" />
                                </svg>
						</span> <span class="nav-link-text"><fmt:message key='boards' /></span> <span
							class="submenu-arrow"> <svg width="1em" height="1em"
									viewBox="0 0 16 16" class="bi bi-chevron-down"
									fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
										d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
                                </svg>
						</span>
						<!--//submenu-arrow-->
					</a>
					<!--//nav-link-->
						<div id="submenu-1" class="collapse submenu submenu-1"
							data-bs-parent="#menu-accordion">
							<ul class="submenu-list list-unstyled">
								<li class="submenu-item"><a class="submenu-link"
									href="riskBoard"><fmt:message key='risk.management.board' /></a></li>
								<li class="submenu-item"><a class="submenu-link"
									href="taskList"><fmt:message key='schedule.board' /></a></li>
								<li class="submenu-item"><a class="submenu-link"
									href="approval"><fmt:message key='approval.board' /></a></li>
							</ul>
						</div></li>
					<!--//nav-item-->
					<li class="nav-item has-submenu">
    <a class="nav-link submenu-toggle" href="#" data-bs-toggle="collapse" data-bs-target="#chat-submenu" aria-expanded="false" aria-controls="chat-submenu">
        <span class="nav-icon">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat-dots" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 4.546 12.874l3.584 1.3c.464.168.89-.342.688-.808l-1.27-2.952A7 7 0 0 0 8 1zm3.336 9.836c.206-.267.413-.628.507-1.057a.5.5 0 0 0-.647-.518 2.47 2.47 0 0 1-.676.197.5.5 0 0 0-.431.514c.054.512.229.916.392 1.207.081.143.164.262.255.381a6.978 6.978 0 0 1-2.25.725 1 1 0 0 1-.596-.106 1 1 0 0 1-.311-.193 1 1 0 0 1-.221-.454 1.006 1.006 0 0 1 .217-.706c.175-.234.427-.384.707-.384a7.097 7.097 0 0 1 1.235-.223zM6.326 10.83a.5.5 0 0 0-.415-.253H5.5a.5.5 0 0 0 0 1h.176a2.495 2.495 0 0 1 1.003-.215.5.5 0 0 0 .512-.518z"/>
            </svg>
        </span>
        <span class="nav-link-text">채팅[의사소통 관리]</span>
        <span class="submenu-arrow">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-down" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
            </svg>
        </span>
    </a>
    <div id="chat-submenu" class="collapse submenu">
        <ul class="submenu-list list-unstyled">
            <li class="submenu-item"><a class="submenu-link" href="#" onclick="openChat('group')">단체 채팅</a></li>
            <li class="submenu-item"><a class="submenu-link" href="#" onclick="openChat('private')">개인 채팅</a></li>
        </ul>
    </div>
</li>

					<!--//nav-item-->
					<script>
						function openChatWindow(url) {
							window.open(url, "ChatWindow",
									"width=1000,height=800");
						}
						function openChat(chatType) {
						    var chatUrl = chatType === 'group' ? '/chatting' : '/private-chat';
						    document.getElementById('chatIframe').src = chatUrl;
						    $('#chatModal').show();
						}

					</script>
					<!-- 채팅 모달 -->
					<div id="chatModal" class="modal" tabindex="-1">
					
						<div class="modal-dialog" style="max-width: 80%; width: 1200px;">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">채팅</h5>
									<button type="button" class="btn-close closeChatModal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body" style="height: 700px;">
									<iframe id="chatIframe" src="/chatting" width="100%"
										height="100%" frameborder="0"></iframe>
								</div>
							</div>
						</div>
					</div>
					<li class="nav-item"><a class="nav-link" href="prjList"> <span
							class="nav-icon"> <svg width="1em" height="1em"
									viewBox="0 0 16 16" class="bi bi-question-circle"
									fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
										d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                    <path
										d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
                                </svg>
						</span> <span>프로젝트 목록</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="prjDetail?pid=${user_info.pid }"> <span
							class="nav-icon"> <svg width="1em" height="1em"
									viewBox="0 0 16 16" class="bi bi-question-circle"
									fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
										d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                    <path
										d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
                                </svg>
						</span> <span>프로젝트정보[인적자원 관리]</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="teamList?pid=${user_info.pid }"> <span
							class="nav-icon"> <svg width="1em" height="1em"
									viewBox="0 0 16 16" class="bi bi-question-circle"
									fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
										d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                    <path
										d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
                                </svg>
						</span> <span>팀 목록</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="newTeam"> <span
							class="nav-icon"> <svg width="1em" height="1em"
									viewBox="0 0 16 16" class="bi bi-question-circle"
									fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
										d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                    <path
										d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
                                </svg>
						</span> <span>팀 생성하기</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="teamDetail"> <span
							class="nav-icon"> <svg width="1em" height="1em"
									viewBox="0 0 16 16" class="bi bi-question-circle"
									fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
										d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                    <path
										d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
                                </svg>
						</span> <span>팀 정보[인적자원 관리]</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="userManagement"> <span
							class="nav-icon"> <svg width="1em" height="1em"
									viewBox="0 0 16 16" class="bi bi-question-circle"
									fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
										d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                    <path
										d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
                                </svg>
						</span> <span>사용자 관리</span>
					</a></li>
				</ul>
				<!--//app-menu-->
			</nav>
			<!--//app-nav-->
			<div class="app-sidepanel-footer">
				<nav class="app-nav app-nav-footer">
					<ul class="app-menu footer-menu list-unstyled">
						<li class="nav-item">&nbsp; TRACER<br><br>
						</li>
						<!--//nav-item-->
					</ul>
					<!--//footer-menu-->
				</nav>
			</div>
			<!--//app-sidepanel-footer-->
		</div>
		<!--//sidepanel-inner-->
	</div>
	<!--//app-sidepanel-->
</header>
<!--//app-header-->
