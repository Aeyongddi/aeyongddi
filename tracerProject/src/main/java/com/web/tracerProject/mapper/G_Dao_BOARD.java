package com.web.tracerProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.tracerProject.vo.Board;

@Mapper
public interface G_Dao_BOARD {
    @Select("SELECT * FROM BOARD2 ORDER BY bid")
    List<Board> getBoardList();

    @Update("UPDATE BOARD2 SET title=#{title}, content=#{content}, upt_date=#{upt_date}, views=#{views}, btype=#{btype}, email=#{email}, sid=#{sid}, is_end=#{is_end} WHERE bid=#{bid}")
    int updateBoard(Board upt);
    
    @Update("UPDATE BOARD2 SET endYN = #{endYN} WHERE bid = #{bid}")
    int updateBoardStatus(@Param("bid") String bid, @Param("endYN") boolean endYN);


//    @Insert("INSERT INTO BOARD (bid, title, content, upt_date, views, btype, cid, email, sid, ENDYN) " +
//            "VALUES (#{bid}, #{title}, #{content}, SYSDATE, #{views}, #{btype}, #{cid}, #{email}, #{sid}, #{endYN})")
    @Insert("INSERT INTO BOARD2 (bid, title, upt_date, email,  endYN) " +
            "VALUES (#{bid}, #{title}, SYSDATE, #{email}, #{endYN})")
    int insertBoard(Board board);

    @Delete("DELETE FROM board2 WHERE title = #{title}")
    int deleteBoard(@Param("title") String title);

    @Delete({
        "<script>",
        "DELETE FROM BOARD2 WHERE title IN",
        "<foreach collection='titles' item='title' open='(' separator=',' close=')'>",
        "#{title}",
        "</foreach>",
        "</script>"
    })
    int deleteBoards(@Param("titles") List<String> titles);
    
    
    @Select("SELECT 'B' || LPAD(TO_CHAR(TO_NUMBER(MAX(SUBSTR(bid, 2))) + 1), 3, '0') FROM board2")
	String getBid();

    
    
}