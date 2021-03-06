package com.human.outback;

public class Cart {
	private int cart_code;
	private String userid;
	private String menu_name;
	private int menu_code;
	private int menu_cnt;
	private int menu_price;
	private int menu_total;
	public Cart() {
	}
	public Cart(int cart_code, String userid, String menu_name, int menu_code, int menu_cnt, int menu_price,
			int menu_total) {
		this.cart_code = cart_code;
		this.userid = userid;
		this.menu_name = menu_name;
		this.menu_code = menu_code;
		this.menu_cnt = menu_cnt;
		this.menu_price = menu_price;
		this.menu_total = menu_total;
	}
	public int getCart_code() {
		return cart_code;
	}
	public void setCart_code(int cart_code) {
		this.cart_code = cart_code;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_code() {
		return menu_code;
	}
	public void setMenu_code(int menu_code) {
		this.menu_code = menu_code;
	}
	public int getMenu_cnt() {
		return menu_cnt;
	}
	public void setMenu_cnt(int menu_cnt) {
		this.menu_cnt = menu_cnt;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public int getMenu_total() {
		return menu_total;
	}
	public void setMenu_total(int menu_total) {
		this.menu_total = menu_total;
	}
//	@Override
//	public String toString() {
//		return "Cart [cart_code=" + cart_code + ", menu_name=" + menu_name + ", menu_cnt=" + menu_cnt
//				+ ", menu_price=" + menu_price + ", menu_total=" + menu_total + "]";
//	}
	
	@Override
	public String toString() {
		if(Integer.toString(cart_code).equals(null)) {
			return "";
		} else {
			return Integer.toString(cart_code);
		}
	}
}
