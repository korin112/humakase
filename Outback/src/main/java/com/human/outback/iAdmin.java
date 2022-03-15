package com.human.outback;

import java.util.ArrayList;

import com.human.outback.DTO.Book;
import com.human.outback.DTO.BookingDetail;
import com.human.outback.DTO.Pagination;

public interface iAdmin {
	// adm book
	ArrayList<Book> getAdminBook(Pagination pagination);
	public int getCntBooking();
	ArrayList<BookingDetail> getAdmBookingDetail(int book_id);
}
