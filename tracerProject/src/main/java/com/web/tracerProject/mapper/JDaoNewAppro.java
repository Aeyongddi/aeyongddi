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

    @Select("SELECT * FROM \"C##JH\".\"APPROVAL\"")
    List<Approval> findAllApprovals();

    @Insert("INSERT INTO \"C##JH\".\"APPROVAL\" (\"APID\", \"APPROVALSTATUS\", \"REQUESTDATETIME\", \"STATUSUPDATEDATETIME\", \"FEEDBACK\", \"TKID\", \"UPFILE\", \"EMAIL\", \"CONTENT\") " +
            "VALUES (#{apid}, #{approvalStatus}, #{requestDateTime}, #{statusUpdateDateTime}, #{feedback}, #{tkid}, #{upfile}, #{email}, #{content})")
    void insertApproval(Approval approval);

    @Update("UPDATE \"C##JH\".\"APPROVAL\" SET \"APPROVALSTATUS\" = #{approvalStatus}, \"STATUSUPDATEDATETIME\" = #{statusUpdateDateTime}, \"FEEDBACK\" = #{feedback} WHERE \"APID\" = #{apid}")
    void updateApproval(Approval approval);

    @Select("SELECT * FROM \"C##JH\".\"APPROVAL\" WHERE \"APID\" = #{apid}")
    Approval findApprovalById(String apid);

    @Update("UPDATE \"C##JH\".\"APPROVAL\" SET \"FEEDBACK\" = #{feedback} WHERE \"APID\" = #{apid}")
    void updateFeedback(@Param("apid") String apid, @Param("feedback") String feedback);

    @Select("SELECT * FROM \"C##JH\".\"APPROVAL\" WHERE \"TKID\" = #{tkid}")
    Approval findApprovalByTaskId(String tkid);
}
