package com.web.tracerProject.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.tracerProject.vo.User_info;

@Mapper
public interface NDaoMem {
	
	// mem - 회원가입
	@Insert("INSERT INTO USER_INFO \r\n"
			+ "VALUES(#{email}, #{password}, "
			+ "#{nickname}, #{name}, #{birth}, #{phone})")
	int insMember(User_info user_info);
	
	// mem - 비밀번호변경
	@Update("UPDATE USER_INFO\r\n"
			+ "SET PASSWORD = #{password}\r\n"
			+ "WHERE EMAIL = #{email}")
	int chgPwd(@Param("password") String password, 
			@Param("email") String email);
}