package com.web.tracerProject.service;

import java.time.LocalDateTime;
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
        approval.setRequestDateTime(LocalDateTime.now()); // 요청 시간 설정
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
        jDaoAppro.updateApprovalStatus(apid, status, LocalDateTime.now()); // 상태 변경 시간 설정
    }

    public void updateApprovalStatus(String apid, String status, String reason) throws Exception {
        Approval approval = jDaoAppro.getApprovalById(apid);
        if (approval == null) {
            throw new Exception("해당 결재 요청을 찾을 수 없습니다.");
        }

        approval.setApprovalStatus(status);
        if ("보류".equals(status)) {
            approval.setRejectReason(reason);
        }

        jDaoAppro.updateApprovalStatusWithReason(apid, status, reason);
    }
}
