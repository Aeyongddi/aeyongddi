package com.web.tracerProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.NDaoGantt;
import com.web.tracerProject.vo.Gantt;

@Service
public class NSerGantt {
	@Autowired(required=false)
	NDaoGantt dao;
	
	public List<Gantt> getGanttSchedule() {
		return dao.getGanttSchedule();
	}
	public List<Gantt> getGanttTask() {
		return dao.getGanttTask();
	}
	
	public List<Gantt> getUsers(){
		return dao.getUsers();
	}
}
