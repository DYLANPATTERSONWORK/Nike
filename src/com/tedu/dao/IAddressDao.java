package com.tedu.dao;

import java.util.List;

import com.tedu.model.Address;

public interface IAddressDao {
	public int add(Address address);
	public List<Address> list(int uid);
	public Address load(int id);
}
