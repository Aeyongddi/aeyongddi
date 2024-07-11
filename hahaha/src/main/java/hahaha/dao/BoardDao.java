package hahaha.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import hahaha.vo.Board;
import hahaha.vo.Customer;

public interface BoardDao {
	   @Select("SELECT * FROM CUSTOMERQNA WHERE " +
	            "customer_id LIKE '%'||#{customer_id}||'%' " +
	            "AND status LIKE '%'||#{status}||'%'")
	    List<Board> getBoardList(@Param("customer_id") String customer_id, @Param("status") String status);
   
    @Select("SELECT * FROM CUSTOMERQNA WHERE inquiry_id = #{inquiry_id}")
    Board getBoard(int inquiry_id);
    
    @Select("SELECT * FROM CUSTOMER WHERE customer_id = #{customer_id}")
    Customer getCustomer(String customer_id); 

    @Insert("INSERT INTO CUSTOMERQNA (inquiry_id, customer_id, title, content, response, status) VALUES (customerqna_seq.nextval, #{customer_id}, #{title}, #{content}, #{response}, #{status})")
    int boardInsert(Board ins);
    
    @Update("UPDATE CUSTOMERQNA SET response = #{response}, status = #{status} WHERE inquiry_id = #{inquiry_id}")
    int updateBoard(Board upt);

    @Delete("DELETE FROM CUSTOMERQNA WHERE inquiry_id = #{inquiry_id}")
    int deleteBoard(@Param("inquiry_id") int inquiry_id);
}
