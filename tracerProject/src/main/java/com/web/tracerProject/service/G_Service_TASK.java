package com.web.tracerProject.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.G_Dao_task;
import com.web.tracerProject.vo.Task;

@Service
public class G_Service_TASK {
	@Autowired(required = false)
	private G_Dao_task dao;
	
	public List<Task> getTaskList(Task sch) {
		// processNullFields(sch);
		return dao.getTaskList();
	}
	
	// 수정하는 코드
    public int updateTask(Task task) {
        return dao.updateTask(task);
    }

	
    // boolean 값 수정하는 코드
    public int updateTaskStatus(String tkid, boolean endYN, String approvalStatus) {
	    return dao.updateTaskStatus(tkid, endYN, approvalStatus);
    }
    
	// 단일 삭제하는 코드
	public int deleteTask(String tkid) {
		return dao.deleteTask(tkid);
	}
    // 전체 삭제하는 코드
	public int deleteTasks(List<String> tkids) {
		return dao.deleteTasks(tkids);
	}
    
	// 등록하는 코드 처리 값
	public int insertTask(Task ins) {

	    
	    // 기본값 설정
	    if (ins.getName() == null) {
	        ins.setName(""); 
	    }
	    if (ins.getDescription() == null) {
	        ins.setDescription("");
	    }
	    if (ins.getSid() == null) {
	        ins.setSid(""); 
	    }
	    if (ins.getApprovalStatus() == null) {
	        ins.setApprovalStatus("진행중"); // 기본 결재 상태 설정
	    }
	    if (!ins.isEndYN()) {
	        ins.setEndYN(false); 
	    }
	    if (ins.getStart_date() == null) {
	        ins.setStart_date(new Date());
	    }
	    if (ins.getEnd_date() == null) {
	        ins.setEnd_date(new Date());
	    }
	    return dao.insertTask(ins);
	}
	
	 public Task getTaskByTkid(String tkid) {
	        return dao.getTaskByTkid(tkid);
	    }

	
	}
	
	

