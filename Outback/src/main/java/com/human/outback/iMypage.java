package com.human.outback;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.human.outback.DTO.Book;
import com.human.outback.DTO.Pagination;

public interface iMypage {
	//my reservation
	public int getCntLaterMyBook(String userid);
	public int getCntPrevMyBook(String userid);
	ArrayList<Book> getMylaterbook(@Param("param1")String booker, @Param("pagination")Pagination pagination);
	ArrayList<Book> getMyPrevbook(@Param("param1")String booker, @Param("pagination")Pagination pagination);
	void deleteMybook(int book_id);
	ArrayList<Allmenu> getNewmenu();
}
