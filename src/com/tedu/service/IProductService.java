package com.tedu.service;

import java.util.List;

import com.tedu.model.Product;

public interface IProductService {
	public Product load(int id);
	public List<Product> list();
	public void update(Product product);
}
