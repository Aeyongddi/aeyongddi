package springweb.a04_mvc.z01_vo;

public class Student {
	private int stuno;
	private String sname;
	private int kor;
	private int eng;
	private int math;
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student(int stuno, String sname, int kor, int eng, int math) {
		super();
		this.stuno = stuno;
		this.sname = sname;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}
	public int getStuno() {
		return stuno;
	}
	public void setStuno(int stuno) {
		this.stuno = stuno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}

}
