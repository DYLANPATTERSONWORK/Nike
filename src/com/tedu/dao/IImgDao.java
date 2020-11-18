package com.tedu.dao;

import java.util.List;

import com.tedu.model.Img;

public interface IImgDao {
	public List<Img> listByProduct(int pid);
}
