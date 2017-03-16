package com.whrlibrary.test;

import org.junit.Test;
import com.whrlibraray.dao.impl.ReaderDbJdbcImpl;
import com.whrlibrary.dao.ReaderDAO;
import com.whrlibrary.obj.Reader;

public class ReaderDbJdbcImplTest {
	private ReaderDAO readerDAO = new ReaderDbJdbcImpl();
	@Test
	public void testGetReader() {
		Reader reader1 = readerDAO.getReader(160002, "111111");
		Reader reader2 = readerDAO.getReader(160002, "222222");
		System.out.println(reader1.toString());
		System.out.println(reader2.toString());
	}

	@Test
	public void testAddReader() {
		readerDAO.addReader("小土豆", "123789", "男", "15066789456", null);
	}

	@Test
	public void testChangePassword() {
		Reader reader = new Reader();
		reader.setReaderID(160001);
		reader.setPwd("789789");
		readerDAO.changePassword(reader);
	}

}
