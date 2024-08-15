package com.web.tracerProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.JDaoNewAppro;

@Service
public class JSerNewAppro {
	@Autowired(required = false)
	private JDaoNewAppro dao;
}
