package com.bitacademy.emaillist.dao.test;

import java.util.List;

import com.bitacademy.emaillist.dao.EmaillistDao;
import com.bitacademy.emaillist.vo.EmaillistVo;

public class EmaillistDaoTest {

	public static void main(String[] args) {
		testFindAll();
		testInsert("윤","현정2","yoon@gamail.com");
//		testdelelte("yoon@gmail.com");

	}

//
//	private static void testdelelte(String email) {
//		new EmaillistDao().deleteByEmail(email);
//	}
//




	private static void testInsert(String firstName, String lastName, String email) {
		EmaillistVo vo = new EmaillistVo();
		vo.setFirstName(firstName);
		vo.setLastName(lastName);
		vo.setEmail(email);
		
		new EmaillistDao().insert(vo);
		
		
	}


	private static void testFindAll() {
		List<EmaillistVo> list = new EmaillistDao().findAll();
		for (EmaillistVo vo : list) {
			System.out.println(vo.getFirstName() + " " + vo.getEmail());
		}

	}

}