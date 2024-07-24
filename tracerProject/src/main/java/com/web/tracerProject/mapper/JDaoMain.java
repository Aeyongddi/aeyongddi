package com.web.tracerProject.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.web.tracerProject.vo.Task;



@Mapper
public interface JDaoMain {

	// select - 오늘 할 일
	@Select("SELECT count(*)\r\n"
			+ "FROM TASK\r\n"
			+ "WHERE trunc(START_DATE) = trunc(SYSDATE)")
	int getTodayDo(Task task);
	
	// select - 이번 주 할 일
	@Select("SELECT count(*)\r\n"
			+ "FROM task\r\n"
			+ "WHERE START_DATE BETWEEN trunc(sysdate, 'IW')\r\n"
			+ "AND trunc(sysdate, 'IW')+6")
	int getWeekDo(Task task);
}
