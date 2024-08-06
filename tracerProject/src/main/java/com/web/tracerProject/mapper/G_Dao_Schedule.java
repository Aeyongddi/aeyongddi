package com.web.tracerProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.tracerProject.vo.Schedule;


@Mapper
public interface G_Dao_Schedule {
	// 조회하는 코드
	@Select("SELECT sid, start_date, end_date, endYN, title, description, email, pid from SCHEDULE")
	List<Schedule> getScheduleList();
	
	// 등록하는 코드 
	@Insert("INSERT INTO JH.SCHEDULE (SID, START_DATE, END_DATE, ENDYN, TITLE, DESCRIPTION, EMAIL, PID) " +
	        "VALUES (#{sid}, #{start_date}, #{end_date}, #{endyn}, #{title}, #{description}, #{email}, #{pid})")
	int insertSchedule(Schedule ins);
	
	// 수정하는 코드
	@Update("UPDATE SCHEDULE \r\n"
			+ "          SET SID = #{sid}, \r\n"
			+ "       start_date = #{start_date},\r\n"
			+ "         end_date = #{end_date},\r\n"
			+ "            endYN = #{endYN},\r\n"
			+ "            title = #{title},\r\n"
			+ "      description = #{description},\r\n"
			+ "            email = #{email},\r\n"
			+ "            WHERE pid = #{pid}")
	int updateSchedule(Schedule upt);
	 
	// 삭제하는 코드
	@Delete("Delegate FROM SCHEDULE WHERE pid = #{pid}")  
	int deleteSchedule(@Param("pid") String pid);
	
}