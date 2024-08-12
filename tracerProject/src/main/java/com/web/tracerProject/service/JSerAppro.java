package com.web.tracerProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.JDaoAppro;
import com.web.tracerProject.vo.Approval;

@Service
public class JSerAppro {

    @Autowired
    private JDaoAppro jDaoAppro;

    public void requestApproval(Approval approval) {
        String apid = jDaoAppro.generateApid(); // APID 생성
        approval.setApid(apid);
        jDaoAppro.insertApproval(approval);
    }

    public List<Approval> getAllApprovals() {
        return jDaoAppro.getAllApprovals();
    }
    
    public List<Approval> getApprovalsByStatus(String status) {
        return jDaoAppro.getApprovalsByStatus(status);
    }
    
    public List<Approval> getApprovalsBySid(String sid) {
        return jDaoAppro.getApprovalsBySid(sid);
    }

    public void updateApprovalStatus(String apid, String status) {
        jDaoAppro.updateApprovalStatus(apid, status);
    }
}

