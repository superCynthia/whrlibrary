package com.whrlibrary.test;

import java.sql.Date;
import java.util.List;

import org.junit.Test;

import com.whrlibraray.dao.impl.ReBookDbJdbcImpl;
import com.whrlibrary.dao.ReBookDAO;
import com.whrlibrary.obj.ReBook;

public class ReBookDbJdbcImplTest {
private ReBookDAO reBookDAO = new ReBookDbJdbcImpl();
	@Test
	public void testAddReBook() {
		Date dt = Date.valueOf("2011-03-08");
		ReBook reBook = new ReBook("小猪快跑", "ab出版社", "李四", dt, 160001);
		reBookDAO.AddReBook(reBook);
	}

	@Test
	public void testGetBeReBook() {
		List<ReBook> rebooks = reBookDAO.getBeReBook();
		System.out.println(rebooks.size());
	}

	@Test
	public void testSolveReBook() {
		reBookDAO.solveReBook("计算机网络");
	}

	@Test
	public void testGetAfReBook() {
		List<ReBook> rebooks = reBookDAO.getAfReBook();
		System.out.println(rebooks.size());
	}

}
