package com.web.tracerProject.mapper;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Delete;

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

    @Select("SELECT rm.*, p.title as projectTitle FROM ResourceManage rm LEFT JOIN Project p ON rm.pid = p.pid WHERE rm.rtype IN ('LICENSE', 'FEE', 'EQUIPMENT')")
    List<ResourceManage> getAllAssets();

    @Update("UPDATE ResourceManage SET assigned_budget = assigned_budget + #{amount} WHERE pid = #{pid} AND rtype = 'BUDGET'")
    void addBudget(@Param("pid") String pid, @Param("amount") BigDecimal amount);

    @Update("UPDATE ResourceManage SET assigned_budget = assigned_budget - #{amount} WHERE pid = #{pid} AND rtype = 'BUDGET'")
    void reduceBudget(@Param("pid") String pid, @Param("amount") BigDecimal amount);

    @Insert("INSERT INTO ResourceManage (rid, pid, rtype, assigned_budget) VALUES (#{rid}, #{pid}, 'BUDGET', #{amount})")
    void assignBudget(@Param("rid") String rid, @Param("pid") String pid, @Param("amount") BigDecimal amount);

    @Select("SELECT MAX(CAST(SUBSTR(rid, 2) AS INT)) FROM ResourceManage")
    Integer getMaxRid();
    
    @Insert("INSERT INTO ResourceManage (rid, pid, rtype, software_name, license_purchase_date, license_expiry_date, software_price) VALUES (#{rid}, #{pid}, #{rtype}, #{software_name}, #{license_purchase_date}, #{license_expiry_date}, #{software_price})")
    void addAsset(ResourceManage asset);

    @Update("UPDATE ResourceManage SET used_budget = used_budget + #{amount} WHERE pid = #{pid} AND rtype = 'BUDGET'")
    void updateUsedBudget(@Param("pid") String pid, @Param("amount") BigDecimal amount);

    @Insert("INSERT INTO USER_INFO (email, password, nickname, name, birth, phone) VALUES (#{email}, #{password}, #{nickname}, #{name}, #{birth}, #{phone})")
    void addUser(User_info user);

    @Select("SELECT * FROM USER_INFO WHERE email = #{email}")
    User_info getUserByEmail(String email);

    @Update("UPDATE USER_INFO SET name = #{name}, birth = #{birth}, phone = #{phone}, nickname = #{nickname}, password = #{password} WHERE email = #{email}")
    void updateUser(User_info user);

    @Delete("DELETE FROM USER_INFO WHERE email = #{email}")
    void deleteUser(String email);

    @Select("SELECT * FROM PROJECT")
    List<Project> getAllProjects();
    
    @Select("SELECT p.* FROM PROJECT p LEFT JOIN ResourceManage r ON p.pid = r.pid AND r.rtype = 'BUDGET' WHERE r.assigned_budget IS NULL OR r.assigned_budget = 0")
    List<Project> getProjectsWithNoBudget();
}
