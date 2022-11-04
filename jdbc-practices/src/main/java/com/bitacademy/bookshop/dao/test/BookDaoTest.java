package com.bitacademy.bookshop.dao.test;

import com.bitacademy.bookshop.dao.BookDao;
import com.bitacademy.bookshop.vo.BookVo;

public class BookDaoTest {

	public static void main(String[] args) {
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
