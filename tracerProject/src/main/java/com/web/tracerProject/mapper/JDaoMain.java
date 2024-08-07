package com.web.tracerProject.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.web.tracerProject.vo.Project;
import com.web.tracerProject.vo.ProjectProgress;
import com.web.tracerProject.vo.Task;
import com.web.tracerProject.vo.User_info;



@Mapper
public interface JDaoMain {

    // select - 오늘 할 일
    @Select("SELECT count(*) FROM TASK WHERE trunc(START_DATE) = trunc(SYSDATE)")
    int getTodayDo(Task task);

    // select - 이번 주 할 일
    @Select("SELECT count(*) FROM task WHERE START_DATE BETWEEN trunc(sysdate, 'IW') AND trunc(sysdate, 'IW')+6")
    int getWeekDo(Task task);

    // select - 마감 기한 임박
    @Select("SELECT trunc(end_date) AS end_date FROM (SELECT * FROM project ORDER BY abs(trunc(start_date) - trunc(sysdate))) WHERE rownum = 1")
    Date getDueto(Task task);

    // select - d-day
    
    @Select("SELECT CASE WHEN TRUNC(end_date) = TRUNC(SYSDATE) THEN 'D-Day' "
    		+ "WHEN TRUNC(end_date) > TRUNC(SYSDATE) THEN 'D-' || TO_CHAR(TRUNC(end_date) - TRUNC(SYSDATE)) "
    		+ "ELSE 'D+' || TO_CHAR(TRUNC(SYSDATE) - TRUNC(end_date)) "
    		+ "END AS d_day FROM (SELECT * FROM project ORDER BY ABS(TRUNC(start_date) - TRUNC(SYSDATE))) "
    		+ "WHERE ROWNUM = 1")
    String getDday(Task task);

    // select - 프로젝트 개수
    @Select("SELECT count(*) FROM PROJECT")
    int getCountPro(Task task);

    // mem - 로그인
    @Select("SELECT COUNT(*) FROM USER_INFO WHERE email=#{email} AND password=#{password}")
    int isMember(User_info user_info);

    @Select("SELECT * FROM USER_INFO WHERE EMAIL=#{email}")
    User_info getMember(User_info user_info);

    // 작업 진행률
    @Select("SELECT CASE WHEN total.count_all = 0 THEN 0 ELSE (completed.count_y * 100 / total.count_all) END AS progress " +
            "FROM (SELECT COUNT(*) AS count_y FROM task WHERE endYN = 1) completed, " +
            "     (SELECT COUNT(*) AS count_all FROM task) total")
    int getTaskProgress();

    // 프로젝트 목록
    @Select("SELECT pid, start_date, end_date, title, description FROM project")
    List<Project> getProjectList();
    
    // 프로젝트 진행률
    @Select("SELECT p.pid, p.title, " +
            "       (SUM(CASE WHEN t.endYN = 1 THEN 1 ELSE 0 END) * 100 / COUNT(*)) AS progress, " +
            "       SUM(CASE WHEN t.endYN = 1 THEN 1 ELSE 0 END) AS completedTasks, " +
            "       COUNT(*) AS totalTasks " +
            "FROM project p " +
            "JOIN schedule s ON p.pid = s.pid " +
            "JOIN task t ON s.sid = t.sid " +
			"WHERE p.end_date >= TRUNC(SYSDATE) " +
            "GROUP BY p.pid, p.title")
    List<ProjectProgress> getProjectProgress();
}

