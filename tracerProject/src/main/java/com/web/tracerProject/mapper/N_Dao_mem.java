package com.web.tracerProject.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface N_Dao_mem {
	
	@Select("SELECT COUNT(*)\r\n"
			+ "FROM USER_INFO\r\n"
			+ "WHERE email=#{email}\r\n"
			+ "AND password=#{password}") 
	String schMember();
	
}