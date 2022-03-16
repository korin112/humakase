package com.human.outback.DTO;

public class Book {
	
	private int book_id;
	private String spot_name;
	private String booker;
	private String name;
	private int howmany;
	private int m_qty;
	private int total;
	private String vdate;
	private String time_name;
	private String msg;
	public Book() {
	}
	public Book(int book_id, String spot_name, String booker, String name, int howmany, int m_qty, int total,
			String vdate, String time_name, String msg) {
		this.book_id = book_id;
		this.spot_name = spot_name;
		this.booker = booker;
		this.name = name;
		this.howmany = howmany;
		this.m_qty = m_qty;
		this.total = total;
		this.vdate = vdate;
		this.time_name = time_name;
		this.msg = msg;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getSpot_name() {
		return spot_name;
	}
	public void setSpot_name(String spot_name) {
		this.spot_name = spot_name;
	}
	public String getBooker() {
		return booker;
	}
	public void setBooker(String booker) {
		this.booker = booker;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getHowmany() {
		return howmany;
	}
	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}
	public int getM_qty() {
		return m_qty;
	}
	public void setM_qty(int m_qty) {
		this.m_qty = m_qty;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getVdate() {
		return vdate;
	}
	public void setVdate(String vdate) {
		this.vdate = vdate;
	}
	public String getTime_name() {
		return time_name;
	}
	public void setTime_name(String time_name) {
		this.time_name = time_name;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
}
