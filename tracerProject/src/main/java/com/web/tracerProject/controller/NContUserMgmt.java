package com.web.tracerProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.tracerProject.service.NSerUserMgmt;
import com.web.tracerProject.vo.User_info;

@Controller
public class NContUserMgmt extends NContBase{
	@Autowired(required=false)
	NSerUserMgmt service;
	    @GetMapping("userManagement")
	    public String prjList(User_info user_info, Model d) {
	    	d.addAttribute("users", service.getUser_info());
	    	return "tracerPages/user-management";
	    }
	    @PostMapping("userList")
	    public ResponseEntity<List<User_info>> schPrjList(@RequestParam("name") String name, 
															@RequestParam("auth") String auth) {
	    	return ResponseEntity.ok(service.schUserInfo(name, auth));
	    }
	    @PostMapping("delUser")
	    public ResponseEntity<List<User_info>> delUser(@RequestParam("name") String name, 
														@RequestParam("auth") String auth,
														@RequestParam("email") String email) {
	    	return ResponseEntity.ok(service.delUser(name, auth, email));
	    }
	    @PostMapping("uptUser")
	    public ResponseEntity<String> uptUser(@RequestParam("auth") String auth,
	    												@RequestParam("email") String email) {
	    	return ResponseEntity.ok(service.uptUser(auth, email));
	    }
}
