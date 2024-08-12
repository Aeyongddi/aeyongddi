package com.web.tracerProject.service;

import java.util.List;

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
	public List<Calendar> getTaskCalendarList(){
		return dao.getTaskCalendarList();
	}
}
