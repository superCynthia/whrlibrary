package com.whrlibrary.dao;

import com.whrlibrary.obj.Reader;

public interface ReaderDAO {
	public Reader getReader(int id, String pwd);

	public void addReader(String name,String pwd,String sex,String tel,String info);

	public void editReader(String name,String pwd,String sex,String tel,String info);
	
	public void changePassword(Reader reader);

}
