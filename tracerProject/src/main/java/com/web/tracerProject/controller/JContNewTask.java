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
                                  @RequestParam("approvalFile") MultipartFile approvalFile) throws IOException {

        // 파일 업로드 경로
        String uploadDir = "C:\\Users\\human-07\\git\\aeyongFinal\\tracerProject\\src\\main\\webapp\\WEB-INF\\upload";

        // 경로에 디렉터리가 존재하지 않으면 생성
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs(); // 디렉터리를 생성합니다.
        }

        // 파일 저장 경로 및 파일 전송
        String fileName = approvalFile.getOriginalFilename();
        File file = new File(uploadDir + File.separator + fileName);
        approvalFile.transferTo(file);

        taskService.requestApproval(tkid, approvalTitle, approvalDescription, fileName);
        return "redirect:/newTask";
    }


    @GetMapping("/newTask/feedback")
    public String showFeedback(@RequestParam("tkid") String tkid, Model model) {
        Approval approval = approvalService.getApprovalByTaskId(tkid);
        model.addAttribute("approval", approval);
        return "tracerPages/taskFeedback";
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
        boolean endYn = (Boolean) requestData.get("endYn");

        // Task 상태 업데이트
        Task task = taskService.getTaskById(tkid);
        if (task != null) {
            task.setEndYn(endYn);
            taskService.updateTask(task);
            return ResponseEntity.ok("{\"success\": true}");
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("{\"success\": false}");
        }
    }

}
