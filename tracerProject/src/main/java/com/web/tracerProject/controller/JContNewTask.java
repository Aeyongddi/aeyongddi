package com.web.tracerProject.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.web.tracerProject.service.JSerNewTask;
import com.web.tracerProject.service.JSerNewAppro;
import com.web.tracerProject.vo.Task;
import com.web.tracerProject.vo.Approval;

@Controller
public class JContNewTask {
    @Autowired(required = false)
    private JSerNewTask taskService;

    @Autowired(required = false)
    private JSerNewAppro approvalService;

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

        String uploadDir = "C:/upload/files/";
        String fileName = approvalFile.getOriginalFilename();
        File file = new File(uploadDir + fileName);
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
}
