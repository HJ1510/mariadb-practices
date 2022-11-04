package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SelectTest01 {

	public static void main(String[] args) {
		search("pat");

	}

	private static void search(String keyword) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			// 1. JDBC Driver Class Loarding
			Class.forName("org.mariadb.jdbc.Driver");

			// 2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/employees?charset=utf8"; // 마리아db에선 utf-8로 하면 오류! 뒤에 옵션은 추가 가능
			conn = DriverManager.getConnection(url, "hr", "hr");

			// 3. Statement 생성
			stmt = conn.createStatement();

			// 4. SQL 실행
			String sql = "select emp_no, first_name from employees where first_name like '%" + keyword + "%'";

			rs = stmt.executeQuery(sql); //executeQuery select 함수에서
			
			//5. 결과(ResultSet) 처리
			while (rs.next()) {
				Long empNo = rs.getLong(1); // 데이터 베이스는 1부터 시작
				String firstName = rs.getString(2);
				System.out.println(empNo + ":" + firstName);
			}

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패 : " + e);
		} catch (SQLException e) {
			System.out.println("Error : " + e);
		} finally {
			try {
				if (rs != null) {  //닫는 순서는 생성 역순으로
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
