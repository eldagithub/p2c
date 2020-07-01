package com.p2c.obj.back;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.p2c.obj.model.Objet;
import com.p2c.obj.model.Process;

public class ObjetDAO {

	@SessionTarget
	Session session;
	@TransactionTarget
	Transaction transaction;

	public Objet getObjet(Long id) {	
		Objet objet = new Objet();
		try {
			objet =(Objet) session.get(Objet.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return objet;
	}
	
	public Objet getObjetByIdresponsable(Long id) {	
		Objet objet = new Objet();
		try {
			objet = (Objet) session.createQuery(P2cSql.GET_OBJET_BYIDRESPONSABLE).setParameter("idresponsable", id.intValue()).list().get(0);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return objet;
	}

	public void delObjetTemp(String categorie, Long id) {
		try {
			Query qry;
			qry = session.createSQLQuery(P2cSql.DEL_OBJET_TEMP)
					.addEntity(Objet.class);
			qry.setParameter("categorie", categorie).setParameter("id", id)
					.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public void activateObjet(String categorie, Long id) {
		try {
			Query qry;
			qry = session.createSQLQuery(P2cSql.ACTIVATE_OBJET_TEMP)
					.addEntity(Objet.class);
			qry.setParameter("categorie", categorie).setParameter("id", id)
					.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	@SuppressWarnings("unchecked")
	public List<Objet> listObjet(String categorie) {	
		List<Objet> courses = null;
		try {
			courses = session.createQuery(P2cSql.GET_OBJBYCATEGORY).setString(0, categorie).list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}

	@SuppressWarnings("unchecked")
	public List<Process> listProcessByObjet(Long idref) {	
		List<Process> courses = null;
		try {
			courses = session.createQuery(P2cSql.GET_PROCESSS_BYOBJET)
					.setParameter("idref", (long)idref).list(); // .addEntity(Phase.class);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}


	public void saveObjet(Objet objet) {
		try {
			session.saveOrUpdate(objet);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}

	public void delObjet(Long id) {
		Objet objet = new Objet();
		try {
			objet =(Objet) session.get(Objet.class, id);
			session.delete(objet);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}


	@SuppressWarnings("unchecked")
	public List<Objet> listRatios(String categorie, String login) {	
		List<Objet> courses = null;
		try {
			courses = session.createQuery(P2cSql.GET_RATIOS).setString(0, categorie).setString(1, login).list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}
	
	public void update_ratio(String description, Long idref){
		try {
			Query qry;
			qry = session.createSQLQuery(P2cSql.UPDATE_OBJET_RATIO)
					.addEntity(Objet.class);
			qry.setParameter("description", description).setParameter("idref", idref)
					.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	
}
