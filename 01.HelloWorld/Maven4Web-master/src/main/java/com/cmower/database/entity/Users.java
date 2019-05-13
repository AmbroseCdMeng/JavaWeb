package com.cmower.database.entity;

import com.cmower.dal.DataEntity;

@SuppressWarnings("serial")
public class Users extends DataEntity<Users> { 
	private String username;
	private String password;
	private String headImg;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}
	
	
}
