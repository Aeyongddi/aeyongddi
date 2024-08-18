package com.web.tracerProject.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tracerProject.mapper.JDaoNewAppro;
import com.web.tracerProject.vo.Approval;

@Service
public class JSerNewAppro {

    @Autowired(required = false)
    private JDaoNewAppro dao;

    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

    public List<Approval> getAllApprovals() {
        List<Approval> approvals = dao.findAllApprovals();

        for (Approval approval : approvals) {
            if (approval.getRequestDateTime() != null) {
                approval.setFormattedRequestDateTime(approval.getRequestDateTime().format(formatter));
            }
            if (approval.getStatusUpdateDateTime() != null) {
                approval.setFormattedUpdateDateTime(approval.getStatusUpdateDateTime().format(formatter));
            }
        }

        return approvals;
    }

    public void addApproval(Approval approval) {
        approval.setRequestDateTime(LocalDateTime.now());
        dao.insertApproval(approval);
    }

    public void updateApprovalStatus(Approval approval) {
        approval.setApprovalStatus("결재 대기");
        approval.setStatusUpdateDateTime(LocalDateTime.now());
        dao.updateApproval(approval);
    }

    public List<Approval> getApprovalsByTaskId(String tkid) {
        List<Approval> approvals = dao.findApprovalsByTaskId(tkid);

        for (Approval approval : approvals) {
            if (approval != null) {
                // 필요에 따라 피드백 처리
                approval.setFeedback(approval.getFeedback().replace("\n", "<br/>"));
            }
        }

        return approvals;
    }

    public void updateUserFeedback(String apid, String userFeedback) {
        // 기존 피드백에 새로운 피드백을 추가하는 로직
        Approval approval = dao.findApprovalById(apid);
        String updatedFeedback = approval.getFeedback() + "\n" + userFeedback;  // 피드백 추가
        dao.updateFeedback(apid, updatedFeedback);
    }
    
    public Approval getApprovalWithEmail(String apid) {
        return dao.getApprovalWithEmail(apid);
    }
}
