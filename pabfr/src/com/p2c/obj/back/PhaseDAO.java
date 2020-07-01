package com.p2c.obj.back;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.p2c.obj.model.Phase;

public class PhaseDAO  {

	@SessionTarget
	Session session;
	@TransactionTarget
	Transaction transaction;

	public Phase getPhase(Long id) {	
		Phase phase = new Phase();
		try {
			phase =(Phase) session.get(Phase.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return phase;
	}

	@SuppressWarnings("unchecked")
	public List<Phase> listPhaseAll(Long idprocess) {	
		List<Phase> courses = null;
		try {
			courses = session.createQuery(P2cSql.GET_PHASE_BYPROCESSALL).setParameter("idprocess", idprocess).list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}
	@SuppressWarnings("unchecked")
	public List<Phase> listPhase(Long idprocess) {	
		List<Phase> courses = null;
		try {
			courses = session.createQuery(P2cSql.GET_PHASE_BYPROCESS).setParameter("idprocess", idprocess).list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}
	
	
	public void savePhase(Phase phase) {
		try {
			session.save(phase);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}

}
