package com.bitacademy.bookshop.dao.test;

import com.bitacademy.bookshop.dao.BookDao;
import com.bitacademy.bookshop.vo.BookVo;

public class BookDaoTest {

	public static void main(String[] args) {
		testInsert(1L,"트와일라잇");
		testInsert(1L,"뉴문");
		testInsert(1L,"이클립스");
		testInsert(1L,"풀하우스");
		testInsert(8L,"풀하우스");
		testInsert(8L,"풀하우스");
		testInsert(8L,"풀하우스");
		testInsert(8L,"풀하우스");
		testInsert(8L,"풀하우스");
		testInsert(8L,"풀하우스");
	}

	private static void testInsert(Long authorNo, String title) {
		BookVo vo= new BookVo();
		vo.setTitle(title);
		vo.setStatus("재고있음");
		vo.setAuthorNo(authorNo);
		
		new BookDao().insert(vo);
		
	}
	
	
}
