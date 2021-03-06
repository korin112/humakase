package com.human.outback;

import java.util.Date;

public class Board {
	private int board_id;
	private String title;
	private String content;
	private String writer;
	private Date created;
	private Date updated;
	private String vdate;
	private int spot_code;
	private int menu_code;
	
	private String c_date;
	
	private String spot_name;
	private String menu_name;
	
	private int book_id;
	
	public Board(int board_id, String title, String content, String writer, Date created, Date updated, String vdate,
			int spot_code, int menu_code, String spot_name, String menu_name, int book_id,
			String c_date) {
		this.board_id = board_id;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.created = created;
		this.updated = updated;
		this.vdate = vdate;
		this.spot_code = spot_code;
		this.menu_code = menu_code;
		this.spot_name = spot_name;
		this.menu_name = menu_name;
		this.book_id = book_id;
		this.c_date = c_date;
	}
	public Board() {}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public Date getUpdated() {
		return updated;
	}
	public void setUpdated(Date updated) {
		this.updated = updated;
	}
	public String getVdate() {
		return vdate;
	}
	public void setVdate(String vdate) {
		this.vdate = vdate;
	}
	public int getSpot_code() {
		return spot_code;
	}
	public void setSpot_code(int spot_code) {
		this.spot_code = spot_code;
	}
	public int getMenu_code() {
		return menu_code;
	}
	public void setMenu_code(int menu_code) {
		this.menu_code = menu_code;
	}
	public String getSpot_name() {
		return spot_name;
	}
	public void setSpot_name(String spot_name) {
		this.spot_name = spot_name;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	
}
