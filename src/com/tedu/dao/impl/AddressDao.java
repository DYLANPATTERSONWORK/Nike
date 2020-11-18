package com.tedu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tedu.dao.IAddressDao;
import com.tedu.model.Address;
import com.tedu.util.DBUtil;

public class AddressDao implements IAddressDao {
	//用户添加地址,返回新添加地址的ID
	@Override
	public int add(Address address) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "insert into t_address (address, name, phone, uid) values(?, ?, ?, ?)";
		int id = 0;
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, address.getAddress());
			ps.setString(2, address.getName());
			ps.setString(3, address.getPhone());
			ps.setInt(4, address.getUser().getId());
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

	//用户查询自己的地址
	@Override
	public List<Address> list(int uid) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from t_address where uid=?";
		Address address = null;
		List<Address> addresses = new ArrayList<>();
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, uid);
			rs = ps.executeQuery();
			while(rs.next()) {
				address = new Address();
				address.setId(rs.getInt("id"));
				address.setAddress(rs.getString("address"));
				address.setName(rs.getString("name"));
				address.setPhone(rs.getString("phone"));
				addresses.add(address);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(con, ps, null);
		}
		return addresses;
	}

	@Override
	public Address load(int id) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from t_address where id=?";
		Address address = null;
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				address = new Address();
				address.setId(rs.getInt("id"));
				address.setAddress(rs.getString("address"));
				address.setName(rs.getString("name"));
				address.setPhone(rs.getString("phone"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(con, ps, null);
		}
		return address;
	}

}
