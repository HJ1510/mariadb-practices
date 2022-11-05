package com.bitacademy.bookshop.main;

import java.util.List;
import java.util.Scanner;

import com.bitacademy.bookshop.dao.BookDao;
import com.bitacademy.bookshop.example.Book;
import com.bitacademy.bookshop.vo.BookVo;

public class BookShop {

	public static void main(String[] args) {
		Book[] books = new Book[10];

		books[0] = new Book(1, "트와일라잇", "스테파니메이어");
		books[1] = new Book(2, "뉴문", "스테파니메이어");
		books[2] = new Book(3, "이클립스", "스테파니메이어");
		books[3] = new Book(4, "브레이킹던", "스테파니메이어");
		books[4] = new Book(5, "아리랑", "조정래");
		books[5] = new Book(6, "젊은그들", "김동인");
		books[6] = new Book(7, "아프니깐 청춘이다", "김난도");
		books[7] = new Book(8, "귀천", "천상병");
		books[8] = new Book(9, "태백산맥", "조정래");
		books[9] = new Book(10, "풀하우스", "원수연");

		Scanner scanner = new Scanner(System.in);
		System.out.print("대여 하고 싶은 책의 번호를 입력하세요:");
		int bookNo = scanner.nextInt();
		scanner.close();

		// (1) 입력된 번호에 맞는 책을 찾아 대여 되었음(status="대여중")을 체크 합니다. // 코드 0=재고있음
		rentBook(bookNo);

		// (2) Book 객체의 정보를 출력
		System.out.println("*****도서 정보 출력하기******");
		displayBookInfo();

	}

	private static void displayBookInfo() {
		List<BookVo> list = new BookDao().findAll();
		for (BookVo vo : list) {
			System.out.println("[" + vo.getNo() + "]" + "책 제목:" + vo.getTitle() + ", 작가:" + vo.getAuthorName()
					+ ", 대여유무: " + vo.getStatus());
		}
	}

	private static void rentBook(long no) { //대여중으로 상태 변경
		new BookDao().updateStatus(no, "대여중");
	}

}