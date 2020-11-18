package com.tedu.dao;

import java.util.List;

import com.tedu.model.OrderProduct;

public interface IOrderProductDao {
	public int add(OrderProduct orderProduct);
	public List<OrderProduct> listByOrder(int oid);
}
