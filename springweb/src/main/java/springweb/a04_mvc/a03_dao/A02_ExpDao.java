package springweb.a04_mvc.a03_dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import springweb.a04_mvc.z01_vo.Member;
import springweb.a04_mvc.z01_vo.Product;
import springweb.a04_mvc.z01_vo.Product2;

public interface A02_ExpDao {
	/*
	# dao 선언 시 중복정의(overloading)으로 메서드는 선언할 수 있으나
	mybatis 프레임워크 내부적으로 식별하는 기준이 메서드명이므로 다르게 선언하여야 함
	 */
	// ex1) grade 매개변수로 입력처리
	   @Select("SELECT hisal\r\n"
	         + "FROM SALGRADE\r\n"
	         + "WHERE grade = 1")
	   int getHiSal();
	   @Select("SELECT hisal\r\n"
		         + "FROM SALGRADE\r\n"
		         + "WHERE grade = #{grade}")
		   int getHiSal2(@Param("grade") int grade);
	   // ex) 사원명을 입력하면 급여를 처리하는 메서드 선언 처리
	   @Select("SELECT * FROM member01\r\n"
	   		+ "WHERE id LIKE #{id}\r\n"
	   		+ "AND name LIKE #{name}\r\n"
	   		+ "AND auth LIKE #{auth}")
	   List<Member> memberList(Member sch);
	   
}
