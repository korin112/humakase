package com.human.outback;

public class Member {
	private String userid;
	private String passcode;
	private String name;
	private String mobile;
	private String gender;
	private String user_type;
	private String login_time;
	private String logout_time;
	
	public Member() {
	}

	public Member(String userid, String passcode, String name, String mobile, String gender, String user_type,
			String login_time, String logout_time) {
		this.userid = userid;
		this.passcode = passcode;
		this.name = name;
		this.mobile = mobile;
		this.gender = gender;
		this.user_type = user_type;
		this.login_time = login_time;
		this.logout_time = logout_time;
	}

	public String getUserid() {
		return userid;
	}

	public String getPasscode() {
		return passcode;
	}

	public String getName() {
		return name;
	}

	public String getMobile() {
		return mobile;
	}

	public String getGender() {
		return gender;
	}

	public String getUser_type() {
		return user_type;
	}

	public String getLogin_time() {
		return login_time;
	}

	public String getLogout_time() {
		return logout_time;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public void setPasscode(String passcode) {
		this.passcode = passcode;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public void setLogin_time(String login_time) {
		this.login_time = login_time;
	}

	public void setLogout_time(String logout_time) {
		this.logout_time = logout_time;
	}

	
	
}