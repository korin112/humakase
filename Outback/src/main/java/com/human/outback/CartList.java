package com.human.outback;

import java.util.List;

public class CartList {
	private List<Cart> cart;

	public List<Cart> getCart() {
		return cart;
	}

	public void setCart(List<Cart> cart) {
		this.cart = cart;
	}

	@Override
	public String toString() {
		return "Cartlist [cart=" + cart + "]";
	}
}
