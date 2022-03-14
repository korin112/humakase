package com.human.outback;

public class Allmenu {
//	select a.menu_type, b.mtype_name, a.menu_code, a.menu_name, a.menu_price,
//	a.comment, a.img from menu a, menutype b where a.menu_type = b.mtype_code
	private int menu_type;
	private String mtype_name;
	private int menu_code;
	private String menu_name;
	private int menu_price;
	private String comment;
	private String img;
	public Allmenu() {
	}
	public Allmenu(int menu_type, String mtype_name, int menu_code, String menu_name, int menu_price, String comment,
			String img) {
		this.menu_type = menu_type;
		this.mtype_name = mtype_name;
		this.menu_code = menu_code;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.comment = comment;
		this.img = img;
	}
	public int getMenu_type() {
		return menu_type;
	}
	public void setMenu_type(int menu_type) {
		this.menu_type = menu_type;
	}
	public String getMtype_name() {
		return mtype_name;
	}
	public void setMtype_name(String mtype_name) {
		this.mtype_name = mtype_name;
	}
	public int getMenu_code() {
		return menu_code;
	}
	public void setMenu_code(int menu_code) {
		this.menu_code = menu_code;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
}
