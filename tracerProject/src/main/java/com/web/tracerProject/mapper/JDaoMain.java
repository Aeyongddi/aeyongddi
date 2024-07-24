package com.web.tracerProject.mapper;

import java.util.Date;

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
	
	// select - 마감 기한 임박
	@Select("SELECT trunc(end_date) AS end_date\r\n"
			+ "from(SELECT * FROM task ORDER BY abs(trunc(start_date) - trunc(sysdate)))\r\n"
			+ "WHERE rownum = 1")
	Date getDueto(Task task);
	
	// select - d-day
	@Select("SELECT \r\n"
			+ "    CASE \r\n"
			+ "        WHEN TRUNC(end_date) = TRUNC(SYSDATE) THEN 'D-Day'\r\n"
			+ "        WHEN TRUNC(end_date) > TRUNC(SYSDATE) THEN 'D-' || TO_CHAR(TRUNC(end_date) - TRUNC(SYSDATE))\r\n"
			+ "        ELSE 'D+' || TO_CHAR(TRUNC(SYSDATE) - TRUNC(end_date))\r\n"
			+ "    END AS d_day\r\n"
			+ "FROM (\r\n"
			+ "    SELECT *\r\n"
			+ "    FROM task\r\n"
			+ "    ORDER BY ABS(TRUNC(start_date) - TRUNC(SYSDATE))\r\n"
			+ ")\r\n"
			+ "WHERE ROWNUM = 1")
	String getDday(Task task);
	
	// select - 프로젝트 개수
	@Select("SELECT count(*)\r\n"
			+ "FROM PROJECT")
	int getCountPro(Task task);
}
