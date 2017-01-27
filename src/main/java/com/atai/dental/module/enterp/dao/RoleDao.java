package com.atai.dental.module.enterp.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import com.atai.dental.module.enterp.model.Role;

public interface RoleDao {

	/* (non-Javadoc)
	 * @see com.atai.unter.module.enterprise.dao.UserDao#setSessionFactory(org.hibernate.SessionFactory)
	 */
	/* (non-Javadoc)
	 * @see com.atai.unter.module.enterprise.dao.UserDao#setSessionFactory(org.hibernate.SessionFactory)
	 */
	void setSessionFactory(SessionFactory sessionFactory);

	/* (non-Javadoc)
	 * @see com.atai.unter.module.enterprise.dao.UserDao#addAddress(com.atai.unter.module.enterprise.model.Address)
	 */
	/* (non-Javadoc)
	 * @see com.atai.unter.module.enterprise.dao.UserDao#addUser(com.atai.unter.module.enterprise.model.User)
	 */
	void addRole(Role role);

	/* (non-Javadoc)
	 * @see com.atai.unter.module.enterprise.dao.UserDao#updateAddress(com.atai.unter.module.enterprise.model.Address)
	 */
	/* (non-Javadoc)
	 * @see com.atai.unter.module.enterprise.dao.UserDao#updateUser(com.atai.unter.module.enterprise.model.User)
	 */
	void updateRole(Role role);

	/* (non-Javadoc)
	 * @see com.atai.unter.module.enterprise.dao.UserDao#listUsers()
	 */
	/* (non-Javadoc)
	 * @see com.atai.unter.module.enterprise.dao.UserDao#listUsers()
	 */
	List<Role> listRoles();

	/* (non-Javadoc)
	 * @see com.atai.unter.module.enterprise.dao.UserDao#getAddressById(int)
	 */
	/* (non-Javadoc)
	 * @see com.atai.unter.module.enterprise.dao.UserDao#getAddressById(int)
	 */
	Role getRoleById(int roleId);

	/*public Role findByUsername(String username) {
		Session session  = sessionFactory.getCurrentSession();
		User user = session.load(User.class, username);
		return user;
	}*/
	/* (non-Javadoc)
	 * @see com.atai.unter.module.enterprise.dao.UserDao#removeAddress(int)
	 */
	/* (non-Javadoc)
	 * @see com.atai.unter.module.enterprise.dao.UserDao#removeAddress(int)
	 */
	void removeRole(int roleId);

}