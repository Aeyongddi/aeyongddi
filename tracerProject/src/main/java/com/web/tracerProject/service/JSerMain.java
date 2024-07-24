package com.web.tracerProject.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.JDaoMain;
import com.web.tracerProject.vo.Task;
import com.web.tracerProject.vo.User_info;
//getDueto getDday getCountPro
@Service
public class JSerMain {
	@Autowired(required=false)
	private JDaoMain dao;
	
	public int getTodayDo(Task task) {
		return dao.getTodayDo(task);
	}
	
	public int getWeekDo(Task task) {
		return dao.getWeekDo(task);
	}
	public Date getDueto(Task task) {
		return dao.getDueto(task);
	}
	public String getDday(Task task) {
		return dao.getDday(task);
	}
	public int getCountPro(Task task) {
		return dao.getCountPro(task);
	}
	// mem 로그인
		public String isMember(User_info user_info) {
			if(user_info.getEmail()==null)
				user_info.setEmail("");
			if(user_info.getPassword()==null)
				user_info.setPassword("");
			return dao.isMember(user_info)>0?"로그인성공":"로그인실패";
		}
		public User_info getMember(User_info user_info) {
			return dao.getMember(user_info);
		}
}
