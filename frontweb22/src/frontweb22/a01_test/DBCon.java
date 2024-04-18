package frontweb22.a01_test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/*
scott
tiger

 * */



public class DBCon {
	private static final String URL="jdbc:oracle:thin:@localhost:1521:xe";
	// 접속 계정 : system
	private static final String USERNAME="scott";
	// 접속 비밀번호 : 1111
	private static final String PASSWORD="tiger";	
	public static Connection con() throws SQLException, ClassNotFoundException {
        Class.forName("oracle.jdbc.driver.OracleDriver");
		return DriverManager.getConnection(URL,USERNAME,PASSWORD);
	}
	public static boolean  close(AutoCloseable... resources) {
		boolean isSucc = false;
		for(AutoCloseable resource:resources) {
			if(resource!=null) {
				try {
					resource.close();
					isSucc = true;
				} catch (Exception e) {
					// ㅣ해당 클래스의 예외가 나올 때 처리
					System.out.print(
							resource.getClass().getSimpleName());
					System.out.println("닫기 실패");
				}
			}
		}
		//System.out.println("자원해제처리!");
		return isSucc;
	}

	public static void main(String[] args) {
		try {
			;
			System.out.println("접속성공 여부:"+close( con() ));
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("에러발생:"+e.getMessage());
		}
	}

}
