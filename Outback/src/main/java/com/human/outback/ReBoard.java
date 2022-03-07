package com.human.outback;

import java.util.Date;

public class ReBoard {
	private String writer;
	private String content;
	private Date re_date;
	
	public ReBoard(String writer, String content, Date re_date) {
		this.writer = writer;
		this.content = content;
		this.re_date = re_date;
	}
	public ReBoard() {}
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
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}	
}
