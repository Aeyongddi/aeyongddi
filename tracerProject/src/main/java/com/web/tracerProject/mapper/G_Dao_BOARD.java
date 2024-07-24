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
     
	// @Update("")
	 
//	 @Insert("INSERT INTO BOARD values(#{'BID'||LPAD(BID_SEQ.NEXTVAL, 5, '0') },#{title},#{content},"
//	 		+ "#{upt_date},#{views},#{btype},#{'CID'||LPAD(CID_SEQ.NEXTVAL, 5, '0')},#{email},#{sid})")
//	 int insertBoard(Board ins);
     
}