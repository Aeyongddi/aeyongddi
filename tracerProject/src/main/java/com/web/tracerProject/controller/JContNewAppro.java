package com.web.tracerProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.web.tracerProject.service.JSerNewAppro;

@Controller
public class JContNewAppro {
	@Autowired(required = false)
	private JSerNewAppro service;
	
}
