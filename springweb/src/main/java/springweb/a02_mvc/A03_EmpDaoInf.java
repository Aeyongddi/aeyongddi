package springweb.a02_mvc;

import java.util.List;


public interface A03_EmpDaoInf {
	List<Emp> getEmpList(Emp sch);
	int insertEmp(Emp ins);
	Emp getEmp(int empno);
	int updateEmp(Emp upt);
	int deleteEmp(int empno);
	
}
