package com.web.tracerProject.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.tracerProject.service.G_Service_SCHEDULE;
import com.web.tracerProject.vo.Schedule;

@Controller
public class G_Controller_Schedule {
	@Autowired(required = false)
	private G_Service_SCHEDULE service;

	// http://localhost:5656/Schedule
	@GetMapping("/Schedule")
	public String Schedule(Schedule sch, Model d) {
		List<Schedule> Schedule = service.getSchedule(sch);
		d.addAttribute("Schedule", Schedule);
		return "tracerPages/shedule";
	}


	@PostMapping("/InsertSchedule")
	@ResponseBody
	public ResponseEntity<String> insertSchedule(@RequestBody Schedule schedule) {
	    try {
	        // 기본값 설정
	        if (schedule.getStart_date() == null) {
	            schedule.setStart_date(new Date());
	        }
	        if (schedule.getEnd_date() == null) {
	            schedule.setEnd_date(new Date());
	        }
	        if (schedule.getTitle() == null) {
	            schedule.setTitle("");
	        }
	        if (schedule.getDescription() == null) {
	            schedule.setDescription("");
	        }
	        if (schedule.getEmail() == null) {
	            schedule.setEmail("");
	        }
	        
	        int result = service.insertSchedule(schedule);
	        return result > 0 ? ResponseEntity.ok("등록 성공")
	                          : ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("등록 실패");
	    } catch (Exception e) {
	        e.printStackTrace(); // Log stack trace to server logs
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("등록 실패: " + e.getMessage());
	    }
	}
	
//	@PutMapping("/UpdateScheduleStatus")
//    public ResponseEntity<String> updateScheduleStatus(@RequestParam("sid") String sid,
//                                                        @RequestParam("endYN") boolean endYN) {
//        try {
//            int result = service.updateScheduleStatus(sid, endYN);
//            return result > 0 ? ResponseEntity.ok("상태 업데이트 성공")
//                              : ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("상태 업데이트 실패");
//        } catch (Exception e) {
//            e.printStackTrace(); // Log stack trace to server logs
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("상태 업데이트 실패: " + e.getMessage());
//        }
//    }
	// 삭제하는 코드 shedule Shedule
//	@PostMapping("/sheduleDelete")
//	public String sheduleDelete(@RequestParam("sid") String sid, Model d) {
//	    int result = service.deleteSchedule(sid);
//	    d.addAttribute("msg", result > 0 ? "삭제 성공" : "삭제 실패");
//	    d.addAttribute("proc", "삭제");
//	    return "tracerPages/shedule"; 
//	}
    
    // endYN boolean 값 DB에 바로 적용하는 코드
//	@PostMapping("/updateTaskStatus")
//	public ResponseEntity<String> updateTaskStatus(@RequestBody Map<String, Object> payload) {
//		String tkid = (String) payload.get("tkid");
//		boolean endYN = (Boolean) payload.get("endYN");
//
//		int result = service.updateTaskStatus(tkid, endYN);
//
//		if (result > 0) {
//			return ResponseEntity.ok("Status updated successfully");
//		} else {
//			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to update status");
//		}
//	}
	
	// 작업 수정
//    @PostMapping("/updateSchedule")
//    @ResponseBody
//    public ResponseEntity<String> updateSchedule(@RequestBody Schedule upt) {
//        int result = service.updateSchedule(upt);
//        return result > 0
//            ? ResponseEntity.ok("업데이트 성공")
//            : ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("업데이트 실패");
//    }
}
