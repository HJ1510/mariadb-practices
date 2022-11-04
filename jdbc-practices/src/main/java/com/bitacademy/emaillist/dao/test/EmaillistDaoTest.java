package com.bitacademy.emaillist.dao.test;

import java.util.List;

import com.bitacademy.emaillist.dao.EmaillistDao;
import com.bitacademy.emaillist.vo.EmaillistVo;

public class EmaillistDaoTest {

	public static void main(String[] args) {
		testFindAll();
		testInsert();

	}


	private static void testInsert() {
		
		
	}


	private static void testFindAll() {
		List<EmaillistVo> list = new EmaillistDao().findAll();
		for (EmaillistVo vo : list) {
			System.out.println(vo.getFirst_name() + " " + vo.getEmail());
		}

	}

}