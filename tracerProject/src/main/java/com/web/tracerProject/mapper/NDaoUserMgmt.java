package com.web.tracerProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.tracerProject.vo.User_info;

@Mapper
public interface NDaoUserMgmt {
	@Select("""
			SELECT *
			FROM USER_INFO
			""")
	List<User_info> getUserInfo();
	@Select("""
			SELECT *
			FROM USER_INFO
			WHERE NAME LIKE '%'||#{name}||'%'
			AND AUTH LIKE '%'||#{auth}||'%'
			""")
	List<User_info> schUserInfo(@Param("name") String name, 
									@Param("auth") String auth);
	@Update("""
			UPDATE USER_INFO
			SET AUTH = #{auth}
			WHERE EMAIL = #{email}
			""")
	int uptUser(@Param("auth") String auth, @Param("email") String email);
	@Delete("""
			DELETE FROM USER_INFO
			WHERE EMAIL = #{email}
			""")
	int delUser(@Param("email") String email);
}