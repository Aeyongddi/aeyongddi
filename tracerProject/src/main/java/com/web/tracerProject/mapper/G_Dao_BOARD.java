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
    @Select("SELECT * FROM BOARD ORDER BY bid")
    List<Board> getBoardList();

    @Select("SELECT * FROM BOARD WHERE TITLE LIKE '%' || #{sch.title} || '%' AND BID LIKE '%' || #{sch.bid} || '%'")
    List<Board> getBoardSearch(@Param("sch") Board sch);

    @Update("UPDATE BOARD SET title=#{title}, content=#{content}, upt_date=#{upt_date}, views=#{views}, btype=#{btype}, email=#{email}, sid=#{sid}, is_end=#{is_end} WHERE bid=#{bid}")
    int updateBoard(Board upt);

//    @Insert("INSERT INTO BOARD (bid, title, content, upt_date, views, btype, cid, email, sid, ENDYN) " +
//            "VALUES (#{bid}, #{title}, #{content}, SYSDATE, #{views}, #{btype}, #{cid}, #{email}, #{sid}, #{endYN})")
    @Insert("INSERT INTO BOARD (bid, title, content, upt_date, cld, email, sld, endYN) " +
            "VALUES (#{bid}, #{title}, #{content}, SYSDATE, #{cld}, #{email}, #{sld}, #{endYN})")
    int insertBoard(Board ins);

    @Delete("DELETE FROM BOARD WHERE bid = #{bid}")
    int deleteBoard(@Param("bid") int bid);

    @Select("SELECT 'B' || LPAD(TO_CHAR(TO_NUMBER(MAX(SUBSTR(bid, 2))) + 1), 3, '0') FROM board")
	String getBid();

}