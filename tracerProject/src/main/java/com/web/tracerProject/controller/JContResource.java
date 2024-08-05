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

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
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

    @PostMapping("/addAsset")
    @ResponseBody
    public Response addAsset(@RequestParam String pid, 
                             @RequestParam String rtype, 
                             @RequestParam String software_name, 
                             @RequestParam String license_purchase_date, 
                             @RequestParam String license_expiry_date, 
                             @RequestParam BigDecimal software_price) {
        System.out.println("Received request to add asset"); // Log
        ResourceManage asset = service.addAssetAndUpdateBudget(pid, rtype, software_name, license_purchase_date, license_expiry_date, software_price);

        // Format dates as strings
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String purchaseDate = sdf.format(asset.getLicense_purchase_date());
        String expiryDate = sdf.format(asset.getLicense_expiry_date());

        // Return formatted response
        return new Response("success", "Asset added and budget updated successfully", asset.getRtype(), asset.getSoftware_name(), purchaseDate, expiryDate, asset.getSoftware_price());
    }


    @GetMapping("/getBudget")
    @ResponseBody
    public ResourceManage getBudget(@RequestParam("pid") String pid) {
        return service.getBudget(pid);
    }
}

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
class Response {
    private String status;
    private String message;
    private String rtype;
    private String software_name;
    private String license_purchase_date;
    private String license_expiry_date;
    private BigDecimal software_price;
}
