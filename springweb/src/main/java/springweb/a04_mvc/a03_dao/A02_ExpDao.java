package springweb.a04_mvc.a03_dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface A02_ExpDao {
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
}
