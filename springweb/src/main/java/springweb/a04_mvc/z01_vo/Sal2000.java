package springweb.a04_mvc.z01_vo;

public class Sal2000 {
	private String ename;
	private String job;
	private String dname;
	public Sal2000() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Sal2000(String ename, String job, String dname) {
		super();
		this.ename = ename;
		this.job = job;
		this.dname = dname;
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
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
}
