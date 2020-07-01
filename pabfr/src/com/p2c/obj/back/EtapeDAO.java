package com.p2c.obj.back;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.p2c.obj.model.Etape;
import com.p2c.obj.model.Objet;

public class EtapeDAO  {

	@SessionTarget
	Session session;
	@TransactionTarget
	Transaction transaction;


	public Etape getEtape(Long id) {	
		Etape etape = new Etape();
		try {
			etape =(Etape) session.get(Etape.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return etape;
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
	public List<Etape> listEtape(Long criteria) {	
		List<Etape> courses = null;
		
		try {
			Query qry = session.createQuery(P2cSql.GET_ETAPE_BYPHASE).setParameter("idphase", criteria); //.addEntity(Phase.class);
			courses = qry.list();

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}
	
	@SuppressWarnings("unchecked")
	public List<Etape> listEtapeByTache(Long criteria) {	
		List<Etape> courses = null;
		
		try {
			Query qry = session.createQuery(P2cSql.GET_ETAPE_BY_TACHE).setParameter("idtache", criteria); //.addEntity(Phase.class);
			courses = qry.list();

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}
	
	@SuppressWarnings("unchecked")
	public List<Etape> listEtapesByTache(Long criteria) {	
		List<Etape> courses = null;
		
		try {
			Query qry = session.createQuery(P2cSql.GET_ETAPES_BY_TACHE).setParameter("idtache", criteria); //.addEntity(Phase.class);
			courses = qry.list();

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}

	@SuppressWarnings("unchecked")
	public List<Etape> listDentsByTache(Long criteria) {	
		List<Etape> courses = null;
		
		try {
			Query qry = session.createQuery(P2cSql.GET_DENTS_BY_TACHE).setParameter("idtache", criteria); //.addEntity(Phase.class);
			courses = qry.list();

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}
	
	public int getSum(String request) {
		return  ((Long)session.createQuery(request).uniqueResult()).intValue();
	}

	@SuppressWarnings("rawtypes")
	public Long getSum2(String request) {
		Query query = session.createQuery(request);
		if (query == null){ 
			return (long)0;
		}else{
			List listResult = query.list();
			Number number = (Number) listResult.get(0);
			return (long) number.intValue();
		}
	}

	public String getSum3(String request) {
		String result = "0";
		try {
			result = (String)session.createQuery(request).uniqueResult();
			if(result == null){
				result = "0";
			}
		 }
		 catch (  Exception e) {
		    e.printStackTrace();
		  }
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Etape> listEtapeActeDent(Long criteria) {	
		List<Etape> courses = null;
		
		try {
			Query qry = session.createQuery(P2cSql.GET_ACTE_BYPHASE).setParameter("idphase", criteria); //.addEntity(Phase.class);
			courses = qry.list();

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}

	@SuppressWarnings("unchecked")
	public List<Etape> listEtapeActeDentTache(Long criteria) {	
		List<Etape> courses = null;
		
		try {
			Query qry = session.createQuery(P2cSql.GET_ACTEDENTTACHE_BYPHASE).setParameter("idphase", criteria); //.addEntity(Phase.class);
			courses = qry.list();

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}
	
	@SuppressWarnings("unchecked")
	public List<Etape> listFamille(Long criteria) {	
		List<Etape> courses = null;
		
		try {
			Query qry = session.createQuery(P2cSql.GET_FAMILLE_BYPHASE).setParameter("idphase", criteria); //.addEntity(Phase.class);
			courses = qry.list();

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}

	public void updateOrdrefamille(Etape etape) {
		try {
			Query qry = session.createSQLQuery(P2cSql
					 .UPDATE_ORDREFAMILLE_BYPHASE).addEntity(Etape.class);
			qry.setParameter("idphase", etape.getIdphase())
			.setParameter("idfamille", etape.getIdfamille())
			.setParameter("ordrefamille", etape.getOrdrefamille())
			.executeUpdate();

		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}		
	public void addActeDent(Etape etape) {
		try {

			SQLQuery qry = session.createSQLQuery(P2cSql.INSERT_PHASE_ETAPES)
					.addEntity(Etape.class);
			qry.setParameter("dent", etape.getDent())
					.setParameter("idacte", etape.getIdacte())
					.setParameter("idphase", etape.getIdphase())
					.executeUpdate();
 
			
			// this.updateProcessPhaseEncours(process.getId());

		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}	

	public void addActeDent2(Etape etape) {
		try {

			SQLQuery qry = session.createSQLQuery(P2cSql.INSERT_PHASE_ETAPES_TACHE)
					.addEntity(Etape.class);
			qry.setParameter("dent", etape.getDent())
					.setParameter("idacte", etape.getIdacte())
					.setParameter("idphase", etape.getIdphase())
					.setParameter("idtache", etape.getIdtache())
					.executeUpdate();
 
			//System.out.println(qry.getQueryString()+"qry");
			// this.updateProcessPhaseEncours(process.getId());

		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}	

	public void addActeDent3(Etape etape) {
		try {

			SQLQuery qry = session.createSQLQuery(P2cSql.INSERT_PHASE_ETAPES_TACHE_BYIDREF)
					.addEntity(Etape.class);
			qry.setParameter("dent", etape.getDent())
					.setParameter("idacte", etape.getIdacte())
					.setParameter("idphase", etape.getIdphase())
					.setParameter("idtache", etape.getIdtache())
					.setParameter("idref", etape.getIdref())
					.executeUpdate();
 
			//System.out.println(qry.getQueryString()+"qry");
			// this.updateProcessPhaseEncours(process.getId());

		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}	

	public void delActeDent(Etape etape) {
		try {

			SQLQuery qry = session.createSQLQuery(P2cSql.DEL_ETAPE_BYPHASEACTEDENT)
					.addEntity(Etape.class);
			qry.setParameter("dent", etape.getDent())
					.setParameter("idacte", etape.getIdacte())
					.setParameter("idphase", etape.getIdphase())
					.executeUpdate();
 
			
			// this.updateProcessPhaseEncours(process.getId());

		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}	

	public void deleteEtape(Long id) {
		try {

			SQLQuery qry = session.createSQLQuery(P2cSql.DEL_ETAPE_BYID)
					.addEntity(Etape.class);
			qry.setParameter("id", id)
					.executeUpdate();
 
			
			// this.updateProcessPhaseEncours(process.getId());

		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}	

	public void setSeanceActe(Etape etape) {
		try {
			Query qry = session.createSQLQuery(P2cSql
					 .UPDATE_TACHEACTE_BYPHASE).addEntity(Etape.class);
			qry.setParameter("idphase", etape.getIdphase())
			.setParameter("idacte", etape.getIdacte())
			.setParameter("idtache", etape.getIdtache())
			.setParameter("dent", etape.getDent())
			.executeUpdate();

		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}		
	
	public void taskGroup(Long idtache, Long idtachelast) {
		try {
			Query qry = session.createSQLQuery(P2cSql
					 .UPDATE_TACHE_BYIDTACHE).addEntity(Etape.class);
			qry.setParameter("idtachelast", idtachelast)
			.setParameter("idtache", idtache)
			.executeUpdate();

		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}		
	
	@SuppressWarnings("unchecked")
	public List<Etape> getEtapeDureeMax(Long idtache) {
		Query qry;
		List<Etape> courses = null;
		try {
			qry = session.createQuery(P2cSql.GET_TACHE_DUREE_MAX);
			qry.setParameter("idtache", idtache);

			courses = qry.list();

		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
		return courses;
	}
	
	@SuppressWarnings("unchecked")
	public List<Etape> taskGroupdiffActememeDent(Long idtacheRef, int idacteRef, int dentRef) {
		// Cette fonction retourne la liste des étapes des traitements
		// dont l'acte est différent de 'idacteRef' et la dent est égale à 'dentRef'
		// rattachées aux taches présentes dans la liste 'idtacheRef'
		Query qry;
		List<Etape> courses = null;
		try {
			qry = session.createQuery(P2cSql
					 .GET_ETAPES_diffACTE_memeDENT);
			qry.setParameter("idacte",idacteRef)
			.setParameter("idtache", idtacheRef)
			.setParameter("dent", dentRef).list();
			courses = qry.list();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
		return courses;
	}
	
	@SuppressWarnings("unchecked")
	public List<Etape> taskGroupmemeActediffDent(Long idtacheRef, int idacteRef, int dentRef) {
		// Cette fonction retourne la liste des étapes des traitements
		// dont l'acte est le même 'idacteRef' et la dent différent 'dentRef'
		// rattachées aux taches présentes dans la liste 'idtacheRef'
		Query qry;
		List<Etape> courses = null;
		try {
			qry = session.createQuery(P2cSql
					 .GET_ETAPES_memeACTE_diffDENT);
			qry.setParameter("idacte",idacteRef)
			.setParameter("idtache", idtacheRef)
			.setParameter("dent", dentRef).list();
			courses = qry.list();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
		return courses;
	}
	
	@SuppressWarnings("unchecked")
	public List<Etape> taskGroupmemeSecteurdiffActeDent(Long idtacheRef, int idacteRef, int dentRef) {
		// Cette fonction retourne la liste des étapes des traitements
		// dont l'acte est le même 'idacteRef' et la dent différent 'dentRef'
		// rattachées aux taches présentes dans la liste 'idtacheRef'
		Query qry;
		List<Etape> courses = null;
		int secteur_inf = 0;
		int secteur_sup = 0;
		if (dentRef >= 11 && dentRef <=18){  secteur_inf = 11 ; secteur_sup = 18;}
		if (dentRef >= 21 && dentRef <=28){  secteur_inf = 21 ; secteur_sup = 28;}
		if (dentRef >= 31 && dentRef <=38){  secteur_inf = 31 ; secteur_sup = 38;}
		if (dentRef >= 41 && dentRef <=48){  secteur_inf = 41 ; secteur_sup = 48;}
		try {
			qry = session.createQuery(P2cSql
					 .GET_ETAPES_memeSECTEUR_diffACTE_diffDENT);
			qry.setParameter("idacte",idacteRef)
			.setParameter("idtache", idtacheRef)
			.setParameter("secteur_inf", secteur_inf)
			.setParameter("secteur_sup", secteur_sup)
			.setParameter("dent", dentRef).list();
			courses = qry.list();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
		return courses;
	}
	
	@SuppressWarnings("unchecked")
	public List<Etape> taskGroupdiffSecteur(Long idtacheRef, int idacteRef, int dentRef) {
		// Cette fonction retourne la liste des étapes des traitements
		// dont le secteur est différent 'dentRef'
		// rattachées aux taches présentes dans la liste 'idtacheRef'
		Query qry;
		List<Etape> courses = null;
		int secteur_inf = 0;
		int secteur_sup = 0;
		if (dentRef >= 11 && dentRef <=18){  secteur_inf = 11 ; secteur_sup = 18;}
		if (dentRef >= 21 && dentRef <=28){  secteur_inf = 21 ; secteur_sup = 28;}
		if (dentRef >= 31 && dentRef <=38){  secteur_inf = 31 ; secteur_sup = 38;}
		if (dentRef >= 41 && dentRef <=48){  secteur_inf = 41 ; secteur_sup = 48;}
		try {
			qry = session.createQuery(P2cSql
					 .GET_ETAPES_diffSECTEUR);
			qry.setParameter("idtache", idtacheRef)
			.setParameter("secteur_inf", secteur_inf)
			.setParameter("secteur_sup", secteur_sup).list();
			courses = qry.list();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
		return courses;
	}

	public void saveEtape(Etape etape) {
		try {
			session.save(etape);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}

	public void delete(Long id) {

		Etape etape = new Etape();
		try {
			etape =(Etape) session.get(Etape.class, id);

			session.delete(etape);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public int getCount(String request) {
		return  ((Long)session.createQuery(request).uniqueResult()).intValue();
	}
	
	public int getKPIPraticien(String request) {
		return  (int) Long.parseLong((String) session.createQuery(request).uniqueResult());
	}
	
	
}
