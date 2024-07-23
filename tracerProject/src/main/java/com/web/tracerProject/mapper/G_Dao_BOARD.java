package com.web.tracerProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.web.tracerProject.vo.Board;

@Mapper
public interface G_Dao_BOARD {
	
	 @Select("SELECT * FROM BOARD ORDER BY bid")
	    List<Board> getBoardList();
     
	 @Select("SELECT * FROM BOARD \n"
			    + "WHERE TITLE LIKE '%' || #{sch.title} || '%' \n"
			    + "AND BID LIKE '%' || #{sch.bid} || '%' \n"
			    + "AND UPT_DATE BETWEEN TO_DATE('2022-07-01', 'YYYY-MM-DD') AND TO_DATE('2050-07-25', 'YYYY-MM-DD')")
     List<Board> getBoardSearch(@Param("sch") Board sch);
     
     
}