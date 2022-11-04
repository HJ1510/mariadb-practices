package com.bitacademy.bookshop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bitacademy.bookshop.vo.BookVo;

public class BookDao {

	public boolean insert(BookVo vo) {
		boolean result = false;

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {			
			conn = getConnection();

			// 3. Statement 생성
			String sql = "insert into book values(null, ?,?,?)";
			pstmt = conn.prepareStatement(sql);

			// 4.Binding
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getStatus());
			pstmt.setLong(3, vo.getAuthorNo());

			// 5. SQL 실행
			int count = pstmt.executeUpdate(); // executeQuery select 함수에서
			
			// 6. 결과처리
			result = count == 1;

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

	public List<BookVo> findAll() { // 파라미터 없음 바인딩 필요 없음
		List<BookVo> result = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {			
			conn = getConnection();

			String sql = "select a.no ,a.title, b.name,a.status  from book a ,author b where a.author_no =b.no order by a.no asc"; // 바인딩
			pstmt = conn.prepareStatement(sql); // 바인딩 없어도 필요

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Long no = rs.getLong(1); // 데이터 베이스는 1부터 시작
				String title = rs.getString(2);
				String authorName = rs.getString(3);
				String ststus = rs.getString(3);

				BookVo vo = new BookVo();
				vo.setNo(no);
				vo.setTitle(title);
				vo.setAuthorName(authorName);
				vo.setStatus(ststus);

				result.add(vo);
			}

		} catch (SQLException e) {
			System.out.println("Error : " + e);
		} finally {
			try {
				if (rs != null) { // 닫는 순서는 생성 역순으로
					rs.close();
				}
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

	private Connection getConnection() throws SQLException {
		Connection conn=null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8"; // 마리아db에선 utf-8로 하면 오류! 뒤에 옵션은 추가 가능
			conn = DriverManager.getConnection(url, "webdb", "webdb");
		} catch (ClassNotFoundException e) {
			System.out.println("Class Not Found:"+e);
//		} catch (SQLException e) {  //예외는 한곳에서 처리하는게 좋음(중복x) throws로 밖으로 넘기는것
//			System.out.println("error:"+e);
		}
		return conn;

	}
		

}
