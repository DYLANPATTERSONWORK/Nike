package com.tedu.service;

import java.util.List;

import com.tedu.model.User;

public interface IUserService {
	public void add(User user);
	public void update(User user);
	public User load(int id);
	public User login(String username, String password);
	public int loadByUsername(String username);
}
