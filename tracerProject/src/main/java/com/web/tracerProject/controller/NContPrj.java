package com.web.tracerProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	// 프로젝트 생성
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
    
    // 프로젝트 조회
    
    @GetMapping("prjList")
    public String prjList(Project project, Model d) {
    	d.addAttribute("prjs", service.getProject());
    	return "tracerPages/prjList";
    }
    @PostMapping("prjList")
    public ResponseEntity<List<Project>> schPrjList(@RequestParam("prjTitle") String prjTitle) {
    	return ResponseEntity.ok(service.schProject(prjTitle));
    }
    @PostMapping("delPrj")
    public ResponseEntity<List<Project>> delPrj(@RequestParam("pid") String pid) {
    	return ResponseEntity.ok(service.delPrj(pid));
    }
}
