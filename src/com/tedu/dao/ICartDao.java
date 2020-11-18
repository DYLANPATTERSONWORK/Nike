package com.tedu.dao;

import java.util.List;

import com.tedu.model.Cart;

public interface ICartDao {
	public void add(Cart cart);
	public List<Cart> listByUser(int uid);
	public int count(int uid);
	public Cart cartByUser(int uid, int pid);
	public void updateQuantity(Cart cart);
	public Cart load(int id);
	public void delete(int id);
}
