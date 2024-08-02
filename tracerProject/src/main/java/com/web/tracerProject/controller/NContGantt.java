package com.web.tracerProject.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.web.tracerProject.service.NSerGantt;
import com.web.tracerProject.vo.Gantt;

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
}
