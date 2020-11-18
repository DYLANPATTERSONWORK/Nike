package com.tedu.service;

import java.util.List;

import com.tedu.model.Cart;

public interface ICartService {
	public void add(Cart cart);
	public List<Cart> listByUser(int uid);
	public int count(int uid);
	public void updateQuantity(Cart cart);
	public Cart load(int id);
	public void delete(int id);
}
