package com.tedu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.tedu.dao.IOrderDao;
import com.tedu.model.Address;
import com.tedu.model.Order;
import com.tedu.util.DBUtil;

public class OrderDao implements IOrderDao {

	@Override
	public int add(Order order) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "insert into t_order (price, status, isdel, odate, aid, uid) values(?, ?, ?, now(), ?, ?)";
		int id = 0;
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setDouble(1, order.getPrice());
			ps.setInt(2, order.getStatus());
			ps.setInt(3, order.getIsdel());
			ps.setInt(4, order.getAddress().getId());
			ps.setInt(5, order.getUser().getId());
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
	public Order load(int id) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from t_order where id=?";
		Order order = null;
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				order = new Order();
				order.setId(rs.getInt("id"));
				order.setStatus(rs.getInt("status"));
				order.setIsdel(rs.getInt("isdel"));
				order.setPrice(rs.getDouble("price"));
				order.setOdate(rs.getDate("odate"));
				Address address = new Address();
				address.setId(rs.getInt("aid"));
				order.setAddress(address);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(con, ps, rs);
		}
		return order;
	}

	@Override
	public void updateStatus(int id, int status) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "update t_order set status=? where id=?";
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, status);
			ps.setInt(2, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(con, ps, null);
		}
		
	}
	
}
