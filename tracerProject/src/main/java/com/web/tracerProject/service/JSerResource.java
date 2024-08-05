package com.web.tracerProject.service;

import java.math.BigDecimal;
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

    public void addAssetAndUpdateBudget(String pid, String rtype, String software_name, String license_purchase_date, String license_expiry_date, BigDecimal software_price) {
        String rid = dao.generateRid();
        dao.addAsset(rid, pid, rtype, software_name, license_purchase_date, license_expiry_date, software_price);
        dao.increaseUsedBudget(pid, software_price);
    }

}
