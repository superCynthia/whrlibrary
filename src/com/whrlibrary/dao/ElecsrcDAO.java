package com.whrlibrary.dao;

import java.util.List;

import com.whrlibrary.obj.Elecsrc;

public interface ElecsrcDAO {
	public List<Elecsrc> getSrcForName(String name);
	
	public List<Elecsrc> getSrcForWriter(String writer);
}
