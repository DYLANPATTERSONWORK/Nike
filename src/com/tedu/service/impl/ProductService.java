package com.tedu.service.impl;

import java.util.List;

import com.tedu.dao.IImgDao;
import com.tedu.dao.IProductDao;
import com.tedu.dao.impl.ImgDao;
import com.tedu.dao.impl.ProductDao;
import com.tedu.model.Img;
import com.tedu.model.Product;
import com.tedu.service.IProductService;

public class ProductService implements IProductService {
	private static IProductDao productDao = new ProductDao();
	private static IImgDao imgDao = new ImgDao();
	
	public Product load(int id) {
		Product product = productDao.load(id);
		List<Img> imgs = imgDao.listByProduct(id);
		product.setImgs(imgs);
		return product;
	}
	@Override
	public List<Product> list() {
		List<Product> products = productDao.list();
		for(Product product:products) {
			//获取商品的所有图片
			List<Img> imgs = imgDao.listByProduct(product.getId());
			product.setImgs(imgs);
		}
		return products;
	}
	@Override
	public void update(Product product) {
		productDao.udpate(product);
	}

}
