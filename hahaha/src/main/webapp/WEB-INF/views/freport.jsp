<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAE - 재무 제표 조회</title>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<jsp:include page="header.jsp" />
<style>
td {
    text-align: center;
}
</style>
</head>
<body>
    <div class="jumbotron text-center">
        <h2>재무 제표 조회</h2>
    </div>
    <div class="container">
        <form id="frm01" class="form" method="post">
            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                <button type="button" class="btn btn-success" id="registerButton">등록하기</button>
                <p class="text-white" style="margin-left: 75%; margin-top: 20px;">단위:
                    억 원</p>
            </nav>
        </form>
        <table class="table table-hover table-striped">
            <thead>
                <tr class="table-success text-center">
                    <th>분기</th>
                    <th>기간</th>
                    <th>총 수익</th>
                    <th>총 지출</th>
                    <th>순수익</th>
                    <th>보유 자산</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="totalRevenue" value="0" />
                <c:set var="totalExpense" value="0" />
                <c:set var="totalNetProfit" value="0" />
                <c:set var="totalBalance" value="0" />
                <c:forEach var="fin" items="${finList}">
                    <tr class="financial-row" data-report-id="${fin.report_id}">
                        <td>${fin.report_id }</td>
                        <td>${fin.report_period }</td>
                        <td><fmt:formatNumber value="${fin.total_revenue }"
                                pattern="#,###" /></td>
                        <td><fmt:formatNumber value="${fin.total_expense }"
                                pattern="#,###" /></td>
                        <td><fmt:formatNumber value="${fin.net_profit }"
                                pattern="#,###" /></td>
                        <td><fmt:formatNumber value="${fin.balance }" pattern="#,###" /></td>
                    </tr>
                    <c:set var="totalRevenue" value="${totalRevenue + fin.total_revenue}" />
                    <c:set var="totalExpense" value="${totalExpense + fin.total_expense}" />
                    <c:set var="totalNetProfit" value="${totalNetProfit + fin.net_profit}" />
                    <c:set var="totalBalance" value="${totalBalance + fin.balance}" />
                </c:forEach>
                <tr class="table-info text-center">
                    <td colspan="2"><strong>총합</strong></td>
                    <td><fmt:formatNumber value="${totalRevenue}" pattern="#,###" /></td>
                    <td><fmt:formatNumber value="${totalExpense}" pattern="#,###" /></td>
                    <td><fmt:formatNumber value="${totalNetProfit}" pattern="#,###" /></td>
                    <td><fmt:formatNumber value="${totalBalance}" pattern="#,###" /></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 모달 창 -->
    <div class="modal fade" id="registerFinancialModal" tabindex="-1" role="dialog"
        aria-labelledby="registerFinancialModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="registerFinancialModalLabel">새 재무 제표 등록</h5>
                    <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="registerForm">
                        <div class="form-group">
                            <label for="report_id">분기</label>
                            <input type="text" class="form-control" id="report_id" name="report_id" required>
                        </div>
                        <div class="form-group">
                            <label for="report_period">기간</label>
                            <input type="text" class="form-control" id="report_period" name="report_period" required>
                        </div>
                        <div class="form-group">
                            <label for="total_revenue">총 수익</label>
                            <input type="number" class="form-control" id="total_revenue" name="total_revenue" required>
                        </div>
                        <div class="form-group">
                            <label for="total_expense">총 지출</label>
                            <input type="number" class="form-control" id="total_expense" name="total_expense" required>
                        </div>
                        <div class="form-group">
                            <label for="net_profit">순수익</label>
                            <input type="number" class="form-control" id="net_profit" name="net_profit" required>
                        </div>
                        <div class="form-group">
                            <label for="balance">보유 자산</label>
                            <input type="number" class="form-control" id="balance" name="balance" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" id="saveFinancialReportBtn">저장하기</button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {
            // 등록하기 버튼 클릭 시 모달 창 열기
            $("#registerButton").click(function() {
                $('#registerFinancialModal').modal('show');
            });

            // 저장하기 버튼 클릭 시 폼 데이터 전송
            $("#saveFinancialReportBtn").click(function() {
                var formData = $("#registerForm").serialize();
                $.ajax({
                    url: "${path}/insertFinanc.do",
                    method: "POST",
                    dataType: "json",
                    data: formData,
                    success: function(response) {
                        alert(response.msg);
                        if (response.msg === '등록성공') {
                            location.reload(); // 성공 시 페이지 새로고침
                        }
                    },
                    error: function() {
                        alert("데이터를 저장하는 중 오류가 발생했습니다.");
                    }
                });
            });
        });
    </script>
</body>
</html>
