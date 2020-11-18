package com.tedu.service.impl;

import java.util.List;

import com.tedu.dao.ICartDao;
import com.tedu.dao.IImgDao;
import com.tedu.dao.IProductDao;
import com.tedu.dao.impl.CartDao;
import com.tedu.dao.impl.ImgDao;
import com.tedu.dao.impl.ProductDao;
import com.tedu.model.Cart;
import com.tedu.model.Img;
import com.tedu.model.Product;
import com.tedu.service.ICartService;

public class CartService implements ICartService {
	private static ICartDao cartDao = new CartDao();
	private static IProductDao productDao = new ProductDao();
	private static IImgDao imgDao = new ImgDao();

	@Override
	public void add(Cart cart) {
		//查询登录用户的购物车中是否包含相同的商品
		Cart c = cartDao.cartByUser(cart.getUser().getId(), cart.getProduct().getId());
		//如果不包含直接添加购物车记录
		if(c == null) {
			cartDao.add(cart);
		}
		//如果包含修改购物车中商品的数量
		else {
			c.setQuantity(c.getQuantity() + cart.getQuantity());
			cartDao.updateQuantity(c);
		}
	}

	@Override
	public List<Cart> listByUser(int uid) {
		List<Cart> carts = cartDao.listByUser(uid);
		for(Cart cart:carts) {
			//获取商品详细信息
			Product product = productDao.load(cart.getProduct().getId());
			//获取商品的图片
			List<Img> imgs = imgDao.listByProduct(product.getId());
			product.setImgs(imgs);
			cart.setProduct(product);
		}
		return carts;
	}

	@Override
	public int count(int uid) {
		int count = cartDao.count(uid);
		return count;
	}

	@Override
	public void updateQuantity(Cart cart) {
		cartDao.updateQuantity(cart);
	}

	@Override
	public Cart load(int id) {
		Cart cart = cartDao.load(id);
		//获取商品详细信息
		Product product = productDao.load(cart.getProduct().getId());
		//获取商品的图片
		List<Img> imgs = imgDao.listByProduct(product.getId());
		product.setImgs(imgs);
		cart.setProduct(product);
		return cart;
	}

	@Override
	public void delete(int id) {
		cartDao.delete(id);
	}

}
