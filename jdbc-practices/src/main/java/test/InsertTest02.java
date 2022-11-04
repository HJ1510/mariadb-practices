package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertTest02 {

	public static void main(String[] args) {
		insert("시스템");
		insert("마케팅");
		insert("운영");

	}

	private static Boolean insert(String name) {
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			// 1. JDBC Driver Class Loarding
			Class.forName("org.mariadb.jdbc.Driver");

			// 2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8"; // 마리아db에선 utf-8로 하면 오류! 뒤에 옵션은 추가 가능
			conn = DriverManager.getConnection(url, "webdb", "webdb");

			// 3. Statement 생성
			String sql = "insert into dept values(null, ?)";
			pstmt = conn.prepareStatement(sql);

			// 4.Binding
			pstmt.setString(1, name);
			
			// 5. SQL 실행
			int count = pstmt.executeUpdate(); // executeQuery select 함수에서

			result = count == 1;

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패 : " + e);
		} catch (SQLException e) {
			System.out.println("Error : " + e);
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;

	}

}
