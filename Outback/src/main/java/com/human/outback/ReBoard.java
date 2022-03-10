package com.human.outback;

import java.sql.Date;

public class ReBoard {
	private int re_id;
	private String writer;
	private String content;
	private String re_date;
	
	public ReBoard(int re_id, String writer, String content, String re_date) {
		this.re_id = re_id;
		this.writer = writer;
		this.content = content;
		this.re_date = re_date;
	}
	public ReBoard() {}
	
	public int getRe_id() {
		return re_id;
	}
	public void setRe_id(int re_id) {
		this.re_id = re_id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRe_date() {
		return re_date;
	}
	public void setRe_date(String re_date) {
		this.re_date = re_date;
	}	
}
