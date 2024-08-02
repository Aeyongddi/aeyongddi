package com.web.tracerProject.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.tracerProject.service.G_Service_TASK;
import com.web.tracerProject.vo.Task;

@Controller
public class G_Controller_Task {
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }	
    @Autowired(required = false)
    private G_Service_TASK service;
   
    // http://localhost:5656/taskList
    @GetMapping("/taskList")
    public String taskList(Task sch, Model d) {
        List<Task> taskList = service.getTaskList(sch);
        d.addAttribute("taskList", taskList);
        return "tracerPages/tkid"; 
    }
    @PostMapping("/taskListInsert")
    @ResponseBody
    public ResponseEntity<String> taskInsert(@RequestBody Task ins) {
        System.out.println("Received Task: " + ins);
        int result = service.insertTask(ins);

        return ResponseEntity.ok(result > 0 ? "등록성공" : "등록실패");
    }

   

    @PostMapping("/taskDelete")
    public String taskDelete(@RequestBody Map<String, List<String>> payload, Model model) {
        List<String> tkids = payload.get("ids");
        if (tkids == null || tkids.isEmpty()) {
            model.addAttribute("msg", "삭제할 항목이 없습니다.");
            model.addAttribute("proc", "삭제 실패");
            return "tracerPages/tkid";
        }

        int result = service.deleteTasks(tkids);
        model.addAttribute("msg", result > 0 ? "삭제 성공" : "삭제 실패");
        model.addAttribute("proc", "삭제");
        return "tracerPages/tkid";
    }

    @PostMapping("/updateTaskStatus")
    public ResponseEntity<String> updateTaskStatus(@RequestBody Map<String, Object> payload) {
        String tkid = (String) payload.get("tkid");
        boolean isend = (Boolean) payload.get("isend");

        int result = service.updateTaskStatus(tkid, isend);

        if (result > 0) {
            return ResponseEntity.ok("Status updated successfully");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to update status");
        }
    }
}
