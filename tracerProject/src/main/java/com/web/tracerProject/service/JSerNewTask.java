package com.web.tracerProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.web.tracerProject.mapper.JDaoNewTask;
import com.web.tracerProject.vo.Task;

@Service
public class JSerNewTask {
    @Autowired(required = false)
    private JDaoNewTask dao;

    public List<Task> getAllTasks() {
        return dao.findAllTasks();
    }

    public void addTask(Task task) {
        dao.insertTask(task);
    }

    public void updateTask(Task task) {
        dao.updateTask(task);
    }

    public void deleteTask(String tkid) {
        dao.deleteTask(tkid);
    }
    
    public Task getTaskById(String tkid) {
        return dao.findTaskById(tkid);
    }
}
