package com.human.outback;

import java.util.ArrayList;

public interface iBook {
	ArrayList<Cart> getCart();
	void updateCart(int cart_code, int menu_cnt);
	void deleteCart(String cart_code);
	ArrayList<Cart> getBooklist(int cart_code);
}
