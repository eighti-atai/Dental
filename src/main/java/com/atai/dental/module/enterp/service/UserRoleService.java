package com.atai.dental.module.enterp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.dental.generic.service.AbstractService;
import com.atai.dental.module.enterp.dao.UserRoleDao;
import com.atai.dental.module.enterp.model.UserRole;

@Service
public class UserRoleService extends AbstractService<Integer, UserRole>{

	@Autowired
	public UserRoleService(UserRoleDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}
	
}