package com.web.tracerProject.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.web.tracerProject.vo.User_info;

@Mapper
public interface NDaoPrj {
	// 참여 인원 추가
	@Select("SELECT *\r\n"
			+ "FROM USER_INFO\r\n"
			+ "WHERE EMAIL = #{invEmail}")
	User_info schByEmail(@Param("invEmail") String email);
	// 프로젝트 db 추가, 참여인원들 프로젝트db에 연결
}
