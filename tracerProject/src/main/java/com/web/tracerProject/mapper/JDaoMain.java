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
}
