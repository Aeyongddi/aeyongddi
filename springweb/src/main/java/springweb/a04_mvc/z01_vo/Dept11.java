package springweb.a04_mvc.z01_vo;

public class Dept11 {
	private String ename;
	private double sal;
	private int comm;
	public Dept11() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Dept11(String ename, double sal, int comm) {
		super();
		this.ename = ename;
		this.sal = sal;
		this.comm = comm;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public double getSal() {
		return sal;
	}
	public void setSal(double sal) {
		this.sal = sal;
	}
	public int getComm() {
		return comm;
	}
	public void setComm(int comm) {
		this.comm = comm;
	}
}
