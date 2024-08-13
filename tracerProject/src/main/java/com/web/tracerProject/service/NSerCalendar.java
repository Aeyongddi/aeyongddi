package com.web.tracerProject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.NDaoCalendar;
import com.web.tracerProject.vo.Calendar;

@Service
public class NSerCalendar {
	@Autowired(required=false)
	NDaoCalendar dao;
	
	public List<Calendar> getScheduleCalendarList(){
		return dao.getScheduleCalendarList();
	}
	public Map<String, Object> insScheduleCalendar(Calendar ins) {
		Map<String, Object> response = new HashMap<>();
		response.put("msg", dao.insScheduleCalendar(ins)>0?"등록성공":"등록실패");
		response.put("res", dao.getScheduleCalendarList());
		return response;
	}
	public Map<String, Object> uptScheduleCalendar(Calendar upt) {
		Map<String, Object> response = new HashMap<>();
		response.put("msg", dao.uptScheduleCalendar(upt)>0?"수정성공":"수정실패");
		response.put("res", dao.getScheduleCalendarList());
		return response;
	}
	public Map<String, Object> delScheduleCalendar(String id) {
		Map<String, Object> response = new HashMap<>();
		response.put("msg", dao.delScheduleCalendar(id)>0?"삭제성공":"삭제실패");
		response.put("res", dao.getScheduleCalendarList());
		return response;
	}
}
