package com.tedu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tedu.dao.ICartDao;
import com.tedu.model.Cart;
import com.tedu.model.Product;
import com.tedu.util.DBUtil;

public class CartDao implements ICartDao {

	@Override
	public void add(Cart cart) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "insert into t_cart (pid, uid, quantity, cdate) values(?, ?, ?, now())";
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, cart.getProduct().getId());
			ps.setInt(2, cart.getUser().getId());
			ps.setInt(3, cart.getQuantity());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(con, ps, null);
		}
	}

	//查询登录用户购物车信息
	@Override
	public List<Cart> listByUser(int uid) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from t_cart where uid=? order by cdate desc";//根据插入时间降序排列
		Cart cart = null;
		List<Cart> carts = new ArrayList<>();
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, uid);
			rs = ps.executeQuery();
			while(rs.next()) {
				cart = new Cart();
				cart.setId(rs.getInt("id"));
				Product product = new Product();
				product.setId(rs.getInt("pid"));
				cart.setProduct(product);
				cart.setQuantity(rs.getInt("quantity"));
				carts.add(cart);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(con, ps, rs);
		}
		
		return carts;
	}

	//查询登录用户购物车记录数
	@Override
	public int count(int uid) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select count(*) from t_cart where uid=?";
		int count = 0;
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, uid);
			rs = ps.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(con, ps, rs);
		}
		return count;
	}
	//查询登录用户的购车中是否包含同一个商品
	@Override
	public Cart cartByUser(int uid, int pid) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from t_cart where uid=? and pid=?";
		Cart cart = null;
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, uid);
			ps.setInt(2, pid);
			rs = ps.executeQuery();
			while(rs.next()) {
				cart = new Cart();
				cart.setId(rs.getInt("id"));
				Product product = new Product();
				product.setId(rs.getInt("pid"));
				cart.setProduct(product);
				cart.setQuantity(rs.getInt("quantity"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(con, ps, rs);
		}
		return cart;
	}
	//修改购物车中商品的数量
	@Override
	public void updateQuantity(Cart cart) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "update t_cart set quantity=? where id=?";
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, cart.getQuantity());
			ps.setInt(2, cart.getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(con, ps, null);
		}
	}
	//查询一条购物车记录
	@Override
	public Cart load(int id) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from t_cart where id=?";
		Cart cart = null;
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				cart = new Cart();
				cart.setId(rs.getInt("id"));
				Product product = new Product();
				product.setId(rs.getInt("pid"));
				cart.setProduct(product);
				cart.setQuantity(rs.getInt("quantity"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(con, ps, rs);
		}
		return cart;
	}

	@Override
	public void delete(int id) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "delete from t_cart where id=?";
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(con, ps, null);
		}
	}
}
