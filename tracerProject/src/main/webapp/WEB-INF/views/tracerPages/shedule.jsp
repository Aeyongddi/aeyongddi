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
<title>캘린더</title>

<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<style>
body {
   margin: 40px 10px;
   padding: 0;
   font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
   font-size: 14px;
}

#calendar {
   max-width: 900px;
   margin: 0 auto;
}

.input-group-text {
   width: 100%;
   background-color: #f8f9fa;
   color: #495057;
   font-weight: bold;
}

.input-group-prepend {
   width: 30%;
}

.modal-dialog {
   max-width: 500px; /* 모달 너비 조정 */
   margin: 1.75rem auto; /* 상하 여백 조정 */
}

.modal-content {
   border-radius: 8px;
   padding: 1rem; /* 내부 여백 조정 */
}

.modal-header {
   background-color: #007bff;
   color: white;
   border-bottom: 1px solid #ddd;
}

.modal-title {
   margin: 0;
}

.modal-body {
   padding: 1rem; /* 내부 여백 조정 */
}

.modal-footer {
   border-top: 1px solid #ddd;
   padding: 0.75rem; /* 내부 여백 조정 */
}

.btn-custom {
   background-color: #007bff;
   color: white;
   border: none;
}

.btn-custom:hover {
   background-color: #0056b3;
}

.form-control:focus {
   border-color: #007bff;
   box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
}

.datepicker-container {
   position: relative;
}

.datepicker-container input {
   padding-right: 30px; /* 아이콘 여백 추가 */
}

.datepicker-icon {
   position: absolute;
   top: 50%;
   right: 10px;
   transform: translateY(-50%);
   cursor: pointer;
}
</style>

<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
<!-- 한국어 로케일 -->

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src='${path}/a00_com/dist/index.global.js'></script>
<script type="text/javascript">
   var calendar;
   document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
      var today = new Date();
      var todayTitle = today.toISOString().split("T")[0];
      calendar = new FullCalendar.Calendar(calendarEl, {
         headerToolbar : {
            left : 'prev,next today',
            center : 'title',
            right : 'dayGridMonth,timeGridWeek,timeGridDay'
         },
         initialDate : todayTitle,
         navLinks : true,
         selectable : true,
         selectMirror : true,
         select : function(arg) {
            $("#showModel").click();
            $("#modalTitle").text("일정등록");
            $("#regBtn").show();
            $("#uptBtn").hide();
            $("#delBtn").hide();
            addForm(arg, "I");
         },
         eventClick : function(arg) {
            $("#modalTitle").text("일정상세");
            $("#showModel").click();
            $("#regBtn").hide();
            $("#uptBtn").show();
            $("#delBtn").show();
            addForm(arg.event);
         },
         editable : true,
         dayMaxEvents : true,
         events : function(info, successCallback, failureCallback) {
            $.ajax({
               url : "Schedule",
               dataType : "json",
               success : function(data) {
                  calendar.removeAllEvents();
                  successCallback(data);
               },
               error : function(err) {
                  failureCallback(err);
               }
            });
         }
      });
      calendar.render();

      $("#regBtn").click(function() {
         var schedule = {
            title : $("[name='title']").val(),
            start_date : $("[name='start_date']").val(),
            end_date : $("[name='end_date']").val(),
            description : $("[name='description']").val(),
            email : $("[name='email']").val(),
            pid : $("[name='pid']").val(),
         
         };

         $.ajax({
            type : "POST",
            url : "InsertSchedule",
            contentType : "application/json",
            data : JSON.stringify(schedule),
            success : function(response) {
               alert(response);
               calendar.refetchEvents();
               $("#clsBtn").click();
            },
            error : function(err) {
               alert("등록 실패: " + err.responseText);
            }
         });
      });

      function addForm(event, proc) {
         $("form")[0].reset();
         if (proc != "I") {
            $("[name='id']").val(event.id);
            $("[name='backgroundColor']").val(event.backgroundColor);
            $("[name='textColor']").val(event.textColor);
            $("[name='writer']").val(event.extendedProps.writer);
            $("[name='content']").val(event.extendedProps.content);
            $("[name='urlLink']").val(event.extendedProps.urlLink);
         }
         $("[name='title']").val(event.title);
         $("[name='start_date']").val(event.startStr);
         $("[name='end_date']").val(
               event.end ? event.endStr : event.startStr);
         $("[name='endYN']").val(event.extendedProps.endYN ? 1 : 0);
      }

      flatpickr("#start_date", {
         dateFormat : 'Y-m-d',
         locale : "ko"
      });

      flatpickr("#end_date", {
         dateFormat : 'Y-m-d',
         locale : "ko"
      });
   });
</script>
</head>
<body>
   <input type="date" placeholder="출발날짜" name="departure_dateStr" value=""
      class="form-control mr-sm-2" />
   <div id='calendar'></div>

   <div id="showModel" data-toggle="modal" data-target="#calModal"></div>

   <div class="modal fade" id="calModal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="modalTitle">타이틀</h5>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form id="frm02" class="form" method="post">
                  <input type="hidden" name="id" value="0" />
                  <div class="form-group">
                     <label for="title">일정명</label> <input name="title" id="title"
                        placeholder="일정 입력" class="form-control" />
                  </div>
                  <div class="form-group">
                     <label for="email">사용자 이메일</label> <input name="email" id="email"
                        placeholder="작성자 입력" class="form-control" />
                  </div>
                  <div class="form-group datepicker-container">
                     <label for="start_date">시작(일/시)</label> <input id="start_date"
                        class="form-control" /> <img
                        src="${path}/a00_com/calendar-icon.png" class="datepicker-icon"
                        id="start_date_icon" alt="달력 아이콘" /> <input name="start_date"
                        type="hidden" />
                  </div>
                  <div class="form-group datepicker-container">
                     <label for="end_date">종료(일/시)</label> <input id="end_date"
                        class="form-control" /> <img
                        src="${path}/a00_com/calendar-icon.png" class="datepicker-icon"
                        id="end_date_icon" alt="달력 아이콘" /> <input name="end_date"
                        type="hidden" />
                  </div>
                  <div class="form-group">
                     <label for="description">내용</label>
                     <textarea name="description" id="description" rows="2"
                        class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                     <label for="endYN">진행 상황</label> <select name="endYN" id="endYN"
                        class="form-control">
                        <option value="0">진행중</option>
                        <option value="1">완료</option>
                     </select>
                  </div>
                  <div class="form-group">
                     <label for="pid">프로젝트 ID</label> <input name="pid" id="pid"
                        placeholder="프로젝트 ID 입력" class="form-control" />
                  </div>
               </form>
            </div>
            <div class="modal-footer">
               <button id="regBtn" type="button" class="btn btn-custom">등록</button>
               <button id="uptBtn" type="button" class="btn btn-info"
                  style="display: none;">수정</button>
               <button id="delBtn" type="button" class="btn btn-danger"
                  style="display: none;">삭제</button>
               <button id="clsBtn" type="button" class="btn btn-secondary"
                  data-dismiss="modal">창닫기</button>
            </div>
         </div>
      </div>
   </div>
</body>
