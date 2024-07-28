package com.web.tracerProject.controller;

import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;

import com.web.tracerProject.service.JSerMain;
import com.web.tracerProject.vo.Project;
import com.web.tracerProject.vo.ProjectProgress;
import com.web.tracerProject.vo.ResourceManage;
import com.web.tracerProject.vo.Task;
import com.web.tracerProject.vo.User_info;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class JContMain {
    @Autowired(required = false)
    private JSerMain service;
    @Autowired(required = false)
    private HttpSession session;
    @Autowired
    private LocaleResolver localeResolver;

    @PostMapping("/index")
    public String main(Model d, Task task, User_info user_info, HttpServletRequest request, HttpServletResponse response) {
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

            // 로그인 시 로케일 설정
            localeResolver.setLocale(request, response, Locale.KOREAN);
            
            return "tracerPages/index";
        } else {
            d.addAttribute("loginFailed", 1);
            return "tracerPages/login";
        }
    }

    @GetMapping("/index")
    public String index(Model d, Task task, User_info user_info, HttpServletRequest request) {
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
        List<Project> projectList = service.getProjectList();
        d.addAttribute("projectList", projectList);

        d.addAttribute("user_info", (User_info) session.getAttribute("info"));

        // 페이지 로딩 시 로케일 설정
        String lang = request.getParameter("lang");
        if (lang != null) {
            Locale locale;
            if ("ko".equals(lang)) {
                locale = Locale.KOREAN;
            } else if ("en".equals(lang)) {
                locale = Locale.ENGLISH;
            } else {
                locale = new Locale(lang); // 여전히 Locale 생성자를 사용할 수 있습니다.
            }
            localeResolver.setLocale(request, null, locale);
        }

        return "tracerPages/index";
    }

    @GetMapping("/getBudget")
    @ResponseBody
    public ResourceManage getBudget(@RequestParam("pid") String pid) {
        return service.getBudget(pid);
    }

}
