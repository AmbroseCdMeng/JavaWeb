package com.cmower.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmower.database.entity.Users;
import com.cmower.database.mapper.UserMapper;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;
	
	public void insert(Users users) {
		users.preInsert();
		this.userMapper.insert(users);
	}
	
	public long update(Users param) {
		if (param.getId() == null) {
			throw new RuntimeException("数据 id 未赋值");
		}
		param.preUpdate();
		return this.userMapper.update(param);
	}
	
	public Users select(long userid) {
		return this.userMapper.select(userid);
	}
}
