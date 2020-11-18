package com.tedu.dao;

import com.tedu.model.Order;

public interface IOrderDao {
	public int add(Order order);
	public Order load(int id);
	public void updateStatus(int id, int status);
}
