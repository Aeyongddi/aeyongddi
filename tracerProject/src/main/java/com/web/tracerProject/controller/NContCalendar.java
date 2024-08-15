package com.web.tracerProject.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.tracerProject.service.NSerCalendar;
import com.web.tracerProject.vo.Calendar;

@Controller
public class NContCalendar extends NContBase{
	@Autowired(required=false)
	NSerCalendar service;
	
	// http://localhost:5656/calendar
	@GetMapping("calendar")
	public String calendar() {
		return "tracerPages/calendar";
	}
	@PostMapping("getScheduleCalendarList")
	public ResponseEntity<List<Calendar>> getSchduleCalendarList(){
		return ResponseEntity.ok(service.getScheduleCalendarList());
	}
	@PostMapping("insScheduleCalendar")
	public ResponseEntity<Map<String, Object>> insScheduleCalendar(Calendar ins) {
		Map<String, Object> response = service.insScheduleCalendar(ins);
		return ResponseEntity.ok(response);
	}
	@PostMapping("uptScheduleCalendar")
	public ResponseEntity<Map<String, Object>> uptScheduleCalendar(Calendar upt) {
		Map<String, Object> response = service.uptScheduleCalendar(upt);
		return ResponseEntity.ok(response);
	}
	@PostMapping("delScheduleCalendar")
	public ResponseEntity<Map<String, Object>> delScheduleCalendar(@RequestParam("id")String id) {
		Map<String, Object> response = service.delScheduleCalendar(id);
		return ResponseEntity.ok(response);
	}
}
