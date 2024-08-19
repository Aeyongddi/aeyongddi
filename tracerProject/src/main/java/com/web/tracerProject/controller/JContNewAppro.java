package com.web.tracerProject.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
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
        // 피드백이 업데이트되면 해당 작업에 연결된 피드백도 업데이트
    	service.updateApprovalStatus(approval);
        return "redirect:/newApproval";
    }
    
    @GetMapping("/downloadFile")
    public ResponseEntity<InputStreamResource> downloadFile(@RequestParam("apid") String apid) throws IOException {
        // Approval 객체에서 파일 이름 가져오기
        Approval approval = service.getApprovalById(apid);
        String fileName = approval.getOriginalFileName();

        // 파일 이름이 없는 경우 기본 예외 처리
        if (fileName == null || fileName.isEmpty()) {
            throw new IOException("파일 이름을 찾을 수 없습니다. 승인 ID: " + apid);
        }

        // 파일 경로 생성 (여기서는 미리 설정한 uploadDir을 사용)
        Path filePath = Paths.get("C:\\Users\\human-07\\git\\aeyongFinal\\tracerProject\\src\\main\\webapp\\WEB-INF\\upload", fileName);
        File file = filePath.toFile();

        // 파일이 존재하지 않거나 읽을 수 없을 때
        if (!file.exists() || !file.canRead()) {
            throw new IOException("파일을 찾을 수 없거나 읽을 수 없습니다. 파일 이름: " + fileName);
        }

        // 파일을 다운로드하도록 HTTP 응답 생성
        return ResponseEntity.ok()
                .contentType(MediaType.APPLICATION_OCTET_STREAM)  // 이 부분은 파일의 MIME 타입을 설정합니다.
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getName() + "\"")  // 파일을 강제로 다운로드하게 설정합니다.
                .body(new InputStreamResource(new FileInputStream(file)));
    }

    @GetMapping("/newTask/feedback")
    public String showFeedback(@RequestParam("tkid") String tkid, Model model) {
        Approval approval = service.getApprovalWithEmail(tkid);
        model.addAttribute("approval", approval);
        model.addAttribute("email", approval.getEmail());
        return "tracerPages/taskFeedback";
    }
}
