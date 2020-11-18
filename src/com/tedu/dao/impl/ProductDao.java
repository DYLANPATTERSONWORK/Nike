package com.tedu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tedu.dao.IProductDao;
import com.tedu.model.Product;
import com.tedu.util.DBUtil;

public class ProductDao implements IProductDao {
	//查询商品详细信息
	public Product load(int id) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from t_product where id=?";
		Product product = null;
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getDouble("price"));
				product.setDescribe(rs.getString("describe"));
				product.setSales(rs.getInt("sales"));
				product.setInventory(rs.getInt("inventory"));
				product.setDiscount(rs.getDouble("discount"));
				product.setStatus(rs.getInt("status"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(con, ps, rs);
		}
		return product;
	}
	//查询所有上架的商品
	@Override
	public List<Product> list() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from t_product where status=1";//查询上架的商品
		Product product = null;
		List<Product> products = new ArrayList<>();
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getDouble("price"));
				product.setDescribe(rs.getString("describe"));
				product.setSales(rs.getInt("sales"));
				product.setInventory(rs.getInt("inventory"));
				product.setDiscount(rs.getDouble("discount"));
				product.setStatus(rs.getInt("status"));
				products.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(con, ps, rs);
		}
		return products;
	}
	@Override
	public void udpate(Product product) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "update t_product set name=?, price=?, sales=?, inventory=?, discount=?, status=? where id=?";
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, product.getName());
			ps.setDouble(2, product.getPrice());
			ps.setInt(3, product.getSales());
			ps.setInt(4, product.getInventory());
			ps.setDouble(5, product.getDiscount());
			ps.setInt(6, product.getStatus());
			ps.setInt(7, product.getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(con, ps, null);
		}
	}

}
