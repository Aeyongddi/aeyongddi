<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="header.jsp" />
    <title>Reservation List</title>
    <link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
    <link rel="stylesheet" href="${path}/a00_com/project/coco.css">
    <style>
        td { text-align:center; }
    </style>
    <script src="${path}/a00_com/jquery.min.js"></script>
    <script src="${path}/a00_com/popper.min.js"></script>
    <script src="${path}/a00_com/bootstrap.min.js"></script>
    <script src="${path}/a00_com/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script>
        $(document).ready(function() {
            $('.details-button').click(function() {
                var modalId = $(this).data('target');
                $(modalId).modal('show');                
            });            
        });

        // 업데이트 및 삭제 AJAX 함수
        function updateReservation(reservationId) {
            var formData = $('#form' + reservationId).serialize(); // 폼 데이터 직렬화

            $.ajax({
                type: "POST",
                url: "${path}/reservation01Update100.do",
                data: formData,
                success: function(response) {
                    alert("예약이 성공적으로 업데이트되었습니다.");
                    $('#detailsModal' + reservationId).modal('hide'); // 모달 닫기
                    window.location.href = "${path}/ReservationList.do"; // 리스트 페이지로 이동
                },
                error: function(xhr, status, error) {
                    alert("업데이트 중 오류가 발생하였습니다: " + error);
                }
            });
        }

        function deleteReservation(reservationId) {
            $.ajax({
                type: "POST", // DELETE 메서드 사용
                url: "${path}/reservation01Delete100.do",
                data: { reservation: reservationId }, // 단일 데이터 전송
                success: function(response) {
                    alert("예약이 성공적으로 삭제되었습니다.");
                    $('#detailsModal' + reservationId).modal('hide'); // 모달 닫기
                    window.location.href = "${path}/ReservationList.do"; // 리스트 페이지로 이동
                },
                error: function(xhr, status, error) {
                    alert("삭제 중 오류가 발생하였습니다: " + error);
                }
            });
        }
    </script>
</head>

<body>
    <div class="jumbotron text-center">
        <h2>Human Air ERP</h2>
    </div>

    <div class="container">
        <form id="frm01" class="form" method="get" action="${path}/searchByParams.do">
            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                <input placeholder="이름" name="name" value="" class="form-control mr-sm-2" />
                <input placeholder="예약 확인 번호 입력" name="reservation" value="" class="form-control mr-sm-2"/>
                <input placeholder="여권번호" name="passport_number" value="" class="form-control mr-sm-2"/>
                <input type="date" placeholder="출발날짜" name="departure_dateStr" value="" class="form-control mr-sm-2"/>
                <input type="date" placeholder="도착날짜" name="arrival_dateStr" value="" class="form-control mr-sm-2"/>
                <button class="btn btn-info" type="submit">검색</button>
            </nav>
        </form>
        <table class="table table-hover table-striped table-bordered border-primary">
            <col width="5%"><!-- 체크박스 -->
            <col width="9%"><!-- 이름 -->
            <col width="10%"><!-- 예약번호 -->
            <col width="12%"> <!-- 예약상태 -->
            <col width="20%"> <!-- 출발지 -->
            <col width="20%"> <!-- 목적지 -->
            <col width="10%"> <!-- 여권번호 -->
            <col width="10%"> <!-- 좌석등급 -->
            <col width="15%"> <!-- 상세버튼 -->
            
            <thead>
                <tr class="table-success text-center">
                    <th></th>
                    <th class="name-column">이름</th>
                    <th>예약번호</th>
                    <th>예약상태</th>
                    <th class="departure-column">출발지/출발날짜/시간</th>
                    <th>목적지/도착날짜/시간</th>
                    <th>여권번호</th>
                    <th>좌석 등급</th>
                    <th></th>
                </tr>
            </thead>    
            <tbody>
                <c:forEach var="reservation" items="${reservationList}">   
                    <tr>
                        <td><input type="checkbox" checked></td>
                        <td>${reservation.name}</td>
                        <td>${reservation.reservation}</td> <!-- 예약번호 -->
                        <td>예약</td> <!-- 예약상태는 예약으로 고정 -->
                        <td>
                           ${reservation.departure}/ 
                           <fmt:formatDate value="${reservation.departure_date}" pattern="yyyy-MM-dd HH:mm"/>
                        </td> <!-- 출발지/출발날짜/시간 -->
                        <td>
                          ${reservation.arrival}/
                          <fmt:formatDate value="${reservation.arrival_date}" pattern="yyyy-MM-dd HH:mm"/>
                        </td> <!-- 목적지/도착날짜/시간 -->
                        <td>${reservation.passport_number}</td> <!-- 여권번호 -->
                        <td>${reservation.seat_class}</td> <!-- 좌석 등급 -->
                        <td>
                            <!-- 상세 버튼 -->
                            <button class="details-button" data-toggle="modal" data-target="#detailsModal${reservation.reservation}">상세</button>
                        </td> <!-- 상세 버튼 -->
                    </tr>
                 
                    <!-- 모달 창 시작 -->
                    <div class="modal fade" id="detailsModal${reservation.reservation}" tabindex="-1" role="dialog" aria-labelledby="detailsModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="detailsModalLabel">예약 상세 정보</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <!-- 상세 정보 폼 시작 -->
                                    <form id="form${reservation.reservation}" action="" method="post">
                                        <input type="hidden" name="reservation" value="${reservation.reservation}">
                                        <div class="form-group">
                                            <label>이름:</label>
                                            <input type="text" name="name" class="form-control" value="${reservation.name}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>출발지:</label>
                                            <input type="text" name="departure" class="form-control" value="${reservation.departure}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>출발 날짜/시간:</label>
                                            <input type="datetime-local" class="form-control" name="departure_dateStr" value="${reservation.departure_date}">
                                        </div>
                                        <div class="form-group">
                                            <label>도착지:</label>
                                            <input type="text" name="arrival" class="form-control" value="${reservation.arrival}">
                                        </div>
                                        <div class="form-group">
                                            <label>도착 날짜/시간:</label>
                                            <input type="datetime-local" class="form-control" name="arrival_dateStr" value="${reservation.arrival_date}">
                                        </div>
                                        <div class="form-group">
                                            <label>좌석 등급:</label>
                                           <select class="form-control" name="seat_class">
                                                <option value="Economy" <c:if test="${reservation.seat_class == 'Economy'}">selected</c:if>>Economy</option>
                                                <option value="First" <c:if test="${reservation.seat_class == 'First'}">selected</c:if>>First</option>
                                                <option value="Business" <c:if test="${reservation.seat_class == 'Business'}">selected</c:if>>Business</option>
                                            </select>
                                        </div>
                                        <button type="button" class="btn btn-primary" onclick="updateReservation(${reservation.reservation})">업데이트</button>
                                        <button type="button" class="btn btn-danger" onclick="deleteReservation(${reservation.reservation})">삭제</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                    </form>
                                    <!-- 상세 정보 폼 끝 -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 모달 창 끝 -->
                </c:forEach>   
            </tbody>
        </table>
    </div> 
</body>
</html>
