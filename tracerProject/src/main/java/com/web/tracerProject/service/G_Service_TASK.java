package com.web.tracerProject.service;

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
	// List<Task> getTkidList() Task

//    public int updateBoard(Board upt) {
//        return dao.updateBoard(upt);
//    }

	public int updateTaskStatus(String tkid, boolean isend) {
		return dao.updateTaskStatus(tkid, isend);
	}

	public int deleteTask(String tkid) {
		return dao.deleteTask(tkid);
	}

	public int deleteTasks(List<String> tkids) {
		return dao.deleteTasks(tkids);
	}

	public int insertTask(Task ins) {
	    ins.setTkid(dao.getTkid()); // tkid를 시퀀스로 자동 생성

	    if (ins.getName() == null) {
            ins.setName(""); // 기본값 설정
        }
        if (ins.getDescription() == null) {
            ins.setDescription(""); // 기본값 설정
        }
        if (ins.getEnd_date() == null) {
            ins.setEnd_date(null); // null로 처리
        }
        if (ins.getStart_dateStr() == null) {
        	ins.setStart_dateStr("");
        } 
        if (ins.getEnd_dateStr() == null) {
        	ins.setEnd_dateStr("");
        }
        if (ins.getSid() == null) {
            ins.setSid(""); // null로 처리
        }
        if (!ins.isIsend()) {
            ins.setIsend(false); // 기본값 설정
        }
        return dao.insertTask(ins);

       
	}
	
	
}

