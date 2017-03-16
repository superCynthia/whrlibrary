package com.whrlibraray.dao.impl;

import com.whrlibrary.dao.DAO;
import com.whrlibrary.dao.ReaderDAO;
import com.whrlibrary.obj.Reader;

public class ReaderDbJdbcImpl extends DAO<Reader>implements ReaderDAO {

	@Override
	public Reader getReader(int id, String pwd) {
		String sqlString = "select * from readers where readerID=? and pwd=?";
		Reader reader = get(sqlString, id, pwd);
		return reader;
	}

	@Override
	public void addReader(String name, String pwd, String sex, String tel, String info) {
		String sql = "insert into readers(readerName,pwd,sex,tel,info) values(?,?,?,?,?)";
		update(sql, name, pwd, sex, tel, info);
	}

	@Override
	public void editReader(String name, String pwd, String sex, String tel, String info) {
		// TODO Auto-generated method stub

	}

	@Override
	public void changePassword(Reader reader) {
		String sql = "update readers set pwd = ? where readerID = ?";
		update(sql, reader.getPwd(), reader.getReaderID());
	}

}
