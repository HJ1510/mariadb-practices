package com.bitacademy.bookshop.dao.test;

import com.bitacademy.bookshop.dao.BookDao;
import com.bitacademy.bookshop.vo.BookVo;

public class BookDaoTest {

	public static void main(String[] args) {
		testInsert(13L,"트와일라잇");
		testInsert(13L,"뉴문");
		testInsert(13L,"이클립스");
		testInsert(13L,"브레이킹던");
		testInsert(14L,"아리랑");
		testInsert(15L,"젊은그들");
		testInsert(16L,"아프니깐 청춘이다");
		testInsert(17L,"귀천");
		testInsert(14L,"태백산맥");
		testInsert(18L,"풀하우스");
	}

	private static void testInsert(Long authorNo, String title) {
		BookVo vo= new BookVo();
		vo.setTitle(title);
		vo.setStatus("재고있음");
		vo.setAuthorNo(authorNo);
		
		new BookDao().insert(vo);
		
	}
	
	
}
