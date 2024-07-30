package com.web.tracerProject.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.JDaoMain;
import com.web.tracerProject.vo.Project;
import com.web.tracerProject.vo.ProjectProgress;
import com.web.tracerProject.vo.ResourceManage;
import com.web.tracerProject.vo.Task;
import com.web.tracerProject.vo.User_info;

@Service
public class JSerMain {
    @Autowired(required = false)
    private JDaoMain dao;

    public int getTodayDo(Task task) {
        return dao.getTodayDo(task);
    }

    public int getWeekDo(Task task) {
        return dao.getWeekDo(task);
    }

    public Date getDueto(Task task) {
        return dao.getDueto(task);
    }

    public String getDday(Task task) {
        return dao.getDday(task);
    }

    public int getCountPro(Task task) {
        return dao.getCountPro(task);
    }

    public int getTaskProgress(Task task) {
        return dao.getTaskProgress(task);
    }

    public String isMember(User_info user_info) {
        if (user_info.getEmail() == null)
            user_info.setEmail("");
        if (user_info.getPassword() == null)
            user_info.setPassword("");
        return dao.isMember(user_info) > 0 ? "로그인성공" : "로그인실패";
    }

    public User_info getMember(User_info user_info) {
        return dao.getMember(user_info);
    }
   
    public List<Project> getProjectList() {
        List<Project> projectList = dao.getProjectList();
        return projectList;
    }
    
    public List<ProjectProgress> getProjectProgress() {
        return dao.getProjectProgress();
    }
}
