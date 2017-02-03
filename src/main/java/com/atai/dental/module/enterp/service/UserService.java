package com.atai.dental.module.enterp.service;

import com.atai.dental.module.enterp.form.UserForm;
import com.atai.dental.module.enterp.model.User;

public interface UserService {

	void save(UserForm userform);

	User findByUsername(String username);
	
	User findByUserId(int userId);

}