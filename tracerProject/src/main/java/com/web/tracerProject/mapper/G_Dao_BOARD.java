package com.web.tracerProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.tracerProject.vo.Board;

@Mapper
public interface G_Dao_BOARD {
	
	 @Select("SELECT * FROM BOARD ORDER BY bid")
	    List<Board> getBoardList();
     
	 @Select("SELECT * FROM BOARD \n"
			    + "WHERE TITLE LIKE '%' || #{sch.title} || '%' \n"
			    + "AND BID LIKE '%' || #{sch.bid} || '%'")
     List<Board> getBoardSearch(@Param("sch") Board sch);
     
	 @Update("UPDATE BOARD \r\n"
				+ "	SET bid = #{bid},\r\n"
				+ "		title=#{title},\r\n"
				+ "		content = #{content},\r\n"
				+ "		upt_date = #{UPT_DATE},\r\n"
				+ "		views = #{views},\r\n"
				+ "		btype = #{btype},\r\n"
				+ "		email = #{email}\r\n"
				+ "	WHERE sid = #{sid}")
	 int updateBoard(Board upt);
	 
	 @Insert("INSERT INTO BOARD values(#{bid},#{title},#{content},"
	 		+ "#{upt_date},#{views},#{btype},#{CID},#{email},#{sid})")
	 int insertBoard(Board ins);
     
}