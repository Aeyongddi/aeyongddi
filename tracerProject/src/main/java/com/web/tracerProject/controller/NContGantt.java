package com.web.tracerProject.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.tracerProject.service.NSerGantt;
import com.web.tracerProject.vo.Gantt;
import com.web.tracerProject.vo.Schedule;
import com.web.tracerProject.vo.Task;

@Controller
public class NContGantt {
	@Autowired(required=false)
	NSerGantt service;
	
	@GetMapping("timeline")
	public String timeline() {
		return "tracerPages/timeline";
	}
	@PostMapping("timeline")
    public ResponseEntity<Map<String, Object>> getGanttScheduleTask() {
        List<Gantt> ganttSchedule = service.getGanttSchedule();
        List<Gantt> ganttTask = service.getGanttTask();
        
        List<Gantt> ganttData = new ArrayList<>();
        ganttData.addAll(ganttSchedule);
        ganttData.addAll(ganttTask);
        
        Map<String, Object> response = new HashMap<>();
        response.put("data", ganttData);

        return ResponseEntity.ok(response);
    }
	@PostMapping("getUsers")
	public ResponseEntity<List<String>> getUsers() {
		return ResponseEntity.ok(service.getUsers());
	}
	
	@PostMapping("insSchByGantt")
	public ResponseEntity<String> insSchByGantt(Schedule schedule){
		return ResponseEntity.ok(service.insGanttSchedule(schedule));
	}
	@PostMapping("insTaskByGantt")
	public ResponseEntity<String> insTaskByGantt(Task task){
		return ResponseEntity.ok(service.insGanttTask(task));
	}
	@PostMapping("uptSchByGantt")
	public ResponseEntity<String> uptSchByGantt(Schedule schedule){
		return ResponseEntity.ok(service.uptGanttSchedule(schedule));
	}
	@PostMapping("uptTaskByGantt")
	public ResponseEntity<String> uptTaskByGantt(Task task){
		return ResponseEntity.ok(service.uptGanttTask(task));
	}
	@PostMapping("delSchByGantt")
	public ResponseEntity<String> delSchByGantt(@RequestParam("sid") String sid){
		return ResponseEntity.ok(service.delGanttSchedule(sid));
	}
	@PostMapping("delTaskByGantt")
	public ResponseEntity<String> delTaskByGantt(@RequestParam("tkid") String tkid){
		return ResponseEntity.ok(service.delGanttTask(tkid));
	}
	
	
	
	
}
