package com.tedu.service.impl;

import java.util.List;

import com.tedu.dao.IAddressDao;
import com.tedu.dao.impl.AddressDao;
import com.tedu.model.Address;
import com.tedu.service.IAddressService;

public class AddressService implements IAddressService {
	private static IAddressDao addressDao = new AddressDao();
	@Override
	public int add(Address address) {
		int id = addressDao.add(address);
		return id;
	}

	@Override
	public List<Address> list(int uid) {
		// TODO Auto-generated method stub
		return addressDao.list(uid);
	}

	@Override
	public Address load(int id) {
		// TODO Auto-generated method stub
		return addressDao.load(id);
	}

}
