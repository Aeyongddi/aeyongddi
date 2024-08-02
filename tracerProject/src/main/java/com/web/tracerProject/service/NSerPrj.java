package com.web.tracerProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.NDaoPrj;
import com.web.tracerProject.vo.Project;
import com.web.tracerProject.vo.Team;
import com.web.tracerProject.vo.User_info;

@Service
public class NSerPrj {
	@Autowired(required=false)
	private NDaoPrj dao;
	
	public User_info schByEmail(String email) {
		return dao.schByEmail(email);
	}
	public String createPrj(Project project) {
		return dao.createPrj(project)>0?"프로젝트생성성공":"프로젝트생성실패";
	}
	public String createPrjTeam(Team team) {
		return dao.createPrjTeam(team)>0?"팀생성성공":"팀생성실패";
	}
	public String getCurrPid() {
		return dao.getCurrPid();
	}
	public boolean alreadyWorking(User_info user_info) {
		return dao.alreadyWorking(user_info)>0?true:false;
	}
	public List<Project> getProject(){
		return dao.getProject();
	}
	public List<Project> schProject(String prjTitle){
		return dao.schProject(prjTitle);
	}
	public List<Project> delPrj(String pid) {
		dao.delPrj(pid);
		return dao.schProject("");
	}
}
