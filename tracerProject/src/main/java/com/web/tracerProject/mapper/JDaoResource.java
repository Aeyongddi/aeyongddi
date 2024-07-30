package com.web.tracerProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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
    
    @Select("SELECT software_name AS softwareName, license_purchase_date AS licensePurchaseDate, license_expiry_date AS licenseExpiryDate, software_price AS softwarePrice FROM ResourceManage WHERE rtype = 'SOFTWARE'")
    List<ResourceManage> getAllAssets();
}
