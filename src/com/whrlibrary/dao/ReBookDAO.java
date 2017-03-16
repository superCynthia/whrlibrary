package com.whrlibrary.dao;

import java.util.List;

import com.whrlibrary.obj.ReBook;

public interface ReBookDAO {
	public void AddReBook(ReBook rbook);

	public List<ReBook> getBeReBook();
	
	public List<ReBook> getAfReBook();

	public void solveReBook(String bookName);
}
