package com.whrlibraray.dao.impl;

import java.util.List;

import com.whrlibrary.dao.DAO;
import com.whrlibrary.dao.ReBookDAO;
import com.whrlibrary.obj.ReBook;

public class ReBookDbJdbcImpl extends DAO<ReBook>implements ReBookDAO {

	@Override
	public void AddReBook(ReBook rbook) {
		String sql = "select * from recommendation where bookName = ? and publishment = ? and writer = ? and coTime = ?";
		List<ReBook> list = getForList(sql, rbook.getBookName(), rbook.getPublishment(), rbook.getWriter(), rbook.getCoTime());
		if (list.isEmpty()) {
			sql = "insert into recommendation(bookName,publishment,writer,coTime,status,readerID) values(?,?,?,?,?,?)";
			update(sql, rbook.getBookName(), rbook.getPublishment(), rbook.getWriter(), rbook.getCoTime(), 0,
					rbook.getReaderID());
		}
	}

	@Override
	public List<ReBook> getBeReBook() {
		String sql = "select * from recommendation where status = 0";
		return getForList(sql);
	}

	@Override
	public void solveReBook(String bookName) {
		String sql = "update recommendation set status = 1 where bookName = ? and status = 0";
		update(sql, bookName);
	}

	@Override
	public List<ReBook> getAfReBook() {
		String sql = "select * from recommendation where status = 1";
		return getForList(sql);
	}

}
