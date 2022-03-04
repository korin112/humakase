package com.human.outback;

import java.util.ArrayList;

public interface iBoard {
	ArrayList<Board> menuList();
	void insertBoard(String title,String content,String writer,String vdate,int spot_code,int menu_code);

	// board list
	ArrayList<Board> boardList();
	Board getBoard(int board_id);
	void updateBoard(int board_id, String title, String content);
	void deleteBoard(int board_id);
}
