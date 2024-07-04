package hahaha.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import hahaha.vo.Employee;

public interface Hae_dao {
	
	// login dao
	@Select("SELECT count(*) "
			+ "from nw.employee "
			+ "where user_employee_id = #{user_employee_id} "
			+ "and password = #{password} ")
	int chkUser(Employee chk);
	@Select("SELECT user_employee_id "
			+ "from nw.employee "
			+ "where user_employee_id = #{user_employee_id}")
	String getUserId(Employee sch);
	@Select("SELECT username "
			+ "from nw.employee "
			+ "where user_employee_id = #{user_employee_id} ")
	String getUserName(Employee emp);
	@Select("SELECT password "
			+ "from nw.employee "
			+ "where user_employee_id = #{user_employee_id} ")
	String getUserPassword(Employee emp);
	// human Resource dao
	@Select("select * from nw.employee order by position")
	List<Employee> getEmpList(Employee emp);
	@Select("select * from nw.employee "
			+ "where department like '%' || #{department} || '%' "
			+ "and position like '%' || #{position} || '%' "
			+ "and name like '%' || #{name} || '%'")
	List<Employee> getEmpSchList(Employee sch);
	
	// new Insert dao
	@Insert("insert into nw.employee values(nw.seq_emp_id.nextVAL, #{name}, #{email}, "
			+ "#{phone}, #{address}, \r\n"
			+ "#{username}, '1111', #{role}, #{position}, #{department} )")
	int insEmployee(Employee ins);
	
	@Insert("insert into nw.salary values(nw.seq_sal_id.nextVAL, nw.seq_emp_id.currVAL, sysdate, sysdate, 2500000)")
	int insSalary(Employee ins);
	
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
			+ "position=#{position} "
			+ "where user_employee_id = #{user_employee_id}")
	int uptEmployee(Employee upt);
	@Delete("delete from nw.employee "
			+ "where user_employee_id = #{user_employee_id}")
	int delEmployee(Employee del);
	
	
	
	// salary Check dao
	@Select("select amount from nw.salary "
			+ "where employee_id = #{user_employee_id}")
	int getUserSalary(Employee emp);
	
	// my information dao
	@Select("select * from nw.employee "
			+ "where user_employee_id = ${user_employee_id}")
	Employee getMyInfo(Employee emp);
	@Update("update nw.employee "
			+ "set name=#{name}, "
			+ "email=#{email}, "
			+ "phone=#{phone}, "
			+ "address=#{address} "
			+ "where user_employee_id = #{user_employee_id}")
	int uptMyInfo(Employee upt);
	@Delete("delete from nw.employee "
			+ "where user_employee_id = #{user_employee_id}")
	int delMyInfo(Employee del);
	
	// Change Password dao
	@Select("select password from nw.employee "
			+ "where employee_id = #{user_employee_id}")
	String getPwd();
	@Update("update nw.employee "
			+ "set password = #{chgPwd}")
	int chgPwd(@Param("chgPwd") String pwd);
}

