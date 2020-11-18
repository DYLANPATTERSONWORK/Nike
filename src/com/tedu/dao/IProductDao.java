package com.tedu.dao;

import java.util.List;

import com.tedu.model.Product;

public interface IProductDao {
	public Product load(int id);
	public List<Product> list();
	public void udpate(Product product);
}
