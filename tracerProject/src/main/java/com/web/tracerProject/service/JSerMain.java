package com.web.tracerProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.JDaoMain;
import com.web.tracerProject.vo.Task;

@Service
public class JSerMain {
	@Autowired(required=false)
	private JDaoMain dao;
	
	public int getTodayDo(Task task) {
		return dao.getTodayDo(task);
	}
	
	public int getWeekDo(Task task) {
		return dao.getWeekDo(task);
	}
	
}
