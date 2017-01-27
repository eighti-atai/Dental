package com.atai.dental.module.enterp.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.atai.dental.module.enterp.model.Role;
import com.atai.dental.module.enterp.model.User;

@Repository
public class RoleDaoImpl implements RoleDao {
	
private SessionFactory sessionFactory;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	public void addRole(Role role) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(role);
	}

	public void updateRole(Role role) {
		Session session = sessionFactory.getCurrentSession();
		session.update(role);

	}

	
	public List<Role> listRoles() {
		Session session = sessionFactory.getCurrentSession();
		List<Role> roles = session.createQuery("from Role").list();
		return roles;
	}


	public Role getRoleById(int roleId) {
		Session session  = sessionFactory.getCurrentSession();
		Role role = session.load(Role.class, new Integer(roleId));
		return role;
	}

	public void removeRole(int roleId) {
		Session session = sessionFactory.getCurrentSession();
		Role role = session.load(Role.class, new Integer(roleId));
		if (role != null)
		{
			session.delete(role);
		}
	}

}
