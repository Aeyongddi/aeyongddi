package frontweb22.a01_test;
// backendweb.d01_dao.MemberDao
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/*
import = "frontweb.database.MemberDao"
import = "frontweb.vo.Member"

 * */
// frontweb.database.MemberDao
// frontweb.vo.Member
public class MemberDao implements DaoInf{
	public List<Member> getMemberList(String name, String auth) {
		List<Member> list = new ArrayList<Member>();
		String sql = "		select * from member01 \r\n"
				+ "		where name like ?\r\n"
				+ "		and auth like ? "
				+ "     order by mno desc";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setString(1, "%" + name + "%");
			pstmt.setString(2, "%" + auth + "%");
			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				// mno, name, id, pwd, auth, point
				while (rs.next()) {
					list.add(new Member(rs.getInt("mno"), 
							rs.getString("name"), 
							rs.getString("id"),
							rs.getString("pwd"),
							rs.getString("auth"),
							rs.getInt("point")));
				}
				System.out.println("건수:" + list.size());
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		
		return list;
	}
	/*
	INSERT INTO member01 values(mem_seq.nextval,
			?,?,?,?,?)
		UPDATE member01
			SET name = ?,
				id = ?,
				pwd = ?,
				auth = ?
			WHERE mno=?
		delete 
		from member01
		where mno = ?
	*/	
	public int insertMember(Member ins) {
		int insCnt =0;
		String sql = "	INSERT INTO member01 values(mem_seq.nextval,\r\n"
				+ "			?,?,?,?,?)";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setString(1, ins.getName());
			pstmt.setString(2, ins.getId());
			pstmt.setString(3, ins.getPwd());
			pstmt.setString(4, ins.getAuth());
			pstmt.setInt(5, ins.getPoint());
			insCnt = pstmt.executeUpdate();
			if (insCnt == 0) {
				System.out.println("등록 실패");
				con.rollback();
			} else {
				con.commit(); // Commit the transaction
				System.out.println("등록 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		
		return insCnt;
	}
	public Member getMember(int mno) {
		Member mem = null;
		String sql = "SELECT * \r\n" + 
					"FROM member01\r\n" + 
					"WHERE mno=? ";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setInt(1, mno);
			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				// mno name id pwd auth point
				if (rs.next()) {
					mem = new Member(rs.getInt("mno"), rs.getString("name"), rs.getString("id"), rs.getString("pwd"),
							rs.getString("auth"), rs.getInt("point"));
				}
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}		
		return mem;
	}
	/*
	INSERT INTO member01 values(mem_seq.nextval,
			?,?,?,?,?)
		UPDATE member01
			SET name = ?,
				id = ?,
				pwd = ?,
				auth = ?
			WHERE mno=?
		delete 
		from member01
		where mno = ?
	*/		
	
	public int updateMember(Member upt) {
		int uptCnt =0;
		String sql = "		UPDATE member01\r\n"
				+ "			SET name = ?,\r\n"
				+ "				id = ?,\r\n"
				+ "				pwd = ?,\r\n"
				+ "				auth = ?,\r\n"
				+ "				point = ?\r\n"
				+ "			WHERE mno=? ";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setString(1, upt.getName());
			pstmt.setString(2, upt.getId());
			pstmt.setString(3, upt.getPwd());
			pstmt.setString(4, upt.getAuth());
			pstmt.setInt(5, upt.getPoint());
			pstmt.setInt(6, upt.getMno());

			uptCnt = pstmt.executeUpdate();
			if (uptCnt == 0) {
				System.out.println("수정 실패");
				con.rollback();
			} else {
				con.commit(); // Commit the transaction
				System.out.println("수정 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		
		return uptCnt;		
		
	}
	public int deleteMember(int mno) {
		int delCnt =0;
		String sql = "		delete \r\n"
				+ "		from member01\r\n"
				+ "		where mno = ?";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setInt(1, mno);
			delCnt = pstmt.executeUpdate();
			if (delCnt == 0) {
				System.out.println("삭제 실패");
				con.rollback();
			} else {
				con.commit(); // Commit the transaction
				System.out.println("삭제 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		
		return delCnt;		
	}
	
	public boolean ckMemberId(String id) {
		boolean hasMember= false;
		String sql = "SELECT * \r\n" + 
					"FROM member01\r\n" + 
					"WHERE id=? ";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setString(1, id);
			try (ResultSet rs = pstmt.executeQuery();) {
				hasMember = rs.next();
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}		
		return hasMember;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
