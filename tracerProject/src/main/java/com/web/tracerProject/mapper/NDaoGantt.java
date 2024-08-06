package com.web.tracerProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.tracerProject.vo.Gantt;

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
				TITLE, EMAIL, PID)
			VALUES('SID'||LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
			    TO_TIMESTAMP_TZ(#{start_date}, 'YYYY-MM-DD"T"HH24:MI:SS.FF3TZH:TZM'), 
			    TO_TIMESTAMP_TZ(#{end_date}, 'YYYY-MM-DD"T"HH24:MI:SS.FF3TZH:TZM'), 
			    0, #{text}, #{email}, #{pid})
			""")
	int insGanttSchedule(Gantt gantt);
	@Insert("""
			INSERT INTO TASK (TKID, START_DATE, END_DATE, ENDYN,
				NAME, SID)
			VALUES('TKID'||LPAD(TKID_SEQ.NEXTVAL, 4, '0'),
				TO_TIMESTAMP_TZ(#{start_date}, 'YYYY-MM-DD"T"HH24:MI:SS.FF3TZH:TZM'),
			    TO_TIMESTAMP_TZ(#{end_date}, 'YYYY-MM-DD"T"HH24:MI:SS.FF3TZH:TZM'),
				0, #{text}, 'SID'||LPAD(#{parent}, 5, '0'))
			""")
	int insGanttTask(Gantt gantt);
	
	@Update("""
			UPDATE SCHEDULE
			SET START_DATE = #{start_date}, END_DATE = #{end_date},
				TITLE = #{text}
			WHERE SID = #{id}
			""")
	int uptGanttSchedule(Gantt gantt);
	@Update("""
			UPDATE TASK
			SET START_DATE = #{start_date}, END_DATE = #{end_date},
				NAME = #{text}
			WHERE TID = #{id}
			""")
	int uptGanttTask(Gantt gantt);
	
	@Delete("""
			DELETE SCHEDULE WHERE SID = #{sid}
			""")
	int delGanttSchedule(Gantt gantt);
	@Delete("""
			DELETE TASK WHERE TKID = #{tkid}
			""")
	int delGanttTask(Gantt gantt);
	
	@Select("""
			SELECT EMAIL FROM USER_INFO 
			WHERE NICKNAME = #{users}
			""")
	String getEmail(Gantt gantt);
}
