package com.web.tracerProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.tracerProject.vo.Calendar;

@Mapper
public interface NDaoCalendar {
	@Select("""
			SELECT
				SID AS ID, TITLE, EMAIL AS WRITER, START_DATE AS "START",
				END_DATE AS "END", DESCRIPTION AS CONTENT,
				'#2ecc71' AS BACKGROUNDCOLOR,
				'WHITE' AS TEXTCOLOR, '#' AS URL
			FROM SCHEDULE
			""")
	List<Calendar> getScheduleCalendarList();

	@Select("""
			SELECT
				TKID AS ID, NAME AS TITLE, EMAIL AS WRITER, START_DATE AS "START",
				END_DATE AS "END", DESCRIPTION AS CONTENT,
				'#3498db' AS BACKGROUNDCOLOR,
				'WHITE' AS TEXTCOLOR, '#' AS URL
			FROM TASK
			""")
	List<Calendar> getTaskCalendarList();

	
	  @Insert("	INSERT INTO SCHEDULE "
	  		+ "(SID, TITLE, EMAIL, START_DATE, END_DATE, DESCRIPTION) "
	  		+ " values(sid_seq.nextval,\r\n" +
	  "		#{title},#{writer},#{start},#{end},\r\n" +
	  "		#{content})")
	  int insertScheduleCalendar(Calendar ins);
	  
	  @Insert("	INSERT INTO TASK "
	  		+ ""
	  		+ "values(cal_seq.nextval,\r\n" +
	  "		#{title},#{writer},#{start},#{end},\r\n" +
	  "		#{content},#{backgroundColor},#{textColor}, #{allDay},#{urlLink})")
	  int insertTaskCalendar(Calendar ins);
	  
	  @Update("UPDATE SCHEDULE \r\n" + "SET title = #{title},\r\n" +
	  "	start1 = #{start},\r\n" + "	end1=#{end},\r\n" +
	  "	writer=#{writer},\r\n" + "	content=#{content},\r\n" +
	  "	BACKGROUNDCOLOR =#{backgroundColor},\r\n" +
	  "	TEXTCOLOR =#{textColor},\r\n" + "	ALLDAY =#{allDay},\r\n" +
	  "	url = #{urlLink}\r\n" + "WHERE id = #{id}") int
	  updateScheduleCalendar(Calendar upt);
	  
	  @Update("UPDATE TASK \r\n" + "SET title = #{title},\r\n" +
	  "	start1 = #{start},\r\n" + "	end1=#{end},\r\n" +
	  "	writer=#{writer},\r\n" + "	content=#{content},\r\n" +
	  "	BACKGROUNDCOLOR =#{backgroundColor},\r\n" +
	  "	TEXTCOLOR =#{textColor},\r\n" + "	ALLDAY =#{allDay},\r\n" +
	  "	url = #{urlLink}\r\n" + "WHERE id = #{id}") int
	  updateTaskCalendar(Calendar upt);
	  
	  @Delete("DELETE FROM SCHEDULE \r\n" + "WHERE id = #{id}") int
	  deleteScheduleCalendar(@Param("id") int id);
	  
	  @Delete("DELETE FROM TASK \r\n" + "WHERE id = #{id}") int
	  deleteTaskCalendar(@Param("id") int id);
}

