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
				SID AS ID, TITLE, EMAIL AS WRITER, 
				TO_CHAR(START_DATE, 'YYYY-MM-DD') AS "START",
				TO_CHAR(END_DATE, 'YYYY-MM-DD') AS "END", 
				DESCRIPTION AS CONTENT,
				'#2ecc71' AS BACKGROUNDCOLOR,
				'WHITE' AS TEXTCOLOR, '#' AS URL,
				'true' AS ALLDAY
			FROM SCHEDULE
			""")
	List<Calendar> getScheduleCalendarList();
	  @Insert("	INSERT INTO SCHEDULE "
	  		+ "(SID, TITLE, EMAIL, START_DATE, END_DATE, DESCRIPTION, PID) "
	  		+ " values('SID'||LPAD(SID_SEQ.NEXTVAL, 5, '0'),\r\n" +
	  "		#{title},#{writer},#{start},#{end},\r\n" +
	  "		#{content}, '')")
	  int insScheduleCalendar(Calendar ins);
	  
	  @Update("""
		        UPDATE SCHEDULE
		        SET title = #{title},
		            start_date = #{start},
		            end_date = #{end},
		            email = #{writer},
		            description = #{content}
		        WHERE sid = #{id}
		        """)
	  int uptScheduleCalendar(Calendar upt);
	  
	  @Delete("DELETE FROM SCHEDULE \r\n" + "WHERE sid = #{id}") int
	  delScheduleCalendar(@Param("id") String id);
	  
}

