package com.web.tracerProject.mapper;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.tracerProject.vo.Approval;

@Mapper
public interface JDaoAppro {

    @Select("SELECT * FROM APPROVAL")
    List<Approval> getAllApprovals();

    @Select("SELECT * FROM APPROVAL WHERE SID = #{sid}")
    List<Approval> getApprovalsBySid(@Param("sid") String sid);

    @Select("SELECT 'AP' || LPAD(approval_seq.NEXTVAL, 3, '0') FROM DUAL")
    String generateApid();

    @Insert("INSERT INTO APPROVAL (APID, CONTENT, EMAIL, APPROVALSTATUS, NICKNAME, REQUESTDATETIME) VALUES (#{apid}, #{content}, #{email}, #{approvalStatus}, #{nickname}, #{requestDateTime})")
    void insertApproval(Approval approval);

    @Update("UPDATE APPROVAL SET APPROVALSTATUS = #{status}, STATUSUPDATEDATETIME = #{statusUpdateDateTime} WHERE APID = #{apid}")
    void updateApprovalStatus(@Param("apid") String apid, @Param("status") String status, @Param("statusUpdateDateTime") LocalDateTime statusUpdateDateTime);

    @Update("UPDATE APPROVAL SET APPROVALSTATUS = #{approvalStatus}, STATUSUPDATEDATETIME = SYSTIMESTAMP, REJECTREASON = #{rejectReason} WHERE APID = #{apid}")
    int updateApprovalStatusWithReason(@Param("apid") String apid, @Param("approvalStatus") String approvalStatus, @Param("rejectReason") String rejectReason);

    @Select("SELECT * FROM APPROVAL WHERE APPROVALSTATUS = #{status}")
    List<Approval> getApprovalsByStatus(@Param("status") String status);

    @Select("SELECT * FROM APPROVAL WHERE APID = #{apid}")
    Approval getApprovalById(@Param("apid") String apid);
}
