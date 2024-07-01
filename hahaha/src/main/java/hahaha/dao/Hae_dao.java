package hahaha.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import hahaha.vo.Employee;
import hahaha.vo.Salary;

public interface Hae_dao {
	
	// login dao
	@Select("SELECT count(*) "
			+ "from nw.employee "
			+ "where user_employee_id = #{user_employee_id} "
			+ "and password = #{password} ")
	int chkUser(Employee chk);
	@Select("SELECT username "
			+ "from nw.employee "
			+ "where user_employee_id = #{user_employee_id} ")
	String getUserName(Employee emp);
	@Select("SELECT password "
			+ "from nw.employee "
			+ "where user_employee_id = #{user_employee_id} ")
	String getUserPassword(Employee emp);
	
	// human Resource dao
	@Select("select * from nw.employee ")
	List<Employee> getEmpList(Employee emp);
	@Select("select * from nw.employee "
			+ "where department like '%' || #{department} || '%' "
			+ "and position like '%' || #{position} || '%' "
			+ "and name like '%' || #{name} || '%'")
	List<Employee> getEmpSchList(Employee sch);
	
	// new Insert dao
	@Insert("insert into nw.employee values(#{user_employee_id}, #{name}, #{email}, "
			+ "#{phone}, #{address}, \r\n"
			+ "#{username}, '1111', #{role}, #{position}, #{department} )")
	int insEmployee(Employee ins);
	
	@Insert("insert into nw.salary values(#{salary_id}, #{employee_id}, sysdate, sysdate, 2000000)")
	int insSalary(Salary ins);
	
	// human Resource Detail dao
	@Select("select * from nw.employee "
			+ "where user_employee_id = #{user_employee_id}")
	Employee getEmp(Employee emp);
	
	@Update("update nw.employee "
			+ "set name=#{name}, "
			+ "email=#{email}, "
			+ "phone=#{phone}, "
			+ "address=#{address}, "
			+ "department=#{department}, "
			+ "position=#{position} ")
	int uptEmployee(Employee upt);
	
	
	
	// salary Check dao
	@Select("select amount from nw.salary "
			+ "where employee_id = #{user_employee_id}")
	int getUserSalary(Employee emp);
	
	// my information dao
	@Select("select * from nw.employee "
			+ "where employee_id = #{user_employee_id}")
	int getMyInfo(Employee emp);
	
	// Change Password dao
	@Select("select password from nw.employee "
			+ "where employee_id = #{user_employee_id}")
	String getPwd();
	@Update("update nw.employee "
			+ "set password = #{chgPwd}")
	int chgPwd(@Param("chgPwd") String pwd);
}

