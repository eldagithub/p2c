package com.p2c.obj.back;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.p2c.obj.model.Etape;
import com.p2c.obj.model.Tache;

public class TacheDAO  {

	@SessionTarget
	Session session;
	@TransactionTarget
	Transaction transaction;

	public Tache getTache(Long id) {	
		Tache tache = new Tache();
		try {
			tache =(Tache) session.get(Tache.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return tache;
	}

	public Tache getTacheFull(Long id) {	
		Tache tache = new Tache();
		try {
			Query qry = session.createQuery(P2cSql.GET_TACHE_BYID)
					.setParameter("id", id); // .addEntity(Phase.class);
			tache = (Tache) (qry.list()).get(0);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return tache;
	}

	@SuppressWarnings("unchecked")
	public List<Tache> listTache(Long criteria, String ordBy ) {	
		List<Tache> courses = null;
		
		try {
			String req;
			if ( !ordBy.equals(""))  req=P2cSql.GET_TACHE_BYPHASE + " order by " +  ordBy + ", t.ordre ";
			else req=P2cSql.GET_TACHE_BYPHASE + " order by t.ordre ";
			
			Query qry = session.createQuery(req).setParameter("idphase", criteria); //.addEntity(Phase.class);
			courses = qry.list();

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}

	@SuppressWarnings("unchecked")
	public List<Tache> listReaderTache(Long criteria) {	
		List<Tache> courses = null;
		
		try {
			Query qry = session.createQuery(P2cSql.GET_TACHES_DENTAIRE_BYPROCESSID).setParameter("id", criteria); //.addEntity(Phase.class);
			courses = qry.list();

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}

	@SuppressWarnings("unchecked")
	public List<Tache> listTacheTdbByDate(String login, long refprocess, String lateToday) {	
		List<Tache> courses = null;
		try {
			Query qry;
			if (lateToday == "today")
				qry = session.createQuery(P2cSql.GET_TACHE_TODAY).setParameter("login", login).setParameter("refprocess", refprocess);
			else if (lateToday == "future")
				qry = session.createQuery(P2cSql.GET_TACHE_FUTURE).setParameter("login", login).setParameter("refprocess", refprocess);
			else
				qry = session.createQuery(P2cSql.GET_TACHE_LATE).setParameter("login", login).setParameter("refprocess", refprocess);
			
			
			courses = qry.list();

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}
	
	@SuppressWarnings("unchecked")
	public List<Tache> listTachesByDateLogin(String login, long refprocess, Date bornemin, Date bornemax) {	
		List<Tache> courses = null;
		try {
			Query qry;
			qry = session.createQuery(P2cSql.GET_TACHES_BETWEENDATES).setParameter("login", login).setParameter("refprocess", refprocess).setParameter("bornemin", bornemin).setParameter("bornemax", bornemax);			
			courses = qry.list();

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}
	
	@SuppressWarnings("unchecked")
	public List<Tache> listTacheByProcess(Long idprocess) {	
		List<Tache> courses = null;
		try {
			Query qry;
			qry = session.createQuery(P2cSql.GET_TACHES_BYPROCESS).setParameter("idprocess", idprocess);			
			courses = qry.list();

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}
	
	
	public void saveTache(Tache tache) {
		try {
			session.save(tache);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}

	public void saveOrUpdateTache(Tache tache) {
		try {
			session.saveOrUpdate(tache);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}

	public void delete(Long id) {

		Tache tache = new Tache();
		try {
			tache =(Tache) session.get(Tache.class, id);

			SQLQuery qry = session.createSQLQuery(P2cSql.DEL_ETAPE_BYTACHE)
					.addEntity(Etape.class);
			qry.setParameter("idtache", tache.getId())
					.executeUpdate();

			session.delete(tache);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	public void delete2(int i, Long idphase, int j) {
		try {
			SQLQuery qry = session.createSQLQuery(P2cSql.DEL_TACHES_BYPHASEACTEDENT)
					.addEntity(Tache.class);
			qry.setParameter("idacte", i)
					.setParameter("idphase", idphase)
					.setParameter("dent", j)
					.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	
}
