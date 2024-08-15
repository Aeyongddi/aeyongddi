package com.web.tracerProject.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.tracerProject.service.JSerNewTask;
import com.web.tracerProject.vo.Task;

@Controller
public class JContNewTask {
    @Autowired(required = false)
    private JSerNewTask service;

    @GetMapping("/newTask")
    public String showTaskList(Model model) {
        model.addAttribute("tasks", service.getAllTasks());
        return "tracerPages/newTask";
    }

    @PostMapping("/newTask/add")
    public String addTask(@ModelAttribute Task task) {
        task.setEndYn(false); // 기본적으로 작업 상태는 "진행 중"
        service.addTask(task);
        return "redirect:/newTask";
    }

    @PostMapping("/newTask/update")
    public String updateTask(@ModelAttribute Task task) {
        service.updateTask(task);
        return "redirect:/newTask";
    }

    @PostMapping("/newTask/delete")
    public String deleteTask(@RequestParam("tkid") String tkid) {
        service.deleteTask(tkid);
        return "redirect:/newTask";
    }
    
    @PostMapping("/newTask/updateStatus")
    @ResponseBody
    public Map<String, Object> updateTaskStatus(@RequestBody Task task) {
        Map<String, Object> response = new HashMap<>();
        try {
            service.updateTask(task);
            response.put("success", true);
        } catch (Exception e) {
            response.put("success", false);
        }
        return response;
    }
}
