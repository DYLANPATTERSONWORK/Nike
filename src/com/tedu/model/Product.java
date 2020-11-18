package com.tedu.model;

import java.util.List;

/**
 * 
 * id:主键
 * name:商品名
 * price:单价
 * describe:描述
 * sales:销量
 * inventory:库存
 * discount:折扣
 * status:状态,1.表示上架,2.表示下架
 * imgs:商品图片
 */
public class Product {
	private int id;
	private String name;
	private double price;
	private String describe;
	private int sales;
	private int inventory;
	private double discount;
	private int status;
	private List<Img> imgs;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public List<Img> getImgs() {
		return imgs;
	}
	public void setImgs(List<Img> imgs) {
		this.imgs = imgs;
	}
	
}
