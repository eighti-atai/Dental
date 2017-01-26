package com.atai.dental.module.enterp.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.atai.dental.generic.dao.AbstractDao;
import com.atai.dental.module.enterp.model.User;

@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {

	/* (non-Javadoc)
	 * @see com.atai.unter.module.enterprise.dao.UserDao#addUser(com.atai.unter.module.enterprise.model.User)
	 */
	public void addUser(User user) {
		persist(user);
	}


	/*public void updateUser(User user) {
		session.update(user);

	}*/

	
	/*public List<User> listUsers() {
		Session session = sessionFactory.getCurrentSession();
		List<User> users = session.createQuery("from User").list();
		return users;
	}*/


	/*public User getUserById(int userId) {
		Session session  = sessionFactory.getCurrentSession();
		User user = session.load(User.class, new Integer(userId));
		return user;
	}*/

	/*public User findByUsername(String username) {
		Session session  = sessionFactory.getCurrentSession();
		User user = session.load(User.class, username);
		return user;
	}*/
	
	/*public void removeUser(int userId) {
		User user = load(User.class, new Integer(userId));
		if (user != null)
		{
			delete(user);
		}
	}*/
	
	/* (non-Javadoc)
	 * @see com.atai.unter.module.enterprise.dao.UserDao#findByUserId(int)
	 */
	public User findByUserId(int userId) {
        return getByKey(userId);
    }
 
    /* (non-Javadoc)
	 * @see com.atai.unter.module.enterprise.dao.UserDao#findByUserName(java.lang.String)
	 */
    public User findByUserName(String userName) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("userName", userName));
        return (User) crit.uniqueResult();
    }

}
