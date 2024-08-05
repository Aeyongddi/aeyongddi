package com.web.tracerProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.tracerProject.service.JSerResource;
import com.web.tracerProject.vo.Project;
import com.web.tracerProject.vo.ResourceManage;
import com.web.tracerProject.vo.User_info;

import java.math.BigDecimal;
import java.util.List;

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
        // Add the asset and update the budget
        service.addAssetAndUpdateBudget(pid, rtype, software_name, license_purchase_date, license_expiry_date, software_price);
        return "Asset added and budget updated successfully";
    }
}
