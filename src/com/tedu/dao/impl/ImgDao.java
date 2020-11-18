package com.tedu.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tedu.dao.IImgDao;
import com.tedu.model.Img;
import com.tedu.util.DBUtil;

public class ImgDao implements IImgDao {

	@Override
	public List<Img> listByProduct(int pid) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from t_img where pid=?";
		Img img = null;
		List<Img> imgs = new ArrayList<>();
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, pid);
			rs = ps.executeQuery();
			while(rs.next()) {
				img = new Img();
				img.setId(rs.getInt("id"));
				img.setName(rs.getString("name"));
				imgs.add(img);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(con, ps, rs);
		}
		return imgs;
	}

}
