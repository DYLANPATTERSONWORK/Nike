package com.tedu.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class CodeUtil {
	public static String getMD5Encoding(String password) {
		//创建加密计算器
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//加密
		md5.update(password.getBytes());
		//转换输出
		return new BigInteger(1, md5.digest()).toString(16);
	}
}
