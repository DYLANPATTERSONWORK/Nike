package com.tedu.service;

import com.tedu.model.Order;

public interface IOrderService {
	public int add(Order order);
	public Order load(int id);
	public void updateStatus(int id, int status);
}
