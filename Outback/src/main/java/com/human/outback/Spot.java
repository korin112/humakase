package com.human.outback;

public class Spot {
	private int spot_code;
	private String spot_name;
	private int spot_max;
	
	public Spot() {
	}
	
	public Spot(int spot_code, String spot_name, int spot_max) {
		this.spot_code = spot_code;
		this.spot_name = spot_name;
		this.spot_max = spot_max;
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
	public int getSpot_max() {
		return spot_max;
	}
	public void setSpot_max(int spot_max) {
		this.spot_max = spot_max;
	}
	
	
}
