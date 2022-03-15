package com.human.outback.DTO;

public class BookingDetail {
	private int book_id;
	private int menu_code;
	private String menu_name;
	private int m_qty;
	private int price;
	private int total;
	public BookingDetail() {
	}
	public BookingDetail(int book_id, int menu_code, String menu_name, int m_qty, int price, int total) {
		this.book_id = book_id;
		this.menu_code = menu_code;
		this.menu_name = menu_name;
		this.m_qty = m_qty;
		this.price = price;
		this.total = total;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
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
	public int getM_qty() {
		return m_qty;
	}
	public void setM_qty(int m_qty) {
		this.m_qty = m_qty;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	
}
