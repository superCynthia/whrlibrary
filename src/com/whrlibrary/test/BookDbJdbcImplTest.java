package com.whrlibrary.test;

import java.sql.Date;
import java.util.List;

import org.junit.Test;

import com.whrlibraray.dao.impl.BookDbJdbcImpl;
import com.whrlibrary.dao.BookDAO;
import com.whrlibrary.obj.Book;

public class BookDbJdbcImplTest {
	private BookDAO bookDAO = new BookDbJdbcImpl();

	@Test
	public void testGetBookforName() {
		List<Book> list = bookDAO.getBookforName("计算");
		System.out.println(list.size());
	}

	@Test
	public void testEditBook() {
		Date dt = Date.valueOf("2014-06-06");
		Book book = new Book(11, "乖 摸摸头", "僧人出版社", "僧人", dt);
		bookDAO.editBook(book);
	}

	@Test
	public void testAddBook() {
		Book book = new Book();
		book.setBookName("time control");
		book.setCoTime(Date.valueOf("2000-10-12"));
		book.setPublishment("ab出版社");
		book.setWriter("大熊");
		
		bookDAO.addBook(book);
	}

	@Test
	public void testGetBookforWriter() {
		List<Book> list = bookDAO.getBookforWriter("张三");
		System.out.println(list.size());
	}

	@Test
	public void testDeleteBook() {
		bookDAO.deleteBook(11);
	}

	@Test
	public void testBorrowBook() {
		bookDAO.borrowBook(160002, 5);
	}
	
	@Test
	public void testReturnBook() {
		bookDAO.returnBook(2);
	}
}
