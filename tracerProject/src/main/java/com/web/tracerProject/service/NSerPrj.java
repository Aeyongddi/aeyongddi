package com.web.tracerProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.NDaoPrj;
import com.web.tracerProject.vo.Project;

@Service
public class NSerPrj {
	@Autowired(required=false)
	private NDaoPrj dao;
	
	
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
