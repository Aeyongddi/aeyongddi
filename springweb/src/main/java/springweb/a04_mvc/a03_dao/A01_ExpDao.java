package springweb.a04_mvc.a03_dao;
// 

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import springweb.a04_mvc.z01_vo.Dept01;
import springweb.a04_mvc.z01_vo.Dept11;
import springweb.a04_mvc.z01_vo.Ed01;
import springweb.a04_mvc.z01_vo.Ed02;
import springweb.a04_mvc.z01_vo.Emp02;
import springweb.a04_mvc.z01_vo.Emp03;
import springweb.a04_mvc.z01_vo.Emp11;
import springweb.a04_mvc.z01_vo.Employee01;
import springweb.a04_mvc.z01_vo.Sal01;
import springweb.a04_mvc.z01_vo.Sal2000;

public interface A01_ExpDao {
   // 단일 데이터 가져오는 sql
   @Select("select count(*) from emp")
   int getCount();
   
   @Select("SELECT job \r\n"
         + "FROM emp\r\n"
         + "WHERE empno = 7499\r\n")
   String getJob();
   @Select("SELECT job \r\n"
         + "FROM emp\r\n"
         + "WHERE empno = #{empno}\r\n")
   String getJob(@Param("empno") int empno);
   // 매개변수를 입력했을 때 결과로 job을 가져오는 처리하는 기능 메서드 선언
  
   @Select("SELECT sal\r\n"
         + "FROM emp\r\n"
         + "WHERE empno = 7521")
   double getSal();
   
   @Select("SELECT loc\r\n"
         + "FROM dept\r\n"
         + "WHERE deptno = 10")
   String getLoc();

   // 다중행 단일컬럼
   @Select("SELECT empno\r\n"
         + "FROM emp\r\n"
         + "WHERE deptno = 10")
   List<Integer> getEmpnos();  
   
   @Select("SELECT empno\r\n"
	         + "FROM emp\r\n"
	         + "WHERE deptno = #{deptno}")
	List<Integer> getEmpnos22(@Param("deptno") int deptno);  
   
   @Select("SELECT ename\r\n"
         + "FROM emp\r\n"
         + "WHERE sal BETWEEN 1000 AND 3000")
   List<String> getEnames();
   
   @Select("SELECT ename\r\n"
	         + "FROM emp\r\n"
	         + "WHERE sal BETWEEN #{start} AND #{end}")
	   List<String> getEnames22(@Param("start") int start, @Param("end") int end);
   
   @Select("SELECT hiredate\r\n"
         + "FROM emp\r\n"
         + "WHERE job = 'SALESMAN'")
   List<Date> getHiredate();

   @Select("SELECT SAL\r\n"
         + "FROM EMP e \r\n"
         + "WHERE deptno = 30")
   List<Double> getSals();
   
   @Select("SELECT empno\r\n"
         + "FROM emp\r\n"
         + "WHERE comm IS NULL")
   List<Integer> getEmpnos2();
   
   @Select("SELECT ename\r\n"
         + "FROM emp\r\n"
         + "WHERE mgr = 7902 ")
   List<String> getEnames2();
   // 1행의 여러 데이터 처리: sql 결과가 한 행이고, 여러 컬럼으로 가져올 때 처리
   @Select("SELECT ename, sal, deptno\r\n"
   		+ "FROM emp\r\n"
   		+ "WHERE empno = 7369")
   Emp02 getEmp02();
   
   @Select("SELECT ename, job, sal\r\n"
   		+ "FROM emp\r\n"
   		+ "WHERE empno = 7369")
   Emp03 getEmp03();
   
   @Select("SELECT dname,loc\r\n"
   		+ "FROM dept\r\n"
   		+ "WHERE deptno = 20")
   Dept01 getDept01();
   
   @Select("SELECT empno, ename,dname,loc\r\n"
   		+ "FROM emp e ,DEPT d \r\n"
   		+ "WHERE e.deptno = d.DEPTNO  \r\n"
   		+ "AND ename = 'ALLEN'")
   Ed01 getEd01();
   
   @Select("SELECT ename, job, sal\r\n"
   		+ "FROM emp\r\n"
   		+ "WHERE sal = (SELECT min(SAL) FROM emp)")
   Sal01 getSal01();
   
   @Select("SELECT ename, job, hiredate\r\n"
   		+ "FROM EMP e , DEPT d \r\n"
   		+ "WHERE e.DEPTNO = d.DEPTNO \r\n"
   		+ "AND e.sal LIKE (SELECT max(e.SAL) FROM EMP e)\r\n"
   		+ "AND d.DNAME = 'ACCOUNTING'")
   Ed02 getEd02();
   
   @Select("SELECT employee_id, first_name, salary, department_id\r\n"
   		+ "FROM employees\r\n"
   		+ "WHERE salary BETWEEN 10000 AND 20000")
   List<Employee01> getEmployee01();
   
   @Select("SELECT ename, job, sal\r\n"
   		+ "FROM emp\r\n"
   		+ "WHERE deptno = 10")
   List<Emp03> getEmp111();
   
   @Select("SELECT ename, hiredate, deptno\r\n"
   		+ "FROM EMP\r\n"
   		+ "WHERE job = 'CLERK'")
   List<Emp11> getEmp11();
   
   @Select("SELECT ename, dname\r\n"
   		+ "FROM EMP e ,DEPT d \r\n"
   		+ "WHERE e.deptno = d.deptno")
   List<Ed01> getEd011();
   
   @Select("SELECT ename, job, dname\r\n"
   		+ "FROM EMP e ,DEPT d \r\n"
   		+ "WHERE e.DEPTNO = d.DEPTNO \r\n"
   		+ "AND e.sal>=2000")
   List<Sal2000> getSal2000();
   
   @Select("SELECT ename, sal, comm\r\n"
   		+ "FROM emp\r\n"
   		+ "WHERE deptno=30 AND comm IS NOT NULL")
   List<Dept11> getDept11();
}
