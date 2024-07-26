package com.web.tracerProject.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.tracerProject.service.JSerMain;
import com.web.tracerProject.vo.Project;
import com.web.tracerProject.vo.ProjectProgress;
import com.web.tracerProject.vo.ResourceManage;
import com.web.tracerProject.vo.Task;
import com.web.tracerProject.vo.User_info;

import jakarta.servlet.http.HttpSession;

@Controller
public class JContMain {
    @Autowired(required = false)
    private JSerMain service;
    @Autowired(required = false)
    private HttpSession session;

    // http://localhost:5656/login
    
    @PostMapping("/login")
    public String main(Model d, Task task, User_info user_info) {
        int todayDoCount = service.getTodayDo(task);
        d.addAttribute("todayDoCount", todayDoCount);
        int thisWeekDo = service.getWeekDo(task);
        d.addAttribute("thisWeekDo", thisWeekDo);
        Date dueto = service.getDueto(task);
        d.addAttribute("dueto", dueto);
        String dDay = service.getDday(task);
        d.addAttribute("dDay", dDay);
        int countPro = service.getCountPro(task);
        d.addAttribute("countPro", countPro);
        int taskPro = service.getTaskProgress(task);
        d.addAttribute("taskPro", taskPro);
        List<ProjectProgress> projectProgressList = service.getProjectProgress();
        d.addAttribute("projectProgressList", projectProgressList);
        
     // 프로젝트 목록 추가
        List<Project> projectList = service.getProjectList();
        d.addAttribute("projectList", projectList);
        
        if (service.isMember(user_info).equals("로그인성공")) {
            session.setAttribute("info", service.getMember(user_info));
            d.addAttribute("user_info", (User_info) session.getAttribute("info"));
            return "tracerPages/index";
        } else {
            d.addAttribute("loginFailed", 1);
            return "tracerPages/login";
        }
    }

    @GetMapping("/index")
    public String index(Model d, Task task, User_info user_info) {
        int todayDoCount = service.getTodayDo(task);
        d.addAttribute("todayDoCount", todayDoCount);
        int thisWeekDo = service.getWeekDo(task);
        d.addAttribute("thisWeekDo", thisWeekDo);
        Date dueto = service.getDueto(task);
        d.addAttribute("dueto", dueto);
        String dDay = service.getDday(task);
        d.addAttribute("dDay", dDay);
        int countPro = service.getCountPro(task);
        d.addAttribute("countPro", countPro);
        d.addAttribute("user_info", (User_info) session.getAttribute("info"));
        int taskPro = service.getTaskProgress(task);
        d.addAttribute("taskPro", taskPro);
        List<ProjectProgress> projectProgressList = service.getProjectProgress();
        d.addAttribute("projectProgressList", projectProgressList);
        return "tracerPages/index";
    }

    @GetMapping("/getBudget")
    @ResponseBody
    public ResourceManage getBudget(@RequestParam("pid") String pid) {
        return service.getBudget(pid);
    }

}
