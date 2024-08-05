package com.web.tracerProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.tracerProject.vo.Gantt;
import com.web.tracerProject.vo.Schedule;
import com.web.tracerProject.vo.Task;

@Mapper
public interface NDaoGantt {
	
	@Select("""
			SELECT  REGEXP_REPLACE(sid, '[^0-9]', '') AS id,
				REGEXP_REPLACE(sid, '[^0-9]', '') AS sortorder,
				start_date,
				end_date-start_date AS duration,
				title AS text,
				'true' AS "open",
				0 AS parent,
				nickname AS "users"
			FROM schedule s, user_info u
			WHERE s.email = u.email
			""")
	List<Gantt> getGanttSchedule();
	@Select("""
			SELECT 	REGEXP_REPLACE(tkid, '[^0-9]', '')+10000 AS id,
				REGEXP_REPLACE(t.tkid, '[^0-9]', '') AS sortorder,
				t.start_date,
				t.end_date-t.start_date AS duration,
				t.name AS text,
				'true' AS "open",
				REGEXP_REPLACE(t.sid, '[^0-9]', '') AS parent,
				nickname AS "users"
			FROM schedule s, task t, user_info u
			WHERE t.sid = s.sid 
			AND u.email = s.email
			""")
	List<Gantt> getGanttTask();
	@Select("""
			SELECT NICKNAME FROM USER_INFO
			""")
	List<String> getUsers();
	@Insert("""
			INSERT INTO SCHEDULE (SID, START_DATE, END_DATE, ENDYN,
				TITLE, DESCRIPTION, EMAIL, PID)
			VALUES('SID'||LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
			    #{start_date}, #{end_date}, 0,
				#{title}, #{description}, #{email}, #{pid})
			""")
	int insGanttSchedule(Schedule schedule);
	@Insert("""
			INSERT INTO TASK (TKID, START_DATE, END_DATE, ENDYN, 
				NAME, DESCRIPTION, SID)
			VALUES('TKID'||LPAD(TKID_SEQ.NEXTVAL, 4, '0'), 
				#{start_date}, #{end_date}, 0,
				#{name}, #{description}, #{sid})
			""")
	int insGanttTask(Task task);
	
	@Update("""
			UPDATE SCHEDULE 
			SET START_DATE = #{start_date}, END_DATE = #{end_date},
				TITLE = #{title}, DESCRIPTION = #{description}
			WHERE SID = #{sid}
			""")
	int uptGanttSchedule(Schedule schedule);
	@Update("""
			UPDATE TASK
			SET START_DATE = #{start_date}, END_DATE = #{end_date},
				NAME = #{name}, DESCRIPTION = #{description}
			WHERE TID = #{tid}
			""")
	int uptGanttTask(Task task);
	
	@Delete("""
			DELETE SCHEDULE WHERE SID = #{sid}
			""")
	int delGanttSchedule(@Param("sid") String sid);
	@Delete("""
			DELETE TASK WHERE TKID = #{tkid}
			""")
	int delGanttTask(@Param("tkid") String tkid);
}
