package com.web.tracerProject.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.tracerProject.service.G_Service_TASK;
import com.web.tracerProject.vo.Task;

@Controller
public class G_Controller_Task {
    @Autowired(required = false)
    private G_Service_TASK service;
   
    // http://localhost:5656/taskList
    @GetMapping("/taskList")
    public String taskList(Task sch, Model d) {
        List<Task> taskList = service.getTaskList(sch);
        d.addAttribute("taskList", taskList);
        return "tracerPages/task"; 
    }
    
    
    // 등록하는 코드 
    @PostMapping("/taskListInsert")
    @ResponseBody
    public ResponseEntity<String> taskInsert(@RequestBody Task ins) {
        if (ins.getStart_date() == null) {
            ins.setStart_date(new Date()); // 현재 날짜로 설정
        }
        if (ins.getEnd_date() == null) {
            ins.setEnd_date(new Date()); // 현재 날짜로 설정
        }
        
        // 필드 기본값 설정
        if (ins.getName() == null) {
            ins.setName("");
        }
        if (ins.getDescription() == null) {
            ins.setDescription("");
        }
        if (ins.getSid() == null) {
            ins.setSid("");
        }
        if (!ins.isEndYN()) {
            ins.setEndYN(false);
        }

        // 서비스 메서드를 호출하여 작업 삽입
        int result = service.insertTask(ins);

        // 응답 반환
        return result > 0 
            ? ResponseEntity.ok("등록 성공")
            : ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("등록 실패");
    }
     
     
   
     // 단일 삭제 및 전체 삭제하는 코드
     @PostMapping("/taskDelete")
     public String taskDelete(@RequestBody Map<String, List<String>> payload, Model model) {
        List<String> tkids = payload.get("ids");
        if (tkids == null || tkids.isEmpty()) {
            model.addAttribute("msg", "삭제할 항목이 없습니다.");
            model.addAttribute("proc", "삭제 실패");
            return "tracerPages/task";
        }

        int result = service.deleteTasks(tkids);
        model.addAttribute("msg", result > 0 ? "삭제 성공" : "삭제 실패");
        model.addAttribute("proc", "삭제");
        return "tracerPages/task";
     }
    
     //  endYN boolean 값 DB에 바로 적용하는 코드
     @PostMapping("/updateTaskStatus")
     public ResponseEntity<String> updateTaskStatus(@RequestBody Map<String, Object> payload) {
         String tkid = (String) payload.get("tkid");
         boolean endYN = (Boolean) payload.get("endYN");
         String approvalStatus = (String) payload.get("approvalStatus");

         int result = service.updateTaskStatus(tkid, endYN, approvalStatus);

         if (result > 0) {
             return ResponseEntity.ok("Status updated successfully");
         } else {
             return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to update status");
         }
     }


     
    // 작업 수정
    @PostMapping("/updateTask")
    @ResponseBody
    public ResponseEntity<String> updateTask(@RequestBody Task upt) {
        int result = service.updateTask(upt);
        return result > 0
            ? ResponseEntity.ok("업데이트 성공")
            : ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("업데이트 실패");
     }
 
}
     
 
