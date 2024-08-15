package com.web.tracerProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.NDaoUserMgmt;
import com.web.tracerProject.vo.User_info;

@Service
public class NSerUserMgmt {
	@Autowired(required=false)
	private NDaoUserMgmt dao;
	public List<User_info> getUser_info(){
		return dao.getUserInfo();
	}
	public List<User_info> schUserInfo(String name, String auth){
		return dao.schUserInfo(name, auth);
	}
	public List<User_info> delUser(String name, String auth, String email) {
		dao.delUser(email);
		return dao.schUserInfo(name, auth);
	}
	public String uptUser(String auth, String email) {
		return dao.uptUser(auth, email)>0?"권한수정성공":"권한수정실패";
	}
}
