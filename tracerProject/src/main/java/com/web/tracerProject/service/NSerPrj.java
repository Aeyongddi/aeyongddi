package com.web.tracerProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.NDaoPrj;
import com.web.tracerProject.vo.User_info;

@Service
public class NSerPrj {
	@Autowired(required=false)
	private NDaoPrj dao;
	
	public User_info schByEmail(String email) {
		return dao.schByEmail(email);
	}
}
