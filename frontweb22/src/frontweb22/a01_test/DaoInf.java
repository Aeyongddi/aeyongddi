package frontweb22.a01_test;

import java.util.List;

public interface DaoInf {
	public List<Member> getMemberList(String name, String auth);
	public int insertMember(Member ins);
	public Member getMember(int mno);
}
