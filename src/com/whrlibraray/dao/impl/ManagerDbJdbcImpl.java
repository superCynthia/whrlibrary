package com.whrlibraray.dao.impl;

import com.whrlibrary.dao.DAO;
import com.whrlibrary.dao.ManagerDAO;
import com.whrlibrary.obj.Manager;

public class ManagerDbJdbcImpl extends DAO<Manager>implements ManagerDAO {

	@Override
	public Manager getManager(int id, String pwd) {
		String sqlString="select * from managers where managerID=? and pwd=?";
		Manager manager=get(sqlString, id,pwd);
		return manager;
	}

}
