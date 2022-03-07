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
}
