package hahaha.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import hahaha.vo.Board;

public interface BoardDao {
    @Select("SELECT * FROM CUSTOMERQNA")
    List<Board> getBoardList(Board sch);

    @Select("SELECT * FROM CUSTOMERQNA WHERE inquiry_id = #{inquiry_id}")
    Board getBoard(int inquiry_id);

    @Insert("INSERT INTO CUSTOMERQNA (inquiry_id, customer_id, title, content, response, status) VALUES (customerqna_seq.nextval, #{customer_id}, #{title}, #{content}, #{response}, #{status})")
    int boardInsert(Board ins);
    
    @Update("UPDATE CUSTOMERQNA\r\n"
    		+ "SET response = #{response},\r\n"
    		+ "	status = #{status}\r\n"
    		+ "WHERE inquriy_id = #{inquiry_id} ")
    int updateBoard(Board upt);
}
