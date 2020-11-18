package com.tedu.dao;

import java.util.List;

import com.tedu.model.User;

public interface IUserDao {
	public void add(User user);
	public void update(User user);
	public User load(int id);
	public int loadByUsername(String username);
	public User login(String username);
}
