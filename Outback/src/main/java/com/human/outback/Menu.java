package com.human.outback;

public class Menu {
	private int menu_code;
	private int menu_type;
	private String menu_name;
	private int menu_price;
	private String comment;
	public Menu() {
		super();
	}
	public Menu(int menu_code, int menu_type, String menu_name, int menu_price, String comment) {
		super();
		this.menu_code = menu_code;
		this.menu_type = menu_type;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.comment = comment;
	}
	public int getMenu_code() {
		return menu_code;
	}
	public void setMenu_code(int menu_code) {
		this.menu_code = menu_code;
	}
	public int getMenu_type() {
		return menu_type;
	}
	public void setMenu_type(int menu_type) {
		this.menu_type = menu_type;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
}
