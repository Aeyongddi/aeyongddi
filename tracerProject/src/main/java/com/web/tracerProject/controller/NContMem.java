package com.web.tracerProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.tracerProject.service.NSerMem;
import com.web.tracerProject.vo.User_info;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class NContMem {
	@Autowired(required=false)
	private NSerMem service;
	@Autowired(required=false)
	private HttpSession session;
	// mem - 회원가입
	// http://localhost:5656/signup
	@GetMapping("signup")
	public String signupFrm(User_info user_info) {
		return "tracerPages/signup";
	}
	@PostMapping("signup")
	public String signup(User_info user_info, Model d) {
		String msg = service.insMember(user_info);
		d.addAttribute("msg", msg);
		if(msg=="회원가입성공")
			return "tracerPages/signupSuccess";
		else	return "tracerPages/signup";
	}
	// http://localhost:5656/signupSuccess
	@GetMapping("signupSuccess")
	public String signupSuccess() {
		return "tracerPages/signupSuccess";
	}
		
	// mem - 로그인
	// http://localhost:5656/login
	@GetMapping("login")
	public String loginFrm(User_info user_info) {
		return "tracerPages/login";
	}
	
	// mem - 로그아웃
	@GetMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.invalidate();
		return "tracerPages/login";
	}
	// mem - 비밀번호 초기화
	// http://localhost:5656/reset_password
	@GetMapping("reset_password")
	public String reset_password(){
		return "tracerPages/reset-password";
	}
	// mem - 비밀번호 변경
	// http://localhost:5656/account
	@GetMapping("account")
	public String account(User_info user_info, Model d) {
		d.addAttribute("user_info", session.getAttribute("info"));
		return "tracerPages/account";
	}
	// http://localhost:5656/chgPwd
	@GetMapping("chgPwd")
	public String chgPwdFrm() {
		return "tracerPages/chgPwd";
	}
	@PostMapping("chgPwd")
	public ResponseEntity<String> chgPwd(@RequestParam("password") String password,
											@RequestParam("email") String email) {
		return ResponseEntity.ok(service.chgPwd(password, email));
	}
}
