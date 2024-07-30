package com.web.tracerProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.tracerProject.service.NSerPrj;
import com.web.tracerProject.vo.Project;
import com.web.tracerProject.vo.Team;
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
    @PostMapping("createPrj")
    public ResponseEntity<String> createPrj(Project project) {
    	return ResponseEntity.ok(service.createPrj(project));
    }
    @PostMapping("createPrjTeam")
    public ResponseEntity<String> createPrjTeam(Team team) {
    	return ResponseEntity.ok(service.createPrjTeam(team));
    }
    @PostMapping("getCurrPid")
    public ResponseEntity<String> getCurrPid() {
    	return ResponseEntity.ok(service.getCurrPid());
    }
    @PostMapping("alreadyWorking")
    public ResponseEntity<Boolean> alreadyWorking(User_info user_info) {
    	return ResponseEntity.ok(service.alreadyWorking(user_info));
    }
}
