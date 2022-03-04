package com.human.outback;

public class Cart {
	private int cart_code;
	private String menu_name;
	private int menu_cnt;
	private int menu_price;
	private int menu_total;
	public Cart() {
	}
	public Cart(int cart_code, String menu_name, int menu_cnt, int menu_price, int menu_total) {
		this.cart_code = cart_code;
		this.menu_name = menu_name;
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
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
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
	
}
