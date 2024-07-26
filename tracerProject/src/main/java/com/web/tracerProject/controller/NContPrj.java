package com.web.tracerProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.tracerProject.service.NSerPrj;
import com.web.tracerProject.vo.User_info;

@Controller
public class NContPrj {
	@Autowired(required=false)
	private NSerPrj service;
	
	@PostMapping("schByEmail")
    public ResponseEntity<User_info> schByEmail(@RequestParam(value="invEmail", 
    												defaultValue="failed") String email) {
    	return ResponseEntity.ok(service.schByEmail(email));
    }
}
