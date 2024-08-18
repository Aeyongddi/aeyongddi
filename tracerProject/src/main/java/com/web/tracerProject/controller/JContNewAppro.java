package com.web.tracerProject.controller;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.tracerProject.service.JSerNewAppro;
import com.web.tracerProject.vo.Approval;

@Controller
public class JContNewAppro {
    @Autowired(required = false)
    private JSerNewAppro service;

    @GetMapping("/newApproval")
    public String showApprovalList(Model model) {
        List<Approval> approvals = service.getAllApprovals();
        model.addAttribute("approvals", approvals);
        return "tracerPages/newApproval";
    }

    @PostMapping("/approval/updateStatus")
    public String updateApprovalStatus(@ModelAttribute Approval approval) {
        service.updateApprovalStatus(approval);
        return "redirect:/newApproval";
    }
    
    @GetMapping("/downloadFile")
    public ResponseEntity<Resource> downloadFile(@RequestParam("fileName") String fileName) throws IOException {
        String uploadDir = "C:\\Users\\human-07\\git\\aeyongFinal\\tracerProject\\src\\main\\webapp\\WEB-INF\\upload";
        Path filePath = Paths.get(uploadDir).resolve(fileName).normalize();
        Resource resource = new UrlResource(filePath.toUri());

        if (resource.exists() && resource.isReadable()) {
            return ResponseEntity.ok()
                    .contentType(MediaType.APPLICATION_OCTET_STREAM)
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                    .body(resource);
        } else {
            throw new IOException("파일을 찾을 수 없거나 읽을 수 없습니다: " + fileName);
        }
    }
    
    @GetMapping("/newTask/feedback")
    public String showFeedback(@RequestParam("tkid") String tkid, Model model) {
        Approval approval = service.getApprovalWithEmail(tkid);
        model.addAttribute("approval", approval);
        model.addAttribute("email", approval.getEmail());
        return "tracerPages/taskFeedback";
    }
}
