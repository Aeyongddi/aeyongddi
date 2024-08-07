package com.web.tracerProject.controller;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.tracerProject.service.JSerResource;
import com.web.tracerProject.vo.Project;
import com.web.tracerProject.vo.ResourceManage;
import com.web.tracerProject.vo.User_info;

@Controller
public class JContResource {
    @Autowired(required = false)
    private JSerResource service;

    @GetMapping("/resource")
    public String resource(Model model) {
        List<User_info> userInfoList = service.getAllUsersInfo();
        model.addAttribute("userInfoList", userInfoList);

        List<Project> projectList = service.getAllProjects();
        model.addAttribute("projectList", projectList);

        List<ResourceManage> assetList = service.getAllAssets();
        model.addAttribute("assetList", assetList);

        List<Project> projectsWithNoBudget = service.getProjectsWithNoBudget();
        model.addAttribute("projectsWithNoBudget", projectsWithNoBudget);

        // JSON 형식으로 데이터 변환
        ObjectMapper mapper = new ObjectMapper();
        try {
            String userInfoListJson = mapper.writeValueAsString(userInfoList);
            model.addAttribute("userInfoListJson", userInfoListJson);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return "tracerPages/resource";
    }

    @PostMapping("/addUser")
    @ResponseBody
    public User_info addUser(@RequestBody Map<String, String> request) {
        User_info user = new User_info();
        user.setName(request.get("name"));
        user.setEmail(request.get("email"));
        user.setBirth(Date.valueOf(request.get("birth")));
        user.setPhone(request.get("phone"));
        user.setNickname(request.get("nickname"));
        user.setPassword(request.get("password"));
        service.addUser(user);
        return user;
    }

    @PostMapping("/updateUser")
    @ResponseBody
    public User_info updateUser(@RequestBody Map<String, String> request) {
        User_info user = service.getUserByEmail(request.get("email"));
        if (user == null) {
            throw new RuntimeException("사용자를 찾을 수 없습니다.");
        }
        user.setName(request.get("name"));
        user.setBirth(Date.valueOf(request.get("birth")));
        user.setPhone(request.get("phone"));
        user.setNickname(request.get("nickname"));
        if (request.get("password") != null && !request.get("password").isEmpty()) {
            user.setPassword(request.get("password"));
        }
        service.updateUser(user);
        return user;
    }

    @PostMapping("/deleteUser")
    @ResponseBody
    public String deleteUser(@RequestBody Map<String, String> request) {
        String email = request.get("email");
        try {
            service.deleteUser(email);
            return "사용자가 삭제되었습니다.";
        } catch (Exception e) {
            return "사용자 삭제 실패: " + e.getMessage();
        }
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
