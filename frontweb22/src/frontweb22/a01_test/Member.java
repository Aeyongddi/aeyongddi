package frontweb22.a01_test;
// backendweb.z01_vo.Member
public class Member {
	// 유형, 컬럼명(소문자)
	// mno  name id pwd auth point
	private int mno;
	private String name;
	private String id;
	private String pwd;
	private String auth;
	private int point;
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}

	public Member(int mno, String name, String id, String pwd, String auth, int point) {
		this.mno = mno;
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.auth = auth;
		this.point = point;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	

}
