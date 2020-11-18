package com.tedu.service.impl;

import java.util.List;

import com.tedu.dao.IAddressDao;
import com.tedu.dao.IImgDao;
import com.tedu.dao.IOrderDao;
import com.tedu.dao.IOrderProductDao;
import com.tedu.dao.IProductDao;
import com.tedu.dao.impl.AddressDao;
import com.tedu.dao.impl.ImgDao;
import com.tedu.dao.impl.OrderDao;
import com.tedu.dao.impl.OrderProductDao;
import com.tedu.dao.impl.ProductDao;
import com.tedu.model.Address;
import com.tedu.model.Img;
import com.tedu.model.Order;
import com.tedu.model.OrderProduct;
import com.tedu.model.Product;
import com.tedu.service.IOrderService;

public class OrderService implements IOrderService {
	private static IOrderDao orderDao = new OrderDao();
	private static IOrderProductDao orderProductDao = new OrderProductDao();
	private static IProductDao productDao = new ProductDao();
	private static IImgDao imgDao = new ImgDao();
	private static IAddressDao addressDao = new AddressDao();
	@Override
	public int add(Order order) {
		int id = orderDao.add(order);
		return id;
	}
	@Override
	public Order load(int id) {
		Order order = orderDao.load(id);
		Address address = addressDao.load(order.getAddress().getId());
		order.setAddress(address);
		List<OrderProduct> orderProducts = orderProductDao.listByOrder(id);
		for(OrderProduct orderProduct:orderProducts) {
			Product product = productDao.load(orderProduct.getProduct().getId());
			List<Img> imgs = imgDao.listByProduct(product.getId());
			product.setImgs(imgs);
			orderProduct.setProduct(product);
		}
		order.setOrderProducts(orderProducts);
		return order;
	}
	@Override
	public void updateStatus(int id, int status) {
		orderDao.updateStatus(id, status);
	}

}
