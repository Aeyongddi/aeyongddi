package com.web.tracerProject.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.JDaoNewTask;
import com.web.tracerProject.vo.Approval;
import com.web.tracerProject.vo.Task;

@Service
public class JSerNewTask {

    @Autowired(required = false)
    private JDaoNewTask dao;

    @Autowired(required = false)
    private JSerNewAppro approvalService;

    private static final SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");

    public List<Task> getAllTasks() {
        List<Task> tasks = dao.findAllTasks();

        for (Task task : tasks) {
            if (task.getStartDate() != null) {
                task.setFormattedStartDate(dateFormatter.format(task.getStartDate()));
            }
            if (task.getEndDate() != null) {
                task.setFormattedEndDate(dateFormatter.format(task.getEndDate()));
            }

            // 단일 Approval 객체 설정
            Approval approval = approvalService.getApprovalByTaskId(task.getTkid());
            task.setApproval(approval);
        }

        return tasks;
    }

    public void addTask(Task task, String userEmail) {
        if (task.getStartDate() == null) {
            task.setStartDate(new Date());
        }
        if (task.getEndDate() == null) {
            task.setEndDate(null);
        }
        if (task.getEndYn() == null) {
            task.setEndYn(false);
        }
        task.setEmail(userEmail);

        dao.insertTask(task);
    }

    public void updateTask(Task task) {
        dao.updateTask(task);
    }

    public void updateTaskEndYn(String tkid, boolean endYn) {
        int endYnValue = endYn ? 1 : 0;
        dao.updateTaskEndYn(tkid, endYnValue);
    }

    public void deleteTask(String tkid) {
        dao.deleteTask(tkid);
    }

    public Task getTaskById(String tkid) {
        Task task = dao.findTaskById(tkid);
        Approval approval = approvalService.getApprovalByTaskId(task.getTkid());
        task.setApproval(approval);
        return task;
    }

    public void requestApproval(String tkid, String approvalTitle, String approvalDescription, String fileName, String email) {
        Approval approval = new Approval();
        approval.setTkid(tkid);
        approval.setApprovalTitle(approvalTitle);
        approval.setApprovalDescription(approvalDescription);
        approval.setUpfile(fileName);
        approval.setEmail(email);
        approvalService.addApproval(approval);
    }
}
