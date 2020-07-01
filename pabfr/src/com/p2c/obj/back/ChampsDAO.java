package com.p2c.obj.back;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.p2c.obj.model.Champs;

public class ChampsDAO  {

	@SessionTarget
	Session session;
	@TransactionTarget
	Transaction transaction;

	public Champs getChamps(Long id) {	
		Champs champs = new Champs();
		try {
			champs =(Champs) session.get(Champs.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return champs;
	}

	@SuppressWarnings("unchecked")
	public List<Champs> listChampsAll(Long idprocess) {	
		List<Champs> courses = null;
		try {
			courses = session.createQuery(P2cSql.GET_CHAMPS_BYPROCESSALL).setParameter("idprocess", idprocess).list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}
	@SuppressWarnings("unchecked")
	public List<Champs> listChamps(Long idprocess) {	
		List<Champs> courses = null;
		try {
			courses = session.createQuery(P2cSql.GET_CHAMPS_BYPROCESS).setParameter("idprocess", idprocess).list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}
	
	
	public void updateChamps(Champs champs) {
		try {
			Champs champstmp = new Champs();
			champstmp = (Champs) session.get(Champs.class, champs.getId());
			
			champstmp.setValue(champs.getValue());

			session.save(champstmp);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}
	public void saveChamps(Champs champs) {
		try {
			if (champs.getActive() == null) champs.setActive("yes");
			session.save(champs);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}

}
