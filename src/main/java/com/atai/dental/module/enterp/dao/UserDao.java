package com.atai.dental.module.enterp.dao;

import com.atai.dental.module.enterp.model.User;

public interface UserDao {

	void addUser(User user);

	User findByUserId(int userId);

	User findByUserName(String userName);

}