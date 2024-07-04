package hahaha.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hahaha.service.Hae_service;
import hahaha.vo.Employee;

@Controller("ctrl02")
public class Hae_controller {
	@Autowired
	private HttpServletRequest request;
	
	@Autowired(required=false)
	private Hae_service service;
	
	// http://localhost:7080/humanAirERP/test1.do
	@RequestMapping("header.do")
	public String header() {
		
		
		return "header";
	}
	
	
	// http://localhost:7080/hahaha/login.do
	@RequestMapping("login.do")
	public String login() {
		return "login";
	}
	@RequestMapping("loginChk.do")
	public String loginChk(Employee emp, Model d) {
		d.addAttribute("isUser", service.chkUser(emp));
		String username = service.getUserName(emp);
		String userPassword = service.getUserPassword(emp);
		String userId = service.getUserId(emp);
		int amount = service.getUserSalary(emp);
		HttpSession session = request.getSession(true);
		session.setAttribute("username", username);
		session.setAttribute("amount", amount);
		session.setAttribute("userPwd", userPassword);
		session.setAttribute("userId", userId);
		return "jsonView";
	}
	@RequestMapping("logout.do")
	public String logout() {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "login";
	}
	
	
	// http://localhost:7080/humanAirERP/chgPwd.do
	@RequestMapping("chgPwd.do")
	public String chgPwd() {
		return "chgPwd";
	}
	@RequestMapping("chgPwdSuccess.do")
	public String chgPwdSuccess(@RequestParam("chgPwd") String pwd) {
		
		service.chgPwd(pwd);
		return "login";
	}
	
	
	// http://localhost:7080/humanAirERP/salChk.do
	@RequestMapping("salChk.do")
	public String salChk() {
		return "salChk";
	}
	
	// http://localhost:7080/humanAirERP/humanRsrc.do
	@RequestMapping("humanRsrc.do")
	public String humanRsrc(Employee emp, Model d) {
		d.addAttribute("empList", service.getEmpList(emp));
		return "humanRsrc";
	}
	@RequestMapping("humanRsrcSch.do")
	public String humanRsrcSch(Employee emp, Model d) {
		d.addAttribute("empList", service.getEmpSchList(emp));
		return "humanRsrc";
	}
	
	// http://localhost:7080/humanAirERP/newInsertFrm.do
	@RequestMapping("newInsertFrm.do")
	public String newInsertFrm() {
		return "newInsert";
	}
	// http://localhost:7080/humanAirERP/newInsert.do
	@RequestMapping("newInsert.do")
	public String newInsert(Employee emp, Model d) {
		service.insEmployee(emp);
		service.insSalary(emp);
		d.addAttribute("empList", service.getEmpList(emp));
		return "humanRsrc";
	}
	
	
	// http://localhost:7080/humanAirERP/humanRsrcDetail.do
	@RequestMapping("humanRsrcDetail.do")
	public String humanRsrcDetail(Employee emp, Model d) {
		d.addAttribute("emp", service.getEmp(emp));
		return "humanRsrcDetail";
	}
	@RequestMapping("uptEmployee.do")
	public String uptEmployee(Employee emp, Model d) {
		service.uptEmployee(emp);
		d.addAttribute("empList", service.getEmpList(emp));
		return "humanRsrc";
	}
	@RequestMapping("delEmployee.do")
	public String delEmployee(Employee emp, Model d) {
		service.delEmployee(emp);
		d.addAttribute("empList", service.getEmpList(emp));
		return "humanRsrc";
	}
	
	// http://localhost:7080/humanAirERP/myInfo.do
	@RequestMapping("myInfo.do")
	public String myInfo(Employee emp, Model d) {
		HttpSession session = request.getSession(true);
		emp.setUser_employee_id(Integer.parseInt((String)session.getAttribute("userId")));
		d.addAttribute("emp", service.getMyInfo(emp));
		return "myInfo";
	}
	@RequestMapping("myInfoUpt.do")
	public String myInfoUpt(Employee emp, Model d) {
		d.addAttribute("empList", service.getEmpList(emp));
		service.uptMyInfo(emp);
		return "humanRsrc";
	}
	@RequestMapping("myInfoDel.do")
	public String myInfoDel(Employee emp) {
		service.delMyInfo(emp);
		return "login";
	}
}
