package com.web.tracerProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.web.tracerProject.vo.Schedule;


@Mapper
public interface G_Dao_Schedule {
	// 조회하는 코드
	@Select("SELECT sid, start_date, end_date, endYN, title, description, email, pid from SCHEDULE")
	List<Schedule> getSchedule();
	
	// 등록하는 코드 
	@Insert("INSERT INTO SCHEDULE (sid, START_DATE, END_DATE, ENDYN, TITLE, DESCRIPTION, EMAIL, PID) " +
	        "VALUES ('SID'||LPAD(SID_SEQ.NEXTVAL, 5, '0'), #{start_date}, #{end_date}, #{endYN}, #{title}, #{description}, #{email}, #{pid})")
	int insertSchedule(Schedule upt);
	
	 
	
	// 수정하는 코드
//	@Update("UPDATE SCHEDULE SET " +
//	        "START_DATE = #{start_date}, " +
//	        "END_DATE = #{end_date}, " +
//	        "ENDYN = #{endYN}, " +
//	        "TITLE = #{title}, " +
//	        "DESCRIPTION = #{description}, " +
//	        "EMAIL = #{email} " +
//	        "WHERE PID = #{pid}")
//	int updateSchedule(Schedule upt);
//	 
//	// 삭제하는 코드
//	@Delete("DELETE FROM SCHEDULE WHERE SID = #{sid}")
//	int deleteSchedule(@Param("sid") String sid);
	
}