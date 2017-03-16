package com.whrlibrary.obj;

import java.sql.Date;

public class ReBook {
	private int reID;
	private String bookName;
	private String publishment;
	private String writer;
	private Date coTime;
	private int status;
	private int readerID;
	
	public ReBook() {}
	
	public ReBook(int reID, String bookName, String writer, String pblh, Date coTime, int readerID, int status) {
		this.reID = reID;
		this.bookName = bookName;
		this.writer = writer;
		this.publishment = pblh;
		this.coTime = coTime;
		this.readerID = readerID;
		this.status = status;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public ReBook(String rBookName, String rPblh, String rwriter, Date dt, int readerID2) {
		this.bookName = rBookName;
		this.writer = rwriter;
		this.publishment = rPblh;
		this.coTime = dt;
		this.readerID = readerID2;
	}

	public String toString() {
		return this.bookName + " (作者： " + this.writer + " ,出版社： " + this.publishment + " ,出版时间： " + this.coTime + " )";
	}

	public String getPublishment() {
		return publishment;
	}

	public void setPublishment(String publishment) {
		this.publishment = publishment;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public int getReID() {
		return reID;
	}

	public void setReID(int reID) {
		this.reID = reID;
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

	public int getReaderID() {
		return readerID;
	}

	public void setReaderID(int readerID) {
		this.readerID = readerID;
	}
}
