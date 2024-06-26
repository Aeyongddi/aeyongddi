package springweb.a04_mvc.a03_dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface A01_ExpDao {
	// 단일 데이터 가져오는 sql
	@Select("select count(*) from emp")
	int getCount();
	
	@Select("select count(*) from dept")
	int getDeptCount();
	
	@Select("SELECT job FROM emp\r\n"
			+ "WHERE empno=7499")
	String schJob();
	
	@Select("SELECT hisal FROM salgrade\r\n"
			+ "WHERE GRADE=1")
	int getHiSal();
	
	@Select("SELECT sal FROM emp\r\n"
			+ "WHERE empno=7521")
	int getSchSal();
	
	@Select("SELECT loc FROM dept\r\n"
			+ "WHERE deptno=10")
	String locName();
	
	// 다중행 단일컬럼
	@Select("Select empno from emp"
			+ "where depno = 10")
	List<Integer> getEmpnos();
	
	@Select("SELECT ename FROM EMP \r\n"
			+ "WHERE sal BETWEEN 1000 AND 3000")
	List<String> getEname();
	
	@Select("SELECT hiredate FROM emp \r\n"
			+ "WHERE job = 'SALESMAN'")
	List<Date> getHiredate();
	
	@Select("SELECT sal FROM emp\r\n"
			+ "WHERE deptno = 30")
	List<Integer> getSal();
	
	@Select("SELECT empno FROM emp\r\n"
			+ "WHERE comm IS  NULL")
	List<Integer> getEmpno();
	
	@Select("SELECT ename FROM emp\r\n"
			+ "WHERE mgr = 7902")
	List<String> getEnamee();
}
