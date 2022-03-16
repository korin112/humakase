package com.human.outback;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.human.outback.DTO.Book;
import com.human.outback.DTO.Pagination;

public interface iMypage {
	//my reservation
	ArrayList<Book> getMybook(@Param("param1")String booker, @Param("pagination")Pagination pagination);
	public int getCntMyBooking(String booker);
	void deleteAdmBook(String book_id);
}
