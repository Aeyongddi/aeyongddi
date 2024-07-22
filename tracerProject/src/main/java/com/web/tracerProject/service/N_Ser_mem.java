package com.web.tracerProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.N_Dao_mem;

@Service
public class N_Ser_mem {
	@Autowired(required=false)
	private N_Dao_mem dao;
	
}
