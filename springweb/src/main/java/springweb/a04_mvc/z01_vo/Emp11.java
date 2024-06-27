package springweb.a04_mvc.z01_vo;

import java.util.Date;

public class Emp11 {
	private String ename;
	private Date hiredate;
	private int deptno;
	public Emp11() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Emp11(String ename, Date hiredate, int deptno) {
		super();
		this.ename = ename;
		this.hiredate = hiredate;
		this.deptno = deptno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
}
