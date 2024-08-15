package com.web.tracerProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.web.tracerProject.service.JSerNewAppro;
import com.web.tracerProject.vo.Approval;

import java.util.List;

@Controller
public class JContNewAppro {
    @Autowired(required = false)
    private JSerNewAppro service;

    @GetMapping("/newApproval")
    public String showApprovalList(Model model) {
        // 서비스에서 결재 리스트 가져오기
        List<Approval> approvals = service.getAllApprovals();
        model.addAttribute("approvals", approvals);
        // JSP 경로 설정
        return "tracerPages/newApproval";
    }

    @PostMapping("/approval/updateStatus")
    public String updateApprovalStatus(@ModelAttribute Approval approval) {
        // 서비스에서 결재 상태 업데이트
        service.updateApprovalStatus(approval);
        return "redirect:/newApproval";
    }
}
