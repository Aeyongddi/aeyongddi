<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko"> 
<head>
    <title>TRACER - 결재 페이지</title>
    
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
<jsp:include page="/headerSidebar.jsp"/> 
<body>   
    <div class="app-wrapper">
	    <div class="app-content pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">
			    <br><br>
			    <div class="row g-3 mb-4 align-items-center justify-content-between">
				    <div class="col-auto">
			            <h1 class="app-page-title mb-0">결재</h1>
				    </div>
				    <div class="col-auto">
					     <div class="page-utilities">
						    <div class="row g-2 justify-content-start justify-content-md-end align-items-center">
							    <div class="col-auto">
								    <form class="table-search-form row gx-1 align-items-center">
					                    <div class="col-auto">
					                        <input type="text" id="search-orders" name="searchorders" class="form-control search-orders" placeholder="Search">
					                    </div>
					                    <div class="col-auto">
					                        <button type="submit" class="btn app-btn-secondary">Search</button>
					                    </div>
					                </form>
							    </div><!--//col-->
							    <div class="col-auto">
								    <select class="form-select w-auto">
										  <option selected value="option-1">All</option>
										  <option value="option-2">This week</option>
										  <option value="option-3">This month</option>
										  <option value="option-4">Last 3 months</option>
									</select>
							    </div>
						    </div><!--//row-->
					    </div><!--//table-utilities-->
				    </div><!--//col-auto-->
			    </div><!--//row-->
			    
			    <nav id="orders-table-tab" class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
				    <a class="flex-sm-fill text-sm-center nav-link active" id="orders-all-tab" data-bs-toggle="tab" href="#orders-all" role="tab" aria-controls="orders-all" aria-selected="true">전체</a>
				    <a class="flex-sm-fill text-sm-center nav-link" id="orders-pending-tab" data-bs-toggle="tab" href="#orders-pending" role="tab" aria-controls="orders-pending" aria-selected="false">결재 대기</a>
				    <a class="flex-sm-fill text-sm-center nav-link" id="orders-rejected-tab" data-bs-toggle="tab" href="#orders-rejected" role="tab" aria-controls="orders-rejected" aria-selected="false">보류</a>
				    <a class="flex-sm-fill text-sm-center nav-link" id="orders-completed-tab" data-bs-toggle="tab" href="#orders-completed" role="tab" aria-controls="orders-completed" aria-selected="false">결재 완료</a>
				</nav>
				
				<div class="tab-content" id="orders-table-tab-content">
			        <!-- 전체 탭 -->
			        <div class="tab-pane fade show active" id="orders-all" role="tabpanel" aria-labelledby="orders-all-tab">
					    <div class="app-card app-card-orders-table shadow-sm mb-5">
						    <div class="app-card-body">
							    <div class="table-responsive">
							        <table class="table app-table-hover mb-0 text-left">
										<thead>
											<tr>
												<th class="cell">결재번호</th>
												<th class="cell">내용</th>
												<th class="cell">요청자</th>
												<th class="cell">이메일</th>
												<th class="cell">상태</th>
												<th class="cell">상태 변경</th>
											</tr>
										</thead>
										<tbody>
										    <c:forEach var="approval" items="${allApprovals}">
										        <tr>
										            <td class="cell">${approval.apid}</td>
										            <td class="cell"><span class="truncate">${approval.content}</span></td>
										            <td class="cell">${approval.nickname}</td>
										            <td class="cell"><span>${approval.email}</span></td>
										            <td class="cell"><span>${approval.approvalStatus}</span></td>
										            <td class="cell">
										                <button class="btn-sm app-btn-secondary" onclick="updateApprovalStatus('${approval.apid}', '승인')">승인</button>
										                <button class="btn-sm app-btn-secondary" onclick="updateApprovalStatus('${approval.apid}', '보류')">보류</button>
										            </td>
										        </tr>
										    </c:forEach>
										</tbody>
									</table>
						        </div><!--//table-responsive-->
						    </div><!--//app-card-body-->		
						</div><!--//app-card-->
			        </div><!--//tab-pane-->

			        <!-- 결재 대기 탭 -->
			        <div class="tab-pane fade" id="orders-pending" role="tabpanel" aria-labelledby="orders-pending-tab">
					    <div class="app-card app-card-orders-table mb-5">
						    <div class="app-card-body">
							    <div class="table-responsive">
							        <table class="table mb-0 text-left">
										<thead>
											<tr>
												<th class="cell">결재번호</th>
												<th class="cell">내용</th>
												<th class="cell">요청자</th>
												<th class="cell">이메일</th>
												<th class="cell">상태</th>
												<th class="cell">상태 변경</th>
											</tr>
										</thead>
										<tbody>
										    <c:forEach var="approval" items="${pendingApprovals}">
										        <tr>
										            <td class="cell">${approval.apid}</td>
										            <td class="cell"><span class="truncate">${approval.content}</span></td>
										            <td class="cell">${approval.nickname}</td>
										            <td class="cell"><span>${approval.email}</span></td>
										            <td class="cell"><span>${approval.approvalStatus}</span></td>
										            <td class="cell">
										                <button class="btn-sm app-btn-secondary" onclick="updateApprovalStatus('${approval.apid}', '승인')">승인</button>
										                <button class="btn-sm app-btn-secondary" onclick="updateApprovalStatus('${approval.apid}', '보류')">보류</button>
										            </td>
										        </tr>
										    </c:forEach>
										</tbody>
									</table>
						        </div><!--//table-responsive-->
						    </div><!--//app-card-body-->		
						</div><!--//app-card-->
			        </div><!--//tab-pane-->

			        <!-- 보류 탭 (반려에서 변경) -->
			        <div class="tab-pane fade" id="orders-rejected" role="tabpanel" aria-labelledby="orders-rejected-tab">
					    <div class="app-card app-card-orders-table mb-5">
						    <div class="app-card-body">
							    <div class="table-responsive">
							        <table class="table mb-0 text-left">
										<thead>
											<tr>
												<th class="cell">결재번호</th>
												<th class="cell">내용</th>
												<th class="cell">요청자</th>
												<th class="cell">이메일</th>
												<th class="cell">상태</th>
												<th class="cell">상태 변경</th>
											</tr>
										</thead>
										<tbody>
										    <c:forEach var="approval" items="${rejectedApprovals}">
										        <tr>
										            <td class="cell">${approval.apid}</td>
										            <td class="cell"><span class="truncate">${approval.content}</span></td>
										            <td class="cell">${approval.nickname}</td>
										            <td class="cell"><span>${approval.email}</span></td>
										            <td class="cell"><span>${approval.approvalStatus}</span></td>
										            <td class="cell">
										                <button class="btn-sm app-btn-secondary" onclick="updateApprovalStatus('${approval.apid}', '승인')">승인</button>
										                <button class="btn-sm app-btn-secondary" onclick="updateApprovalStatus('${approval.apid}', '보류')">보류</button>
										            </td>
										        </tr>
										    </c:forEach>
										</tbody>
									</table>
						        </div><!--//table-responsive-->
						    </div><!--//app-card-body-->		
						</div><!--//app-card-->
			        </div><!--//tab-pane-->

			       <!-- 결재 완료 탭 -->
