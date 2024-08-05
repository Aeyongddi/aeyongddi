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
    
    @Update("UPDATE ResourceManage SET USED_BUDGET = USED_BUDGET + #{amount} WHERE PID = #{pid} AND RTYPE = 'BUDGET'")
    void increaseUsedBudget(@Param("pid") String pid, @Param("amount") BigDecimal amount);

    @Insert("INSERT INTO ResourceManage (RID, PID, RTYPE, SOFTWARE_NAME, LICENSE_PURCHASE_DATE, LICENSE_EXPIRY_DATE, SOFTWARE_PRICE) " +
            "VALUES (#{rid}, #{pid}, #{rtype}, #{software_name}, #{license_purchase_date}, #{license_expiry_date}, #{software_price})")
    void addAsset(@Param("rid") String rid, 
                  @Param("pid") String pid, 
                  @Param("rtype") String rtype, 
                  @Param("software_name") String software_name, 
                  @Param("license_purchase_date") String license_purchase_date, 
                  @Param("license_expiry_date") String license_expiry_date, 
                  @Param("software_price") BigDecimal software_price);

    @Select("SELECT 'R' || LPAD(ResourceManageSeq.NEXTVAL, 3, '0') FROM DUAL")
    String generateRid();
}
