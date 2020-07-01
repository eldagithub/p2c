package com.p2c.obj.back;

//import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.p2c.obj.model.Gedo;

public class GedDAO {

	@SessionTarget
	Session session;
	@TransactionTarget
	Transaction transaction;

	public Gedo getGed(Long id) {	
		Gedo ged = new Gedo();
		try {
			ged =(Gedo) session.get(Gedo.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return ged;
	}


	public void saveGed(Gedo ged) {
		try {
			session.saveOrUpdate(ged);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}
	
	
}
