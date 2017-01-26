package com.atai.dental.module.enterp.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atai.dental.module.enterp.dao.RoleDao;
import com.atai.dental.module.enterp.dao.UserDao;
import com.atai.dental.module.enterp.model.Role;
import com.atai.dental.module.enterp.model.User;
import com.atai.dental.module.enterp.model.UserRoleTypes;

import java.util.HashSet;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    
    @Autowired
    private UserDao userDao;
    @Autowired
    private RoleDao roleDao;

    /* (non-Javadoc)
	 * @see com.atai.unter.module.enterprise.service.UserService#save(com.atai.unter.module.enterprise.model.User)
	 */
    @Transactional
    public void save(User user) {
    	Set<Role> roles = new HashSet<Role>();
    	roles.add(roleDao.getRoleById(1));
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roles);
        userDao.addUser(user);
    }

    /* (non-Javadoc)
	 * @see com.atai.unter.module.enterprise.service.UserService#findByUsername(java.lang.String)
	 */
    @Transactional
    public User findByUsername(String username) {
        return userDao.findByUserName(username);
    }
}