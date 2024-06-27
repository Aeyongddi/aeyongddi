package springweb.a04_mvc.z01_vo;

public class Emp03 {
	private String ename;
	private String job;
	private int sal;
	public Emp03() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Emp03(String ename, String job, int sal) {
		super();
		this.ename = ename;
		this.job = job;
		this.sal = sal;
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
	public int getSal() {
		return sal;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
}
