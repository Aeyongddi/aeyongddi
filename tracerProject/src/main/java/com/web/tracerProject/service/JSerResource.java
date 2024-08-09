package com.web.tracerProject.service;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
        ResourceManage budget = dao.getBudget(pid);
        if (budget != null) {
            BigDecimal remainingBudget = budget.getAssigned_budget().subtract(budget.getUsed_budget());
            budget.setRemainingBudget(remainingBudget); // ResourceManage 객체에 남은 예산 필드를 추가했다고 가정
        }
        return budget;
    }


    public List<Project> getAllProjects() {
        return dao.getAllProjects();
    }

    public List<ResourceManage> getAllAssets() {
        return dao.getAllAssets();
    }

    public void addBudget(String pid, BigDecimal amount) {
        dao.addBudget(pid, amount);
    }

    public void reduceBudget(String pid, BigDecimal amount) {
        dao.reduceBudget(pid, amount);
    }

    public void assignBudget(String pid, BigDecimal amount) {
        Integer maxRid = dao.getMaxRid();
        String newRid = String.format("R%03d", (maxRid == null ? 1 : maxRid + 1));
        dao.assignBudget(newRid, pid, amount);
    }

    public ResourceManage addAssetAndUpdateBudget(String pid, String rtype, String software_name, String license_purchase_date, String license_expiry_date, BigDecimal software_price) {
        Integer maxRid = dao.getMaxRid();
        String newRid = String.format("R%03d", (maxRid == null ? 1 : maxRid + 1));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            ResourceManage asset = new ResourceManage(newRid, pid, rtype, software_name, sdf.parse(license_purchase_date), sdf.parse(license_expiry_date), software_price);
            dao.addAsset(asset);

            // 사용 예산 업데이트
            dao.updateUsedBudget(pid, software_price);

            return asset;
        } catch (ParseException e) {
            throw new RuntimeException("날짜 형식 변환 오류", e);
        }
    }

    public void addUser(User_info user) {
        dao.addUser(user);
    }

    public User_info getUserByEmail(String email) {
        return dao.getUserByEmail(email);
    }

    public void updateUser(User_info user) {
        dao.updateUser(user);
    }

    public void deleteUser(String email) {
        dao.deleteUser(email);
    }
    
    public List<Project> getProjectsWithNoAssignedBudget() {
        return dao.getProjectsWithNoAssignedBudget();
    }
}
