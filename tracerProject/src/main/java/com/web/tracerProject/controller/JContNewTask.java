package com.web.tracerProject.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.web.tracerProject.service.JSerNewAppro;
import com.web.tracerProject.service.JSerNewTask;
import com.web.tracerProject.vo.Approval;
import com.web.tracerProject.vo.Task;
import com.web.tracerProject.vo.User_info;

import jakarta.servlet.http.HttpSession;

@Controller
public class JContNewTask {

    @Autowired(required = false)
    private JSerNewTask taskService;

    @Autowired(required = false)
    private JSerNewAppro approvalService;

    // application.properties에서 파일 업로드 경로 읽기
    @Value("${file.upload-dir}")
    private String uploadDir;

    @GetMapping("/newTask")
    public String showTaskList(Model model) {
        model.addAttribute("tasks", taskService.getAllTasks());
        return "tracerPages/newTask";
    }

    @PostMapping("/newTask/add")
    public String addTask(@ModelAttribute Task task) {
        task.setEndYn(false); // 기본적으로 작업 상태는 "진행 중"
        taskService.addTask(task);
        return "redirect:/newTask";
    }

    @PostMapping("/newTask/update")
    public String updateTask(@ModelAttribute Task task) {
        taskService.updateTask(task);
        return "redirect:/newTask";
    }

    @PostMapping("/newTask/delete")
    public String deleteTask(@RequestParam("tkid") String tkid) {
        taskService.deleteTask(tkid);
        return "redirect:/newTask";
    }

    @PostMapping("/newTask/requestApproval")
    public String requestApproval(@RequestParam("tkid") String tkid,
                                  @RequestParam("approvalTitle") String approvalTitle,
                                  @RequestParam("approvalDescription") String approvalDescription,
                                  @RequestParam("approvalFile") MultipartFile approvalFile,
                                  HttpSession session) throws IOException {

        // 파일 업로드 경로
        String uploadDir = "C:\\Users\\human-07\\git\\aeyongFinal\\tracerProject\\src\\main\\webapp\\WEB-INF\\upload";

        // 경로에 디렉터리가 존재하지 않으면 생성
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs(); // 디렉터리를 생성합니다.
        }

        // 파일 저장 경로 및 파일 전송 처리
        String fileName = null;
        if (!approvalFile.isEmpty()) { // 파일이 비어 있지 않은 경우에만 처리
            fileName = approvalFile.getOriginalFilename();
            File file = new File(uploadDir + File.separator + fileName);
            approvalFile.transferTo(file);
        }

        // 세션에서 이메일 가져오기
        User_info user_info = (User_info) session.getAttribute("user_info");
        String email = user_info != null ? user_info.getEmail() : null;

        // 올바른 인수로 메서드 호출 (이메일이 null일 가능성도 고려)
        taskService.requestApproval(tkid, approvalTitle, approvalDescription, fileName, email);

        return "redirect:/newTask";
    }

    @PostMapping("/newTask/submitFeedback")
    public String submitFeedback(@RequestParam("apid") String apid,
                                 @RequestParam("userFeedback") String userFeedback) {
        approvalService.updateUserFeedback(apid, userFeedback);
        return "redirect:/newTask";
    }
    
    @PostMapping("/newTask/updateStatus")
    public ResponseEntity<String> updateTaskStatus(@RequestBody Map<String, Object> requestData) {
        String tkid = (String) requestData.get("tkid");
        boolean endYn = Boolean.parseBoolean(requestData.get("endYn").toString());

        // 서비스 메서드를 호출하여 endYn 상태를 업데이트
        taskService.updateTaskEndYn(tkid, endYn);

        return ResponseEntity.ok("{\"success\": true}");
    }


}
