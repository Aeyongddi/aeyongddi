package com.web.tracerProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.NDaoMem;
import com.web.tracerProject.vo.User_info;

@Service
public class NSerMem {
	@Autowired(required=false)
	private NDaoMem dao;
	
	
	// mem 회원가입
	public String insMember(User_info user_info) {
		return dao.insMember(user_info)>0?"회원가입성공":"회원가입실패";
	}
	// mem 비밀번호변경
	public String chgPwd(String password, String email) {
		return dao.chgPwd(password, email)>0?"비밀번호변경성공":"비밀번호변경실패";
	}
	// mem 비밀번호 유효성검사
	
	
}
