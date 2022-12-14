package com.bitacademy.emaillist.main;

import java.util.List;
import java.util.Scanner;

import com.bitacademy.emaillist.dao.EmaillistDao;
import com.bitacademy.emaillist.vo.EmaillistVo;

public class EmaillistApp {
	private static Scanner scanner = null;

	public static void main(String[] args) {
		scanner = new Scanner(System.in);
		while (true) {
			System.out.println("(l)ist (a)dd (d)elete (q)uit > ");
			String command = scanner.nextLine();

			if ("l".equals(command)) {
				doList();
			} else if ("a".equals(command)) {
				doAdd();
			} else if ("d".equals(command)) {
				doDelete();
			} else if ("q".equals(command)) {
				break;
			}

		}

	}

	private static void doDelete() {
		System.out.println("email: ");
		String email = scanner.nextLine();
		new EmaillistDao().deleteByEmail(email);
		doList();
	}

	private static void doAdd() {
		EmaillistVo vo = new EmaillistVo();

		System.out.println("성: ");
		vo.setFirstName(scanner.nextLine());

		System.out.println("이름: ");
		vo.setLastName(scanner.nextLine());

		System.out.println("이메일: ");
		vo.setEmail(scanner.nextLine());

		System.out.println(vo.getFirstName() + vo.getLastName() + ":" + vo.getEmail());

		new EmaillistDao().insert(vo);

		doList();

	}
	
//	private static void doAdd() { // 강사님
//		System.out.print("성:");
//		String firstName = scanner.nextLine();
//		
//		String lastName = scanner.nextLine();
//
//		System.out.print("이메일:");
//		String email = scanner.nextLine();
//
//		EmaillistVo vo = new EmaillistVo();
//		vo.setFirstName(firstName);
//		vo.setLastName(lastName);
//		vo.setEmail(email);
//		
//		new EmaillistDao().insert(vo);
//		
//		doList();
//	}

	private static void doList() {
		List<EmaillistVo> list = new EmaillistDao().findAll();
		for (EmaillistVo vo : list) {
			System.out.println("이름: " + vo.getFirstName() + " " + vo.getLastName() + ", 이메일: " + vo.getEmail());
		}

	}

}
