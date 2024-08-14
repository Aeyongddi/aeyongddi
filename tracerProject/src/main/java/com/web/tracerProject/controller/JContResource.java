package com.web.tracerProject.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.tracerProject.service.JSerResource;
import com.web.tracerProject.vo.Project;
import com.web.tracerProject.vo.ResourceManage;
import com.web.tracerProject.vo.User_info;

@Controller
public class JContResource {

    @Autowired(required = false)
    private JSerResource service;

    @GetMapping("/hrManagement")
    @ResponseBody
    public List<User_info> userManagement() {
        return service.getAllUsersInfo();
    }

    @PostMapping("/addUser")
    @ResponseBody
    public User_info addUser(@RequestBody User_info user) {
        service.addUser(user);
        return user;
    }

    @PostMapping("/updateUser")
    @ResponseBody
    public User_info updateUser(@RequestBody User_info user) {
        service.updateUser(user);
        return user;
    }

    @PostMapping("/deleteUser")
    @ResponseBody
    public String deleteUser(@RequestParam("email") String email) {
        service.deleteUser(email);
        return "사용자가 삭제되었습니다.";
    }

    @GetMapping("/resource")
    public String resource(Model model) {
        List<Project> projectList = service.getAllProjects();
        model.addAttribute("projectList", projectList);

        List<ResourceManage> assetList = service.getAllAssets();
        model.addAttribute("assetList", assetList);

        List<Project> projectsWithNoAssignedBudget = service.getProjectsWithNoAssignedBudget();
        model.addAttribute("projectsWithNoAssignedBudget", projectsWithNoAssignedBudget);

        return "tracerPages/resource";
    }

    @GetMapping("/getBudget")
    @ResponseBody
    public ResourceManage getBudget(@RequestParam("pid") String pid) {
        return service.getBudget(pid);
    }

    @PostMapping("/addAsset")
    @ResponseBody
    public String addAsset(@RequestParam String pid,
                           @RequestParam String rtype,
                           @RequestParam String software_name,
                           @RequestParam String license_purchase_date,
                           @RequestParam String license_expiry_date,
                           @RequestParam BigDecimal software_price) {
        try {
            service.addAssetAndUpdateBudget(pid, rtype, software_name, license_purchase_date, license_expiry_date, software_price);
            return "성공적으로 자산이 추가되었습니다.";
        } catch (Exception e) {
            return "자산 추가 실패: " + e.getMessage();
        }
    }

    @PostMapping("/addBudget")
    @ResponseBody
    public String addBudget(@RequestParam String pid, @RequestParam BigDecimal amount) {
        try {
            service.addBudget(pid, amount);
            return "예산 추가 성공";
        } catch (Exception e) {
            return "예산 추가 실패: " + e.getMessage();
        }
    }

    @PostMapping("/reduceBudget")
    @ResponseBody
    public String reduceBudget(@RequestParam String pid, @RequestParam BigDecimal amount) {
        try {
            service.reduceBudget(pid, amount);
            return "예산 삭감 성공";
        } catch (Exception e) {
            return "예산 삭감 실패: " + e.getMessage();
        }
    }

    @PostMapping("/assignBudget")
    @ResponseBody
    public String assignBudget(@RequestParam String pid, @RequestParam BigDecimal amount) {
        try {
            service.assignBudget(pid, amount);
            return "새 프로젝트 예산 부여 성공";
        } catch (Exception e) {
            return "새 프로젝트 예산 부여 실패: " + e.getMessage();
        }
    }
}
