package com.web.tracerProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.NDaoGantt;
import com.web.tracerProject.vo.Gantt;
import com.web.tracerProject.vo.Schedule;
import com.web.tracerProject.vo.Task;

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
	
	public List<String> getUsers(){ 
		return dao.getUsers();
	}
	
	public String insGanttSchedule(Schedule schedule) {
		return dao.insGanttSchedule(schedule)>0?"일정등록성공":"일정등록실패";
	}
	public String insGanttTask(Task task) {
		return dao.insGanttTask(task)>0?"업무등록성공":"업무등록실패";
	}
	public String uptGanttSchedule(Schedule schedule) {
		return dao.uptGanttSchedule(schedule)>0?"일정수정성공":"일정수정실패";
	}
	public String uptGanttTask(Task task) {
		return dao.uptGanttTask(task)>0?"업무수정성공":"업무수정실패";
	}
	public String delGanttSchedule(String sid) {
		return dao.delGanttSchedule(sid)>0?"일정삭제성공":"일정삭제실패";
	}
	public String delGanttTask(String tkid) {
		return dao.delGanttTask(tkid)>0?"업무삭제성공":"업무삭제실패";
	}
}
