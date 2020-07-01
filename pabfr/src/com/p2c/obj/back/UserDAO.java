package com.p2c.obj.back;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.p2c.obj.model.Objet;
import com.p2c.obj.model.User;
import com.p2c.obj.back.P2cSql;

public class UserDAO {

	@SessionTarget
	Session session;
	@TransactionTarget
	Transaction transaction;


	public User getUser(Long id) {	
		User user = new User();
		try {
			user =(User) session.get(User.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return user;
	}


	@SuppressWarnings("unchecked")
	public User getUser(String name) 
			throws Exception{
		List<User> users = null;

		try {
			Query qry  = session.createQuery(P2cSql.GET_USER_BYLOGIN);
			qry.setString(0, name);
			users = qry.list();  

			

			
		} catch (Exception e) {
			throw e;
		} 
        if (users.size() == 1) {
            return users.get(0);
        }

        return null;
    }

	@SuppressWarnings("unchecked")
	public User getUser(String name, String password) 
			throws Exception{
		List<User> users = null;

		try {
			Query qry  = session.createQuery(P2cSql.GET_USER);
			qry.setString(0, name);
			qry.setString(1, password);
			users = qry.list();  

			

			
		} catch (Exception e) {
			throw e;
		} 
        if (users.size() == 1) {
            return users.get(0);
        }

        return null;
    }

	@SuppressWarnings("unchecked")
	public List<User> listAll() {	
		List<User> courses = null;
		try {
			courses = session.createQuery(P2cSql.GET_ALLUSERS).list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}

	@SuppressWarnings("unchecked")
	public List<User> listObjet(String profile) {	
		List<User> courses = null;
		try {
			courses = session.createQuery(P2cSql.GET_ACTIVEUSERS_BYPROFILE).setString(0, profile).list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}

	@SuppressWarnings("unchecked")
	public List<User> listObjet2(String profile) {	
		List<User> courses = null;
		try {
			courses = session.createQuery("from User where active='yes' and ( profile = '" + profile +"' ) order by nom").list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}

	@SuppressWarnings("unchecked")
	public List<User> listByObjet(String profile) {	
		List<User> courses = null;
		try {
			courses = session.createQuery(P2cSql.GET_USERS_BYPROFILE).setString(0, profile).list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}

	public void addUser(User user) {
		try {
			session.saveOrUpdate(user);
			SQLQuery qry = session.createSQLQuery(P2cSql.INSERT_RATIOS_OBJET)
					.addEntity(Objet.class);
			qry.setParameter("idresponsable", user.getId())
					.executeUpdate();
 
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}
	
	public int getCount(String request) {
		return  ((Long)session.createQuery(request).uniqueResult()).intValue();
	}
	
	
	
}
