package com.human.outback;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface iBook {
	ArrayList<Cart> getCart(String userid);
	void updateCart(int cart_code, int menu_cnt);
	void deleteCart(String cart_code);
	ArrayList<Cart> getBooklist(@Param("userid")String userid, @Param("list")List<Cart> arCart);
	Member getUserSession(String userid);
	ArrayList<Spot> getSpot();
	ArrayList<Vtime> getVtime(int spot_code, String vdate);
	void insertBook(int spot_code, String booker, int howmany, int m_qty, int total, String vdate, int vtime, String msg);
	void insertBookDetail(@Param("param1")String booker, @Param("list")List<Cart> arCart);
	void deleteBookCart(@Param("list")List<Cart> arCart);
	ArrayList<Allmenu> getAllmenu(int menu_type);
	ArrayList<Allmenu> getMenutype();
}
