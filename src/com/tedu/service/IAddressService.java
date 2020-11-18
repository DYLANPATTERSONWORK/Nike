package com.tedu.service;

import java.util.List;

import com.tedu.model.Address;

public interface IAddressService {
	public int add(Address address);
	public List<Address> list(int uid);
	public Address load(int id);
}
