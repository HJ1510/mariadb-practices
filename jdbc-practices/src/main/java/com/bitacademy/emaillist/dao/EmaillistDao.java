package com.bitacademy.emaillist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bitacademy.emaillist.vo.EmaillistVo;

public class EmaillistDao {
	public Boolean insert(EmaillistVo vo) {
		return false;
	}
	public Boolean deleteByEmail(String email) {
		return false;
	}
	public List<EmaillistVo> findAll() {
		List<EmaillistVo> result =new ArrayList<>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");

			String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8"; // 마리아db에선 utf-8로 하면 오류! 뒤에 옵션은 추가 가능
			conn = DriverManager.getConnection(url, "webdb", "webdb");

			stmt = conn.createStatement();

			String sql = "select first_name, last_name, email from emaillist order by no desc";

			rs = stmt.executeQuery(sql); //executeQuery select 함수에서

			while (rs.next()) {
				String firstName = rs.getString(1);
				String lastName = rs.getString(2);
				String email = rs.getString(3);
				
				EmaillistVo vo = new EmaillistVo();
				vo.setFirst_name(firstName);
				vo.setLast_name(lastName);
				vo.setEmail(email);
				
				result.add(vo);
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
		
		return result;
	}
	
	

}