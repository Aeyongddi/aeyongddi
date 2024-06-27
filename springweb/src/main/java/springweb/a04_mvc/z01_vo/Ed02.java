package springweb.a04_mvc.z01_vo;

import java.util.Date;

public class Ed02 {
	private String ename;
	private String job;
	private Date hiredate;
	public Ed02() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Ed02(String ename, String job, Date hiredate) {
		super();
		this.ename = ename;
		this.job = job;
		this.hiredate = hiredate;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
}
