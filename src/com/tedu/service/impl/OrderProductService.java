package com.tedu.service.impl;

import com.tedu.dao.IOrderProductDao;
import com.tedu.dao.impl.OrderProductDao;
import com.tedu.model.OrderProduct;
import com.tedu.service.IOrderProductService;

public class OrderProductService implements IOrderProductService {
	private static IOrderProductDao orderProductDao = new OrderProductDao();
	@Override
	public int add(OrderProduct orderProduct) {
		int id = orderProductDao.add(orderProduct);
		return id;
	}

}
