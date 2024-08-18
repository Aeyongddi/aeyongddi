package com.web.tracerProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.tracerProject.vo.Approval;

@Mapper
public interface JDaoNewAppro {

    @Select("SELECT * FROM approval")
    List<Approval> findAllApprovals();

    @Insert("INSERT INTO APPROVAL (APID, APPROVALSTATUS, REQUESTDATETIME, STATUSUPDATEDATETIME, FEEDBACK, TKID, UPFILE, EMAIL) " +
            "VALUES ('APID'||LPAD(APID_SEQ.NEXTVAL, 4, '0'), #{approvalStatus,jdbcType=VARCHAR}, #{requestDateTime,jdbcType=TIMESTAMP}, " +
            "#{statusUpdateDateTime,jdbcType=TIMESTAMP}, #{feedback,jdbcType=VARCHAR}, #{tkid,jdbcType=VARCHAR}, " +
            "#{upfile,jdbcType=VARCHAR}, #{email,jdbcType=VARCHAR})")
    void insertApproval(Approval approval);

    @Update("UPDATE approval SET APPROVALSTATUS = #{approvalStatus}, STATUSUPDATEDATETIME = #{statusUpdateDateTime}, FEEDBACK = #{feedback} WHERE APID = #{apid}")
    void updateApproval(Approval approval);

    @Select("SELECT * FROM approval WHERE APID = #{apid}")
    Approval findApprovalById(String apid);

    @Update("UPDATE approval SET FEEDBACK = #{feedback} WHERE APID = #{apid}")
    void updateFeedback(@Param("apid") String apid, @Param("feedback") String feedback);

    @Select("SELECT * FROM approval WHERE TKID = #{tkid, jdbcType=VARCHAR}")
    List<Approval> findApprovalsByTaskId(@Param("tkid") String tkid);

    @Select("SELECT a.APID, a.APPROVALSTATUS, a.REQUESTDATETIME, a.STATUSUPDATEDATETIME, " +
            "a.FEEDBACK, a.TKID, a.UPFILE, u.EMAIL " +
            "FROM APPROVAL a " +
            "JOIN TASK t ON a.TKID = t.TKID " +
            "JOIN USER_INFO u ON t.EMAIL = u.EMAIL " +
            "WHERE a.APID = #{apid}")
    Approval getApprovalWithEmail(@Param("apid") String apid);
}
