package com.whrlibraray.dao.impl;

import java.sql.Date;
import java.util.List;

import com.whrlibrary.dao.BookDAO;
import com.whrlibrary.dao.DAO;
import com.whrlibrary.obj.Book;

public class BookDbJdbcImpl extends DAO<Book>implements BookDAO {

	@Override
	public List<Book> getBookforName(String name) {
		String sql = "select * from books where bookName like '%" + name + "%'";// "+name+"
		return getForList(sql);
	}

	@Override
	public void editBook(Book book) {
		String sql = "update books set bookName = ? where bookID = ?";
		update(sql, book.getBookName(), book.getBookID());
		sql = "update books set publishment = ? where bookID = ?";
		update(sql, book.getPublishment(), book.getBookID());
		sql = "update books set writer = ? where bookID = ?";
		update(sql, book.getWriter(), book.getBookID());
		sql = "update books set coTime = ? where bookID = ?";
		update(sql, book.getCoTime(), book.getBookID());
	}

	@Override
	public void addBook(Book book) {
		String sql = "insert into books(bookName,publishment,writer,coTime,searchID) values(?,?,?,?,?)";
		update(sql, book.getBookName(), book.getPublishment(), book.getWriter(), book.getCoTime(), book.getSearchID());
	}

	@Override
	public List<Book> getBookforWriter(String writer) {
		String sql = "select * from books where writer like '%" + writer + "%'";
		return getForList(sql);
	}

	@Override
	public List<Book> getBookforPbm(String pbm) {
		String sql = "select * from books where publishment like '%" + pbm + "%'";
		return getForList(sql);
	}

	@Override
	public void borrowBook(int readerID, int bookID) {
		java.util.Date date = new java.util.Date();
		Date dt = new Date(date.getTime());
		String sql = "insert into borrow(bookID,readerID,borrowTime) values(?,?,?)";
		update(sql, bookID, readerID, dt);
		sql = "update books set status = 1 where bookID = ?";
		update(sql, bookID);
	}

	@Override
	public void Fine(int bookID) {
		String sql = "select * from books where bookID = ?";
		Book book = get(sql, bookID);
		java.util.Date date = new java.util.Date();
		Date dt1 = new Date(date.getTime());
		
	}

	@Override
	public void deleteBook(int id) {
		String sql = "delete from books where bookID = ?";
		update(sql, id);
	}

	@Override
	public void returnBook(int bookID) {
		java.util.Date date = new java.util.Date();
		Date dt = new Date(date.getTime());
		String sql = "update borrow set returnTime = ? where returnTime is NULL and bookID = ?";
		update(sql, dt, bookID);
		sql = "update books set status = 0 where bookID = ?";
		update(sql, bookID);
	}

}
