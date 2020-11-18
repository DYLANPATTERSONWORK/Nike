package com.tedu.service.impl;

import java.util.List;

import com.tedu.dao.IUserDao;
import com.tedu.dao.impl.UserDao;
import com.tedu.exception.UserException;
import com.tedu.model.User;
import com.tedu.service.IUserService;
import com.tedu.util.CodeUtil;

public class UserService implements IUserService {
	private IUserDao userDao = new UserDao();
	@Override
	public void add(User user) {
		String password = user.getPassword();
		String newPassword = CodeUtil.getMD5Encoding(password);
		user.setPassword(newPassword);
		userDao.add(user);
	}

	@Override
	public void update(User user) {
		String password = user.getPassword();
		String newPassword = CodeUtil.getMD5Encoding(password);
		user.setPassword(newPassword);
		userDao.update(user);
	}

	@Override
	public User load(int id) {
		// TODO Auto-generated method stub
		return userDao.load(id);
	}


	@Override
	public User login(String username, String password) {
		User user = userDao.login(username);
		if(user == null) {
			throw new UserException("用户名不存在");
		}
		if(!user.getPassword().equals(CodeUtil.getMD5Encoding(password))) {
			throw new UserException("密码不正确");
		}
		return user;
	}

	@Override
	public int loadByUsername(String username) {
		// TODO Auto-generated method stub
		return userDao.loadByUsername(username);
	}

}
