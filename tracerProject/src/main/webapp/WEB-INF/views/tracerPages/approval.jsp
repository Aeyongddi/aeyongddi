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
								    <select class="form-select w-auto" >
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
				    <a class="flex-sm-fill text-sm-center nav-link" id="orders-inprocess-tab" data-bs-toggle="tab" href="#orders-inprocess" role="tab" aria-controls="orders-inprocess" aria-selected="false">처리 중</a>
				    <a class="flex-sm-fill text-sm-center nav-link" id="orders-rejected-tab" data-bs-toggle="tab" href="#orders-rejected" role="tab" aria-controls="orders-rejected" aria-selected="false">반려</a>
				    <a class="flex-sm-fill text-sm-center nav-link" id="orders-completed-tab" data-bs-toggle="tab" href="#orders-completed" role="tab" aria-controls="orders-completed" aria-selected="false">결재 완료</a>
				</nav>
				
				<div class="tab-content" id="orders-table-tab-content">
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
												<th class="cell">날짜</th>
												<th class="cell">상태</th>
												<th class="cell">상세보기</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="cell">#15346</td>
												<td class="cell"><span class="truncate">Lorem ipsum dolor sit amet eget volutpat erat</span></td>
												<td class="cell">John Sanders</td>
												<td class="cell"><span>17 Oct</span><span class="note">2:16 PM</span></td>
												<td class="cell"><span class="badge bg-success">결재 완료</span></td>
												<td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
											</tr>
											<tr>
												<td class="cell">#15345</td>
												<td class="cell"><span class="truncate">Consectetur adipiscing elit</span></td>
												<td class="cell">Dylan Ambrose</td>
												<td class="cell"><span class="cell-data">16 Oct</span><span class="note">03:16 AM</span></td>
												<td class="cell"><span class="badge bg-warning">결재 대기</span></td>
												<td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
											</tr>
											<tr>
												<td class="cell">#15344</td>
												<td class="cell"><span class="truncate">Pellentesque diam imperdiet</span></td>
												<td class="cell">Teresa Holland</td>
												<td class="cell"><span class="cell-data">16 Oct</span><span class="note">01:16 AM</span></td>
												<td class="cell"><span class="badge bg-info">처리 중</span></td>
												<td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
											</tr>
											<tr>
												<td class="cell">#15342</td>
												<td class="cell"><span class="truncate">Justo feugiat neque</span></td>
												<td class="cell">Reina Brooks</td>
												<td class="cell"><span class="cell-data">12 Oct</span><span class="note">04:23 PM</span></td>
												<td class="cell"><span class="badge bg-danger">반려</span></td>
												<td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
											</tr>
										</tbody>
									</table>
						        </div><!--//table-responsive-->
						    </div><!--//app-card-body-->		
						</div><!--//app-card-->
			        </div><!--//tab-pane-->
			        
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
												<th class="cell">날짜</th>
												<th class="cell">상태</th>
												<th class="cell">상세보기</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="cell">#15345</td>
												<td class="cell"><span class="truncate">Consectetur adipiscing elit</span></td>
												<td class="cell">Dylan Ambrose</td>
												<td class="cell"><span class="cell-data">16 Oct</span><span class="note">03:16 AM</span></td>
												<td class="cell"><span class="badge bg-warning">결재 대기</span></td>
												<td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
											</tr>
											<!-- 추가 데이터들 -->
										</tbody>
									</table>
						        </div><!--//table-responsive-->
						    </div><!--//app-card-body-->		
						</div><!--//app-card-->
			        </div><!--//tab-pane-->
			        
			        <div class="tab-pane fade" id="orders-inprocess" role="tabpanel" aria-labelledby="orders-inprocess-tab">
					    <div class="app-card app-card-orders-table mb-5">
						    <div class="app-card-body">
							    <div class="table-responsive">
							        <table class="table mb-0 text-left">
										<thead>
											<tr>
												<th class="cell">결재번호</th>
												<th class="cell">내용</th>
												<th class="cell">요청자</th>
												<th class="cell">날짜</th>
												<th class="cell">상태</th>
												<th class="cell">상세보기</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="cell">#15344</td>
												<td class="cell"><span class="truncate">Pellentesque diam imperdiet</span></td>
												<td class="cell">Teresa Holland</td>
												<td class="cell"><span class="cell-data">16 Oct</span><span class="note">01:16 AM</span></td>
												<td class="cell"><span class="badge bg-info">처리 중</span></td>
												<td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
											</tr>
											<!-- 추가 데이터들 -->
										</tbody>
									</table>
						        </div><!--//table-responsive-->
						    </div><!--//app-card-body-->		
						</div><!--//app-card-->
			        </div><!--//tab-pane-->
			        
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
												<th class="cell">날짜</th>
												<th class="cell">상태</th>
												<th class="cell">상세보기</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="cell">#15342</td>
												<td class="cell"><span class="truncate">Justo feugiat neque</span></td>
												<td class="cell">Reina Brooks</td>
												<td class="cell"><span class="cell-data">12 Oct</span><span class="note">04:23 PM</span></td>
												<td class="cell"><span class="badge bg-danger">반려</span></td>
												<td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
											</tr>
											<!-- 추가 데이터들 -->
										</tbody>
									</table>
						        </div><!--//table-responsive-->
						    </div><!--//app-card-body-->		
						</div><!--//app-card-->
			        </div><!--//tab-pane-->

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
												<th class="cell">날짜</th>
												<th class="cell">상태</th>
												<th class="cell">상세보기</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="cell">#15346</td>
												<td class="cell"><span class="truncate">Lorem ipsum dolor sit amet eget volutpat erat</span></td>
												<td class="cell">John Sanders</td>
												<td class="cell"><span>17 Oct</span><span class="note">2:16 PM</span></td>
												<td class="cell"><span class="badge bg-success">결재 완료</span></td>
												<td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
											</tr>
											<!-- 추가 데이터들 -->
										</tbody>
									</table>
						        </div><!--//table-responsive-->
						    </div><!--//app-card-body-->		
						</div><!--//app-card-->
			        </div><!--//tab-pane-->
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
