package com.whrlibrary.obj;

import java.sql.Date;

public class Elecsrc {
	private int esrcID;
	private String srcName;
	private String writer;
	private Date coTime;
	private int status;
	public int getEsrcID() {
		return esrcID;
	}
	public void setEsrcID(int esrcID) {
		this.esrcID = esrcID;
	}
	public String getSrcName() {
		return srcName;
	}
	public void setSrcName(String srcName) {
		this.srcName = srcName;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
