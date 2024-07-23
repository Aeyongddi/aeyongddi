package com.web.tracerProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.NDaoMem;
import com.web.tracerProject.vo.User_info;

@Service
public class NSerMem {
	@Autowired(required=false)
	private NDaoMem dao;
	
	public String schMember(User_info user_info) {
		return dao.schMember(user_info)>0?"로그인성공":"로그인실패";
	}
	
}
