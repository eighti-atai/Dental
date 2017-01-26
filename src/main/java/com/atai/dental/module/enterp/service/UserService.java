package com.atai.dental.module.enterp.service;

import com.atai.dental.module.enterp.model.User;

public interface UserService {

	void save(User user);

	User findByUsername(String username);

}