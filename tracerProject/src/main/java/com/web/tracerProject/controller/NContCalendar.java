package com.web.tracerProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.web.tracerProject.service.NSerCalendar;
import com.web.tracerProject.vo.Calendar;

@Controller
public class NContCalendar {
	@Autowired(required=false)
	NSerCalendar service;
	
	// http://localhost:5656/calendar
	@GetMapping("calendar")
	public String calendar() {
		return "tracerPages/calendar";
	}
	@PostMapping("getScheduleCalendarList")
	public ResponseEntity<List<Calendar>> getSchduleCalendarList() {
		return ResponseEntity.ok(service.getScheduleCalendarList());
	}
	@PostMapping("getTaskCalendarList")
	public ResponseEntity<List<Calendar>> getTaskCalendarList() {
		return ResponseEntity.ok(service.getTaskCalendarList());
	}
}
