package com.atai.dental.module.enterp.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atai.dental.module.enterp.form.UserForm;
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
    public void save(UserForm userform) {
    	Set<Role> roles = new HashSet<Role>();
    	User user = new User();
    	int userRoleId = 1;
    	String role = userform.getUserRole();
    	/*if (roleName == "USER") {
    			userRoleId = 1;
    	}
    	else if (roleName == "ADMIN") {
			userRoleId = 3;
    	}
    	else if (roleName == "USER") {
			userRoleId = 3;
    	}*/
    	roles.add(roleDao.getRoleById(Integer.parseInt(userform.getUserRole())));
        user.setPassword(bCryptPasswordEncoder.encode(userform.getPassword()));
        user.setRoles(roles);
        user.setUsername(userform.getUserName());
        user.setName(userform.getName());
        userDao.addUser(user);
    }

    /* (non-Javadoc)
	 * @see com.atai.unter.module.enterprise.service.UserService#findByUsername(java.lang.String)
	 */
    @Transactional
    public User findByUsername(String username) {
        return userDao.findByUserName(username);
    }

    @Transactional(readOnly = true)
	public User findByUserId(int userId) {
		// TODO Auto-generated method stub
		return userDao.findByUserId(userId);
	}
}