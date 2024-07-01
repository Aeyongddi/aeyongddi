package hahaha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hahaha.dao.Hae_dao;
import hahaha.vo.Employee;

@Service
public class Hae_service {
	
	// CRUD(create read update delete) 등록 조회 수정 삭제..
	
	// 컨테이너에 있는 객체는 자동을 할당 처리 
	// required=false는 혹시, 이 객체가 없더라도 객체가 없을 때, 종속된 메서드 호출시 
	// 발생하는 nullpointerexception 방지 처리..
	@Autowired(required=false)
	private Hae_dao dao;
	
	// login
	public String chkUser(Employee chk) {
		if(chk.getPassword()==null)	chk.setPassword("");
		return dao.chkUser(chk)>0?"로그인성공":"로그인실패";
	}
	public String getUserName(Employee emp) {
		return dao.getUserName(emp);
	}
	public int getUserSalary(Employee emp) {
		return dao.getUserSalary(emp);
	}
	public String getUserPassword(Employee emp) {
		return dao.getUserPassword(emp);
	}
	// logout
	public String logout() {
		return "로그아웃";
	}
	
	// chgPwd
	public int chgPwd(String pwd) {
		return dao.chgPwd(pwd);
	}
	
	// humanRsrc
	public List<Employee> getEmpList(Employee emp) {
		return dao.getEmpList(emp);
	}
	public List<Employee> getEmpSchList(Employee sch){
		if(sch.getDepartment()==null)	sch.setDepartment("");
		if(sch.getPosition()==null)	sch.setPosition("");
		if(sch.getName()==null)	sch.setName("");
		return dao.getEmpSchList(sch);
	}
	
	// humanRsrc Detail
	public Employee getEmp(Employee emp) {
		return dao.getEmp(emp);
	}
	
	//new Insert
	public String insEmployee(Employee ins) {
		return dao.insEmployee(ins)>0?"직원등록성공":"직원등록실패";
	}
	
	
	
	
	
	
	
	
}