<div class="tab-pane fade" id="orders-completed" role="tabpanel" aria-labelledby="orders-completed-tab">
    <div class="app-card app-card-orders-table mb-5">
        <div class="app-card-body">
            <div class="table-responsive">
                <table class="table mb-0 text-left">
                    <thead>
                        <tr>
                            <th class="cell">결재번호</th>
                            <th class="cell">내용</th>
                            <th class="cell">요청자</th>
                            <th class="cell">이메일</th>
                            <th class="cell">상태</th>
                            <th class="cell">액션</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="approval" items="${completedApprovals}">
                            <tr>
                                <td class="cell">${approval.apid}</td>
                                <td class="cell"><span class="truncate">${approval.content}</span></td>
                                <td class="cell">${approval.nickname}</td>
                                <td class="cell"><span>${approval.email}</span></td>
                                <td class="cell"><span>${approval.approvalStatus}</span></td>
                                <td class="cell">
                                    <!-- 결재 완료된 항목에 대한 추가 액션이 있다면 여기에 추가 -->
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div><!--//table-responsive-->
        </div><!--//app-card-body-->
    </div><!--//app-card-->
</div><!--//tab-pane-->

			        <script>
			        function updateApprovalStatus(apid, status) {
			            $.ajax({
			                type: "POST",
			                url: "/updateApprovalStatus",
			                data: { apid: apid, status: status },
			                success: function(response) {
			                    alert(response);
			                    location.reload(); // 페이지 새로고침
			                },
			                error: function(xhr, status, error) {
			                    console.error("Status: ", status);
			                    console.error("Error: ", error);
			                    console.error("Response: ", xhr.responseText);
			                    alert(xhr.responseText);
			                }
			            });
			        }
			        </script>
				</div><!--//tab-content-->
		    </div><!--//container-fluid-->
	    </div><!--//app-content-->
	    
	    <footer class="app-footer">
		    <div class="container text-center py-3">
		         <small class="copyright">Designed with by <a class="app-link" href="http://themes.3rdwavemedia.com" target="_blank">Xiaoying Riley</a> for developers</small>
		    </div>
	    </footer><!--//app-footer-->
    </div><!--//app-wrapper-->    
    <!-- Javascript -->          
    <script src="assets/plugins/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>  
    <!-- Page Specific JS -->
    <script src="assets/js/app.js"></script> 
</body>
</html>
