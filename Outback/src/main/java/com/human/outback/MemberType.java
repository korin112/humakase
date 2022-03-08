package com.human.outback;

public class MemberType {
	private String userid;
	private int type_code;
	private String type_name;
	
	public MemberType() {
	}

	public MemberType(String userid, int type_code, String type_name) {
		this.userid = userid;
		this.type_code = type_code;
		this.type_name = type_name;
	}

	public String getUserid() {
		return userid;
	}

	public int getType_code() {
		return type_code;
	}

	public String getType_name() {
		return type_name;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public void setType_code(int type_code) {
		this.type_code = type_code;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	
	
}
