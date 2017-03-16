package com.whrlibraray.dao.impl;

import java.util.List;

import com.whrlibrary.dao.DAO;
import com.whrlibrary.dao.ElecsrcDAO;
import com.whrlibrary.obj.Elecsrc;

public class ElecsrcDbJdbcImpl extends DAO<Elecsrc> implements ElecsrcDAO {

	@Override
	public List<Elecsrc> getSrcForName(String name) {
		String sql="select * from elecsrc where srcName like '%"+name+"%'";
		return getForList(sql);
	}

	@Override
	public List<Elecsrc> getSrcForWriter(String writer) {
		String sql="select * from elecsrc where writer like '%"+writer+"%'";
		return getForList(sql);
	}

}
