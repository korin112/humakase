package com.human.outback;

public class Menutype {
	private int mtype_code;
	private String mtype_name;
	public Menutype() {
		super();
	}
	public Menutype(int mtype_code, String mtype_name) {
		super();
		this.mtype_code = mtype_code;
		this.mtype_name = mtype_name;
	}
	public int getMtype_code() {
		return mtype_code;
	}
	public void setMtype_code(int mtype_code) {
		this.mtype_code = mtype_code;
	}
	public String getMtype_name() {
		return mtype_name;
	}
	public void setMtype_name(String mtype_name) {
		this.mtype_name = mtype_name;
	}
	
}
