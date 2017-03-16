package com.whrlibrary.obj;

import java.sql.Date;

public class Book {
	private int bookID;
	private int searchID;
	private String bookName;
	private String publishment;
	private String writer;
	private Date coTime;
	private int status;

	public Book() {
	}

	public Book(String name, String pub, String wri, Date time, int searchID) {
		this.bookName = name;
		this.publishment = pub;
		this.writer = wri;
		this.coTime = time;
		this.searchID = searchID;
	}

	public Book(int bookID, String name, String pub, String wri, Date time) {
		this.bookID = bookID;
		this.bookName = name;
		this.publishment = pub;
		this.writer = wri;
		this.coTime = time;
	}

	public int getBookID() {
		return bookID;
	}

	public void setBookID(int bookID) {
		this.bookID = bookID;
	}

	public int getSearchID() {
		return searchID;
	}

	public void setSearchID(int searchID) {
		this.searchID = searchID;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getPublishment() {
		return publishment;
	}

	public void setPublishment(String publishment) {
		this.publishment = publishment;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getCoTime() {
		return coTime;
	}

	public void setCoTime(Date coTime) {
		this.coTime = coTime;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
