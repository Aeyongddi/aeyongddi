package com.web.tracerProject.mapper;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Insert;

import com.web.tracerProject.vo.Project;
import com.web.tracerProject.vo.ResourceManage;
import com.web.tracerProject.vo.Team;
import com.web.tracerProject.vo.User_info;

@Mapper
public interface JDaoResource {
    @Select("SELECT * FROM USER_INFO")
    List<User_info> getAllUsersInfo();

    @Select("SELECT * FROM TEAM WHERE email = #{email}")
    List<Team> getTeamsByEmail(@Param("email") String email);

    @Select("SELECT p.* FROM PROJECT p JOIN TEAM t ON p.PID = t.PID WHERE t.EMAIL = #{email}")
    List<Project> getProjectsByEmail(@Param("email") String email);

    @Select("SELECT assigned_budget, used_budget FROM ResourceManage WHERE rtype = 'BUDGET' AND pid = #{pid}")
    ResourceManage getBudget(String pid);
    
    @Select("SELECT * FROM PROJECT")
    List<Project> getAllProjects();
    
    @Select("SELECT rtype, software_name, license_purchase_date, license_expiry_date, software_price FROM ResourceManage WHERE rtype IN ('LICENSE', 'FEE', 'EQUIPMENT')")
    List<ResourceManage> getAllAssets();
    
    @Select("SELECT ResourceManageSeq.NEXTVAL FROM DUAL")
    int getNextRid();

    @Insert("INSERT INTO ResourceManage (rid, pid, rtype, software_name, license_purchase_date, license_expiry_date, software_price) VALUES (#{rid}, #{pid}, #{rtype}, #{software_name}, #{license_purchase_date}, #{license_expiry_date}, #{software_price})")
    void addAsset(ResourceManage asset);

    @Update("UPDATE ResourceManage SET used_budget = used_budget + #{software_price} WHERE pid = #{pid} AND rtype = 'BUDGET'")
    void increaseUsedBudget(@Param("pid") String pid, @Param("software_price") BigDecimal software_price);
}
