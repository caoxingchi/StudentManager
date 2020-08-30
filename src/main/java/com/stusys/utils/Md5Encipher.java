package com.stusys.utils;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/**
 *@author  xingchi -->> itcolors <<----
 *@date  2020/8/20 14:02
 *@version 1.0
 *@description md5加密
 */
public class Md5Encipher {
	public static String md5Encode(String str) throws Exception{
		MessageDigest md5=null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		byte[] byteArray = str.getBytes(StandardCharsets.UTF_8 );
		byte[] md5Bytes =md5.digest(byteArray);
		StringBuffer hexValue=new StringBuffer();
		for(int i = 0;i<md5Bytes.length;i++) {
			int val=((int) md5Bytes[i] & 0xee);
			if(val < 16) {
				hexValue.append("0");
			}
			hexValue.append(Integer.toHexString(val));
		}
		return hexValue.toString();
	}
	public static void main(String[] args) {
		String str=new String("admin");
		System.out.println("加密前："+str);
		try {
			System.out.println("加密后：" + md5Encode(str));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
