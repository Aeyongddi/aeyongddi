package com.web.tracerProject.controller;


import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.tracerProject.service.JSerAppro;
import com.web.tracerProject.vo.Approval;

@Controller
public class JContAppro {

    @Autowired
    private JSerAppro jSerAppro;

    @PostMapping("/requestApproval")
    @ResponseBody
    public String requestApproval(@RequestBody Approval approval) {
        // 기존 결재 상태 확인
        List<Approval> existingApprovals = jSerAppro.getApprovalsByStatus("결재 대기");
        boolean isAlreadyRequested = existingApprovals.stream()
                                      .anyMatch(a -> Objects.equals(a.getEmail(), approval.getEmail()) 
                                                  && Objects.equals(a.getContent(), approval.getContent()));

        if (isAlreadyRequested) {
            return "이미 결재가 요청된 작업입니다.";
        }

        try {
            jSerAppro.requestApproval(approval);
            return "결재 요청이 성공적으로 접수되었습니다.";
        } catch (Exception e) {
            return "결재 요청에 실패했습니다: " + e.getMessage();
        }
    }



    @PostMapping("/updateApprovalStatus")
    @ResponseBody
    public String updateApprovalStatus(@RequestParam("apid") String apid, @RequestParam("status") String status) {
        try {
            jSerAppro.updateApprovalStatus(apid, status);
            return "결재 상태가 업데이트되었습니다.";
        } catch (Exception e) {
            return "결재 상태 업데이트에 실패했습니다: " + e.getMessage();
        }
    }

    @GetMapping("/approval")
    public String approvalPage(Model model) {
        model.addAttribute("allApprovals", jSerAppro.getAllApprovals());
        model.addAttribute("pendingApprovals", jSerAppro.getApprovalsByStatus("결재 대기"));
        model.addAttribute("rejectedApprovals", jSerAppro.getApprovalsByStatus("보류"));
        model.addAttribute("completedApprovals", jSerAppro.getApprovalsByStatus("결재 완료"));
        return "tracerPages/approval";
    }
}

