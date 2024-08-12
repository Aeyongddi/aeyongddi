package com.web.tracerProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.web.tracerProject.vo.Project;
import com.web.tracerProject.vo.Team;
import com.web.tracerProject.vo.User_info;

@Mapper
public interface NDaoPrj {
	// 프로젝트 생성
	@Select("SELECT *\r\n"
			+ "FROM USER_INFO\r\n"
			+ "WHERE EMAIL = #{invEmail}")
	User_info schByEmail(@Param("invEmail") String email);
	
	@Insert("""
			INSERT INTO
			PROJECT VALUES
			('PID'||LPAD(PID_SEQ.NEXTVAL, 5, '0'), 
			#{start_date}, #{end_date}, #{title}, #{description})
			""")
	@SelectKey(statement = "SELECT PID_SEQ.NEXTVAL FROM dual",
	keyProperty = "pid", before = true, resultType = String.class)
	int createPrj(Project project);
	@Select("""
			SELECT 'PID'||LPAD(PID_SEQ.CURRVAL, 5, '0') FROM dual
			""")
	String getCurrPid();
	
	@Insert("""
			INSERT INTO
			TEAM VALUES
			('TID'||LPAD(TID_SEQ.NEXTVAL, 5, '0'), 
			#{pid}, #{email}, #{auth})
			""")
	int createPrjTeam(Team team);
	
	@Select("""
			SELECT COUNT(*)
			FROM TEAM 
			WHERE AUTH IN ('user', 'manager')
			AND EMAIL = #{email}
			""")
	int alreadyWorking(User_info user_info);
	
	// 프로젝트 조회
	@Select("""
			SELECT *
			FROM PROJECT
			""")
	List<Project> getProject();
	@Select("""
			SELECT *
			FROM PROJECT
			WHERE TITLE LIKE '%'||#{prjTitle}||'%'
			""")
	List<Project> schProject(@Param("prjTitle") String prjTitle);
	@Delete("""
			DELETE PROJECT
			WHERE PID = #{pid}
			""")
	int delPrj(@Param("pid") String pid);
}