package com.whrlibrary.dao;

import java.util.List;

import com.whrlibrary.obj.Book;

public interface BookDAO {
	public void editBook(Book book);
	
	public void addBook(Book book);
	
	public void deleteBook(int id);

	public List<Book> getBookforName(String name);
	
	public List<Book> getBookforWriter(String writer);
	
	public List<Book> getBookforPbm(String pbm);
	
	public void borrowBook(int readerID,int bookID);
	
	public void returnBook(int bookID);
	
	public void Fine(int bookID);
}
