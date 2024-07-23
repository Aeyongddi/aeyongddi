package com.web.tracerProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.web.tracerProject.vo.Board;

@Mapper
public interface G_Dao_BOARD {
	
     @Select("SELECT * FROM BOARD")
     List<Board> getBoardList(Board sch);
     
//     @Select("SELECT * FROM BOARD \r\n"
//     		+ "WHERE title LIKE '%'||#{title}||'%',\r\n"
//     		+ "AND BID LIKE '%'||#{bid}||'%'")
//     List<Board> getBoardSearch(@Param("sch") Board sch);
     
    
     
    
}
