package springweb.a03_mvc.a03_dao;

import org.apache.ibatis.annotations.Select;

import springweb.z01_vo.Emp;

public interface A06_AjaxDao {
	@Select("SELECT count(*) FROM EMP\r\n"
			+ "  WHERE empno = #{empno}")
	Emp checkEmpno();
	
}
