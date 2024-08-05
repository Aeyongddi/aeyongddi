package com.web.tracerProject.service;

import java.math.BigDecimal;
import java.sql.Date;
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

    public ResourceManage addAssetAndUpdateBudget(String pid, String rtype, String software_name, String license_purchase_date, String license_expiry_date, BigDecimal software_price) {
        int nextVal = dao.getNextRid();
        String rid = String.format("R%03d", nextVal);
        Date purchaseDate = Date.valueOf(license_purchase_date);
        Date expiryDate = Date.valueOf(license_expiry_date);
        ResourceManage asset = new ResourceManage(rid, rtype, null, null, software_name, purchaseDate, expiryDate, software_price, pid);
        dao.addAsset(asset);
        dao.increaseUsedBudget(pid, software_price);
        return asset;
    }
}
