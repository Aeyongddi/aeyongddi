package com.web.tracerProject.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.G_Dao_Schedule;
import com.web.tracerProject.vo.Schedule;

@Service
public class G_Service_SCHEDULE {
	
	@Autowired(required = false)
	private G_Dao_Schedule dao;
	// 조회하는 코드
	public List<Schedule> getScheduleList(Schedule sch){
		return dao.getScheduleList();
	}
	
	// 삭제하는 코드
	public int deleteSchedule(String pid) {
		return dao.deleteSchedule(pid);
	}
	
	// 수정하는 코드
	public int updateSchedule(Schedule ins) {
	        return dao.updateSchedule(ins);
	}
	
	// 등록하는 코드 null처리 
	public int insertSchedule(Schedule ins) {
		if (ins.getStart_date() == null) {
	        ins.setStart_date(new Date()); // 현재 날짜로 설정
	    }
	    if (ins.getEnd_date() == null) {
	        ins.setEnd_date(new Date()); // 현재 날짜로 설정
	    }
	    if (!ins.isEndYN()) {
            ins.setEndYN(false); // 기본값 설정
        }
	    if (ins.getTitle() == null) {
	        ins.setTitle(""); // 기본값 설정
	    }
	    // 내용
	    if (ins.getDescription() == null) {
	        ins.setDescription(""); // 기본값 설정
	    }
	    if (ins.getEmail() == null) {
	        ins.setEmail(""); 
	    }
	    return dao.insertSchedule(ins);
	} 
	
	
}
