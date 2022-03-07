package com.human.outback;

public class Vtime {
	private int time_code;
	private String time_name;
	public Vtime() {
	}
	public Vtime(int time_code, String time_name) {
		this.time_code = time_code;
		this.time_name = time_name;
	}
	public int getTime_code() {
		return time_code;
	}
	public void setTime_code(int time_code) {
		this.time_code = time_code;
	}
	public String getTime_name() {
		return time_name;
	}
	public void setTime_name(String time_name) {
		this.time_name = time_name;
	}
	
	
}
