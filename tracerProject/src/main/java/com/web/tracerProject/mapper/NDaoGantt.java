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
			
			""")
	int insGanttTask();
	
	@Update("""
			
			""")
	int uptGanttSchedule();
	@Update("""
			
			""")
	int uptGanttTask();
	
	@Delete("""
			
			""")
	int delGanttSchedule();
	@Delete("""
			
			""")
	int delGanttTask();
}
