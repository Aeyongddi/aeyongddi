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
	  List<Calendar> getScheduleCalendarList();
	  int insScheduleCalendar(Calendar ins);
	  int uptScheduleCalendar(Calendar upt);
	  int delScheduleCalendar(@Param("id") String id);
	  
	  List<Calendar> getScheduleCalendarListIndiv(@Param("id") String id);
	  int insScheduleCalendarIndiv(Calendar ins);
	  int uptScheduleCalendarIndiv(Calendar upt);
	  int delScheduleCalendarIndiv(@Param("id") String id);
	  
	  List<Calendar> getScheduleCalendarListTeam(@Param("id") String id);
	  int insScheduleCalendarGroup(Calendar ins);
	  int uptScheduleCalendarGroup(Calendar upt);
	  int delScheduleCalendarGroup(@Param("id") String id);
	  
}

