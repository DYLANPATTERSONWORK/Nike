package com.tedu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tedu.dao.IOrderProductDao;
import com.tedu.model.OrderProduct;
import com.tedu.model.Product;
import com.tedu.util.DBUtil;

public class OrderProductDao implements IOrderProductDao {

	@Override
	public int add(OrderProduct orderProduct) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "insert into t_order_product (buynum, oid, pid) values(?, ?, ?)";
		int id = 0;
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, orderProduct.getBuynum());
			ps.setInt(2, orderProduct.getOrder().getId());
			ps.setInt(3, orderProduct.getProduct().getId());
			ps.executeUpdate();
			rs = ps.getGeneratedKeys();
			while(rs.next()) {
				id = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(con, ps, rs);
		}
		return id;
	}

	@Override
	public List<OrderProduct> listByOrder(int oid) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from t_order_product where oid=?";
		OrderProduct orderProduct = null;
		List<OrderProduct> orderProducts = new ArrayList<>();
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, oid);
			rs = ps.executeQuery();
			while(rs.next()) {
				orderProduct = new OrderProduct();
				orderProduct.setId(rs.getInt("id"));
				orderProduct.setBuynum(rs.getInt("buynum"));
				Product product = new Product();
				product.setId(rs.getInt("pid"));
				orderProduct.setProduct(product);
				orderProducts.add(orderProduct);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(con, ps, rs);
		}
		return orderProducts;
	}

}
