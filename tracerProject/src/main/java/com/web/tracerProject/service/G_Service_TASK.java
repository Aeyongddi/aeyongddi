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
	public int updateTaskStatus(String tkid, boolean endYN) {
		return dao.updateTaskStatus(tkid, endYN);
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
	    ins.setTkid(dao.getTkid()); // tkid를 시퀀스로 자동 생성

	    if (ins.getName() == null) {
	        ins.setName(""); // 기본값 설정
	    }
	    if (ins.getDescription() == null) {
	        ins.setDescription(""); // 기본값 설정
	    }
	    if (ins.getSid() == null) {
	        ins.setSid(""); 
	    }
	    if (!ins.isEndYN()) {
            ins.setEndYN(false); // 기본값 설정
        }
	    if (ins.getStart_date() == null) {
	        ins.setStart_date(new Date()); // 현재 날짜로 설정
	    }
	    if (ins.getEnd_date() == null) {
	        ins.setEnd_date(new Date()); // 현재 날짜로 설정
	    }
	    return dao.insertTask(ins);
	}
	
	
}

