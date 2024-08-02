package com.web.tracerProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.JDaoResource;
import com.web.tracerProject.vo.Project;
import com.web.tracerProject.vo.ResourceManage;
import com.web.tracerProject.vo.User_info;

@Service
public class JSerResource {
    @Autowired(required = false)
    private JDaoResource dao;

    public List<User_info> getAllUsersInfo() {
        List<User_info> users = dao.getAllUsersInfo();
        for (User_info user : users) {
            user.setTeams(dao.getTeamsByEmail(user.getEmail()));
            user.setProjects(dao.getProjectsByEmail(user.getEmail()));
        }
        return users;
    }

    public ResourceManage getBudget(String pid) {
        return dao.getBudget(pid);
    }

    public List<Project> getAllProjects() {
        return dao.getAllProjects();
    }
    public List<ResourceManage> getAllAssets() {
        return dao.getAllAssets();
    }
}

