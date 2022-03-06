package com.human.outback;

import java.util.ArrayList;
import java.util.List;

public interface iBook {
	ArrayList<Cart> getCart();
	void updateCart(int cart_code, int menu_cnt);
	void deleteCart(String cart_code);
	ArrayList<Cart> getBooklist(List<Cart> arCart);
//	public List<Cart> getBooklist(List<Cart> cart);
//	public List<CartList> getBooklist(List<Cart> cart);
//	Cart getBooklist(Cart cart);
}
