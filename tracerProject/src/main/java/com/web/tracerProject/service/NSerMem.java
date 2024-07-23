package com.web.tracerProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.NDaoMem;
import com.web.tracerProject.vo.User_info;

@Service
public class NSerMem {
	@Autowired(required=false)
	private NDaoMem dao;
	
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
	// mem 회원가입
	public String insMember(User_info user_info) {
		return dao.insMember(user_info)>0?"회원가입성공":"회원가입실패";
	}
}
