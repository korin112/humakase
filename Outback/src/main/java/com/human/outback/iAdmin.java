package com.human.outback;

import java.util.ArrayList;

import com.human.outback.DTO.Book;
import com.human.outback.DTO.BookingDetail;
import com.human.outback.DTO.Menu;
import com.human.outback.DTO.Menutype;
import com.human.outback.DTO.Pagination;

public interface iAdmin {
	// adm book
	ArrayList<Book> getAdminBook(Pagination pagination);
	public int getCntBooking();
	ArrayList<BookingDetail> getAdmBookingDetail(int book_id);
	void deleteAdmBook(String book_id);
	// adm menu
	ArrayList<Menu> getMenu();
	void insertMenu(int menu_type,String img,String menu_name,int menu_price,String comment);
	void deleteMenu(int menu_code);
	ArrayList<Menutype> getMenutype();
	void updateMenu(int menu_code, int menu_type, String img,String menu_name, int menu_price,String comment);
	ArrayList<Menu> getImg(int menu_code);
	// add menutype
	void insertType(String mtype_name );
	ArrayList<Menutype> getMenutype1();
	void deleteType(int mtype_code);
	void updateType(int mtype_code, String mtype_name);
}
