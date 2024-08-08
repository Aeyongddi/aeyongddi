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

    @Update("UPDATE BOARD SET BID=#{bid}, title=#{title}, content=#{content}, views=#{views}, btype=#{btype}, email=#{email}, sid=#{sid}, is_end=#{is_end} WHERE bid=#{bid}")
    int updateBoard(Board upt);
    
    @Update("UPDATE BOARD SET endYN = #{endYN} WHERE bid = #{bid}")
    int updateBoardStatus(@Param("bid") String bid, @Param("endYN") boolean endYN);

    @Insert("INSERT INTO BOARD (bid, title, content, upt_date, views, btype, cid, email, sid, endYN) " +
            "VALUES ('B'||LPAD(BID_SEQ.NEXTVAL, 5, '0'), #{title}, #{content}, #{upt_date}, #{views}, #{btype}, #{cid}, #{email}, #{sid}, #{endYN})")
    int insertBoard(Board board);
    
//    @Insert("INSERT INTO BOARD2 (bid, endYN) VALUES (#{bid}, #{endYN})")
//    int insertBoard1(@Param("bid") String bid, @Param("endYN") boolean endYN);

//    @Insert("INSERT INTO BOARD (bid, title, upt_date, email,  endYN) " +
//            "VALUES (#{bid}, #{title}, SYSDATE, #{email}, #{endYN})")
    

    @Delete("DELETE FROM board WHERE bid = #{bid}")
    int deleteBoard(@Param("bid") String bid);
     
    @Delete({
        "<script>",
        "DELETE FROM BOARD2 WHERE bid IN",
        "<foreach collection='bids' item='bid' open='(' separator=',' close=')'>",
        "#{bid}",
        "</foreach>",
        "</script>"
    })
    int deleteBoardsByBids(@Param("bids") List<String> bids);
    
    
//    @Select("SELECT 'B' || LPAD(TO_CHAR(TO_NUMBER(MAX(SUBSTR(bid, 2))) + 1), 3, '0') FROM board2")
//	String getBid();
    
//    @Select("SELECT 'B' || LPAD(TO_CHAR(board2_seq.NEXTVAL), 3, '0') FROM dual")
//    String getBid();
    
    
    
    
}