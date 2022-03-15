package com.human.outback;

import java.util.ArrayList;

import com.human.outback.DTO.Book;
import com.human.outback.DTO.Pagination;

public interface iAdmin {
	ArrayList<Book> getAdminBook(Pagination pagination);
	public int getCntBooking();
}
