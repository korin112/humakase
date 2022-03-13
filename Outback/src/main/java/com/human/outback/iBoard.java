package com.human.outback;

import java.util.ArrayList;

public interface iBoard {
	ArrayList<Board> dateList(String booker);
	ArrayList<Board> getId(String booker, String vdate);
	ArrayList<Board> spotList(String booker, String vdate, int book_id);
	ArrayList<Board> menuList(String booker, String vdate, int book_id);
	
	void insertBoard(String title,String content,String writer,String vdate,int spot_code,int menu_code);

	// board list
	ArrayList<Board> boardList(int skip, int amount);
	public int getTotal();
	
	Board getBoard(int board_id);
	void updateBoard(int board_id, String title, String content);
	void deleteBoard(int board_id);
	
	// 댓글
	ArrayList<ReBoard> reBoard(int board_id);
	void reInsert(int board_id, int grp, String writer, String content);
	void reDelete(int re_id);
	void reUpdate(int re_id, String content);
	
	// session member
	Member getSession(String userid);
}
