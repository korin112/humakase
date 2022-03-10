package com.human.outback;

public class Vtime {
	private int spot_code;
	private String spot_name;
	private String vdate;
	private int time_code;
	private String time_name;
	private int spot_max;
	private int remain;
	
	public Vtime() {
	}

	public Vtime(int spot_code, String spot_name, String vdate, int time_code, String time_name, int spot_max,
			int remain) {
		this.spot_code = spot_code;
		this.spot_name = spot_name;
		this.vdate = vdate;
		this.time_code = time_code;
		this.time_name = time_name;
		this.spot_max = spot_max;
		this.remain = remain;
	}

	public int getSpot_code() {
		return spot_code;
	}

	public void setSpot_code(int spot_code) {
		this.spot_code = spot_code;
	}

	public String getSpot_name() {
		return spot_name;
	}

	public void setSpot_name(String spot_name) {
		this.spot_name = spot_name;
	}

	public String getVdate() {
		return vdate;
	}

	public void setVdate(String vdate) {
		this.vdate = vdate;
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

	public int getSpot_max() {
		return spot_max;
	}

	public void setSpot_max(int spot_max) {
		this.spot_max = spot_max;
	}

	public int getRemain() {
		return remain;
	}

	public void setRemain(int remain) {
		this.remain = remain;
	}
	
	
}
