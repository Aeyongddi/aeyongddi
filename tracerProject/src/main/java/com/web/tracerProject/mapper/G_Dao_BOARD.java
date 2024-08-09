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
	// 조회하는 코드
    @Select("SELECT * FROM BOARD ORDER BY bid")
    List<Board> getBoardList();
    
    // 업데이트하는 코드
    @Update("UPDATE BOARD SET title=#{title}, content=#{content}, endYN=#{endYN}, up=#{up} WHERE bid=#{bid}")
    int updateBoard(Board upt);
    
    // 실시간으로 진행중 / 완료 하는코드
    @Update("UPDATE BOARD SET endYN = #{endYN} WHERE bid = #{bid}")
    int updateBoardStatus(@Param("bid") String bid, @Param("endYN") boolean endYN);
   
    // 등록하는 코드
    @Insert("INSERT INTO BOARD (bid, title, content, upt_date, views, btype, cid, email, sid, endYN, uf, name) " +
            "VALUES ('B'||LPAD(BID_SEQ.NEXTVAL, 5, '0'), #{title}, #{content}, #{upt_date}, #{views}, #{btype}, " +
            "#{cid}, #{email}, #{sid}, #{endYN}, #{uf}, #{name})")
    int insertBoard(Board board);
    
    // 검색하는 코드 <select> 사용해서 제목 작성자 나누어서 검색하는 코드
    @Select("<script>" +
            "SELECT * FROM BOARD" +
            "<where>" +
            "<if test='searchType != null and searchText != null'>" +
            "  AND ${searchType} LIKE '%' || #{searchText} || '%'" +
            "</if>" +
            "</where>" +
            "ORDER BY bid" +
            "</script>")
    List<Board> search(@Param("searchText") String searchText, @Param("searchType") String searchType);
   
    // 삭제 하는 코드
    @Delete("DELETE FROM board WHERE bid = #{bid}")
    int deleteBoard(@Param("bid") String bid);
    
    
    
    
    
}