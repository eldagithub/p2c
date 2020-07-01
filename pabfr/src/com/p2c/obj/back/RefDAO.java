package com.p2c.obj.back;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.p2c.obj.model.Objet;
import com.p2c.obj.model.Phase;
import com.p2c.obj.model.RefEtape;
import com.p2c.obj.model.RefPhase;
import com.p2c.obj.model.Process;
import com.p2c.obj.model.RefChamps;
import com.p2c.obj.model.RefProcess;
import com.p2c.obj.model.Tache;
import com.p2c.obj.model.RefTache;

public class RefDAO {

	@SessionTarget
	Session session;
	@TransactionTarget
	Transaction transaction;

	public RefProcess getRefProcess(Long id) {	
		RefProcess objet = new RefProcess();
		try {
			objet =(RefProcess) session.get(RefProcess.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return objet;
	}

	@SuppressWarnings("unchecked")
	public List<RefProcess> listRefProcess() {	
		List<RefProcess> courses = null;
		try {
			courses = session.createQuery(P2cSql.GET_ALLREFPROCESS).list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}


	public void saveRefProcess(RefProcess objet) {
		try {
			session.saveOrUpdate(objet);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}

	public void delRefProcess(Long id) {
		try {

			SQLQuery qry = session
					.createSQLQuery(P2cSql.DEL_REFTACHE_BYREFPROCESS)
					.addEntity(RefTache.class);
			qry.setParameter("idrefprocess", id).executeUpdate();


			qry = session.createSQLQuery(P2cSql.DEL_REFCHAMPS_BYREFPROCESS).addEntity(
					Phase.class);
			qry.setParameter("idrefprocess", id).executeUpdate();

			
			qry = session.createSQLQuery(P2cSql.DEL_REFPHASE_BYREFPROCESS).addEntity(
					Phase.class);
			qry.setParameter("idrefprocess", id).executeUpdate();

			
			qry = session.createSQLQuery(P2cSql.DEL_REFPROCESS_BYREFPROCESS).addEntity(
					Process.class);
			qry.setParameter("idrefprocess", id).executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
//PAHASE
	
	
	public RefPhase getRefPhase(Long id) {	
		RefPhase objet = new RefPhase();
		try {
			objet =(RefPhase) session.get(RefPhase.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return objet;
	}

	@SuppressWarnings("unchecked")
	public List<RefPhase> listRefPhase(Long idrefprocess) {	
		List<RefPhase> courses = null;
		try {
			courses = session.createQuery(P2cSql.GET_ALLREFPHASE).setParameter("idrefprocess", idrefprocess).list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}


	public void saveRefPhase(RefPhase objet) {
		try {
			session.saveOrUpdate(objet);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}

	public void delRefPhase(Long id) {
		try {

			SQLQuery qry = session
					.createSQLQuery(P2cSql.DEL_REFTACHE_BYREFPHASE)
					.addEntity(Tache.class);
			qry.setParameter("idrefphase", id).executeUpdate();


			qry = session.createSQLQuery(P2cSql.DEL_REFPHASE_BYREFPHASE).addEntity(
					Phase.class);
			qry.setParameter("idrefphase", id).executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}			
//  REFTACHE
	public RefTache getRefTache(Long idref) {	
		RefTache objet = new RefTache();
		try {
			objet =(RefTache) session.get(RefTache.class, idref);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return objet;
	}

	
	@SuppressWarnings("unchecked")
	public List<RefTache> listRefTache(Long idrefphase) {	
		List<RefTache> courses = null;
		try {
			courses = session.createQuery(P2cSql.GET_REFTACHE_BYREFPROCESS).setParameter("idrefphase", idrefphase).list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}
	
	
	public void delRefTache(Long id) {
		RefTache objet = new RefTache();
		try {
			objet =(RefTache) session.get(RefTache.class, id);
			session.delete(objet);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	public void saveRefTache(RefTache reftache) {
		try {
			session.save(reftache);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}		

//   REFCHAMPS
	public RefChamps getRefChamps(Long idrefchamps) {	
		RefChamps objet = new RefChamps();
		try {
			objet =(RefChamps) session.get(RefChamps.class, idrefchamps);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return objet;
	}

	
	@SuppressWarnings("unchecked")
	public List<RefChamps> listRefChamps(Long idrefprocess) {	
		List<RefChamps> courses = null;
		try {
			courses = session.createQuery(P2cSql.GET_REFCHAMPS_BYREFPROCESS).setParameter("idrefprocess", idrefprocess).list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}
	
	
	public void delRefChamps(Long id) {
		RefChamps objet = new RefChamps();
		try {
			objet =(RefChamps) session.get(RefChamps.class, id);
			session.delete(objet);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	public void saveRefChamps(RefChamps refchamps) {
		try {
			session.save(refchamps);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}
/*
	public void updateRefChamps(RefChamps refchamps) {
		try {
			RefChamps refchampstmp = new RefChamps();
			refchampstmp = (RefChamps) session.get(RefChamps.class, refchamps.getIdrefchamps());
			
			session.save(refchampstmp);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}
*/
	public Integer  getValue(String requete) {
		try {
			Object obj= session.createQuery(requete).uniqueResult();;
			if(obj == null) return 0;
			
			return  (Integer) obj;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} 
	}	
	
	public Long  getValueLong(String requete) {
		try {
			Object obj= session.createQuery(requete).uniqueResult();;
			if(obj == null) return (long) 0;
			
			return  (Long) obj;
			
		} catch (Exception e) {
			e.printStackTrace();
			return (long) 0;
		} 
	}	
	

	@SuppressWarnings("unchecked")
	public List<RefEtape> listRefEtape() {	
		List<RefEtape> courses = null;
		try {
			courses = session.createQuery(P2cSql.GET_ALLREFETAPES).list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}
	
	public RefEtape getRefEtape(int idref) {	
		RefEtape objet = new RefEtape();
		try {
			objet =(RefEtape) session.get(RefEtape.class, idref);
			//objet =  (RefEtape) session.createQuery(P2cSql.GET_REFETAPE_BYID).setParameter("idref",(long) idref);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return objet;
	}
	
	public RefEtape getRefEtapeByIdacte(int idacte) {	
		RefEtape objet = null;
		try {
			objet =  (RefEtape) session.createQuery(P2cSql.GET_REFETAPE_BYIDACTE).setParameter("idacte",idacte).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return objet;
	}
	
	@SuppressWarnings("unchecked")
	public List<RefEtape> getRefEtapeByIdacte2(int idacte) {	
		List<RefEtape> courses = null;
		try {
			courses = (List<RefEtape>) session.createQuery(P2cSql.GET_REFETAPE_BYIDACTE2).setParameter("idacte",idacte).list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}
	
	public void setActeFamille (String acte, int idacte){
		try {
			session.createQuery(P2cSql.UPDATE_ACTE_BYIDACTE).list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	public void delRefEtape(int id) {
		RefEtape objet = new RefEtape();
		try {
			objet =(RefEtape) session.get(RefEtape.class, id);
			session.delete(objet);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}


	@SuppressWarnings("unchecked")
	public List<Objet> listActes(String unitaire) {	
		List<Objet> courses = null;
		try {
			courses = session.createQuery(P2cSql.GET_ACTES).setString(0, unitaire).list();
			//courses = session.createQuery(P2cSql.GET_ACTES).list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}

	@SuppressWarnings("unchecked")
	public List<Objet> listActes() {	
		List<Objet> courses = null;
		try {
			courses = session.createQuery(P2cSql.GET_ACTES_ALL).list();
			//courses = session.createQuery(P2cSql.GET_ACTES).list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}

	public void saveRefEtape(RefEtape refetape) {
		try {
			session.save(refetape);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}

	
	
}
