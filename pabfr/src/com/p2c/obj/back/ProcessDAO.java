package com.p2c.obj.back;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.p2c.obj.model.Process;
import com.p2c.obj.model.RefProcess;
import com.p2c.obj.model.Phase;
import com.p2c.obj.model.Tache;

public class ProcessDAO {

	@SessionTarget
	Session session;
	@TransactionTarget
	Transaction transaction;

	public Process getProcess(Long id) {
		Process process = new Process();
		try {
			// process =(Process) session.get(Process.class, id);
			Query qry = session.createQuery(P2cSql.GET_PROCESS_BYID)
					.setParameter("id", id); // .addEntity(Phase.class);
			process = (Process) (qry.list()).get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return process;
	}

	public List<Process> listProcess() {
		return listProcess("",0);
	}

	@SuppressWarnings("unchecked")
	public List<Process> listProcess(String Criteria, int refprocess) {
		List<Process> courses = null;
		try {
			Query qry;
			if (Criteria == "") {
				qry = session.createQuery(P2cSql.GET_PROCESSS);
			} else {
				qry = session.createQuery(P2cSql.GET_PROCESSS_BYLOGIN)
						.setParameter("login", Criteria)
						.setParameter("refprocess", (long)refprocess); // .addEntity(Phase.class);
			}
			courses = qry.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}

	@SuppressWarnings("unchecked")
	public List<Process> listProcessReader(String Criteria, long l) {
		List<Process> courses = null;
		try {
			Query qry;
			if (Criteria == "") {
				qry = session.createQuery(P2cSql.GET_PROCESSS);
			} else {
				qry = session.createQuery(P2cSql.GET_PROCESSSREADER_BYLOGIN)
						.setParameter("login", Criteria)
						.setParameter("refprocess", (long)l); // .addEntity(Phase.class);
			}
			courses = qry.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}

	@SuppressWarnings("unchecked")
	public List<RefProcess> listRefProcess() {
		List<RefProcess> courses = null;
		try {
			courses = session.createQuery(P2cSql.GET_REFPROCESS).list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}
	
	
	public void saveProcess(Process process) {
		try {
			session.update(process);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}

	public void createProcess(Process process) {
		try {

			process.setDstart(new Date(System.currentTimeMillis()));

			session.save(process);

			SQLQuery qry = session.createSQLQuery(P2cSql.INSERT_PROCESS_PHASES)
					.addEntity(Phase.class);
			qry.setParameter("idprocess", process.getId())
					.setParameter("idrefprocess", process.getIdref())
					.executeUpdate();
 
			qry = session.createSQLQuery(P2cSql.INSERT_PROCESS_CHAMPS)
					.addEntity(Phase.class);
			qry.setParameter("idprocess", process.getId())
					.setParameter("idrefprocess", process.getIdref())
					.executeUpdate();

			qry = session.createSQLQuery(P2cSql.INSERT_PROCESS_TACHES)
					.addEntity(Tache.class);
			qry.setParameter("idprocess", process.getId()).executeUpdate();

			// this.updateProcessPhaseEncours(process.getId());

		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}

	public void updateProcessPhaseEncours(Long idprocess) {
		try {

			Phase phase;
			@SuppressWarnings("rawtypes")
			List lres_inprogress;
			@SuppressWarnings("rawtypes")
			List lres_inprogress_init;
			@SuppressWarnings("rawtypes")
			List lres_tobestarted;

			String phase_encours = "";

			Query qry = session.createQuery(P2cSql.GET_PHASEENCOURS)
					.setParameter("idprocess", idprocess)
					.setString("status", "in_progress");
			lres_inprogress = qry.list();

			qry = session.createQuery(P2cSql.GET_PHASEENCOURS)
					.setParameter("idprocess", idprocess)
					.setString("status", "in_progress_init");
			lres_inprogress_init = qry.list();

			qry = session.createQuery(P2cSql.GET_PHASEENCOURS)
					.setParameter("idprocess", idprocess)
					.setString("status", "to_be_started");
			lres_tobestarted = qry.list();

			// CAS 1 : tout a to_be_started --> mettre a in_progress_init
			// (in_progress not started)
			if (lres_inprogress.size() == 0 && lres_inprogress_init.size() == 0) {
				if (lres_tobestarted.size() > 0) {
					phase = (Phase) lres_tobestarted.get(0);
					phase.setStatus("in_progress_init");
					session.save(phase);
					phase_encours = phase.getNom();
					

				}

			} 

			// CAS 2 : une a in_progress_init (process non demarre), mettre
			// in_progress_init a la plus petite to_be_started
			// 2.1 : id > id(in_progress_init) --> id:to_be_started
			else if (lres_inprogress_init.size() > 0) {
				phase = (Phase) lres_inprogress_init.get(0);

				if (lres_tobestarted.size() > 0) {
					Phase phase_tobestarted = (Phase) lres_tobestarted.get(0);
					if (phase_tobestarted.getOrdre() < phase.getOrdre()) {
						phase_tobestarted.setStatus("in_progress_init");
						session.save(phase_tobestarted);
						phase_encours = phase_tobestarted.getNom();

						phase.setStatus("to_be_started");
						session.save(phase);
					}

					//phase.setStatus("in_progress_init");
					//session.save(phase);
					//phase_encours = phase.getNom();

				}

			}

			/*
			 * // 2.2 : id < id(in_progress_init) -->
			 * id(in_progress_init):to_be_started & id:in_progress_init
			 * 
			 * 
			 * 
			 * // CAS 3 : une a in_progress (process deja demarre, au moins une
			 * tache different de to_be_started) // 2.1 : id > id(in_progress)
			 * --> id:to_be_started if (lres_inprogress.size() > 0) { phase =
			 * (Phase)lres_inprogress.get(0);
			 * 
			 * if (lres_tobestarted.size()>0) { Phase phase_tobestarted =
			 * (Phase)lres_tobestarted.get(0); if
			 * (phase_tobestarted.getOrdre()<phase.getOrdre()){
			 * phase_tobestarted.setStatus("in_progress_init");
			 * session.save(phase);
			 * 
			 * phase.setStatus("to_be_started"); session.save(phase); }
			 * 
			 * phase.setStatus("in_progress_init"); session.save(phase);
			 * 
			 * }
			 * 
			 * }
			 * 
			 * 
			 * // 2.2 : id < id(in_progress) --> pas possible la tache est deja
			 * demarre
			 * 
			 * 
			 * if (lres.size() == 0 ) { Query qry2 =
			 * session.createQuery(P2cSql.GET_PHASEENCOURS
			 * ).setParameter("idprocess", idprocess).setString("status",
			 * "to_be_started"); //.addEntity(Phase.class); lres = qry2.list();
			 * }
			 * 
			 * if (lres.size()>0 ) { SQLQuery sqry =
			 * session.createSQLQuery(P2cSql
			 * .UPDATE_PHASE_NOTVISIBLE).addEntity(Process.class);
			 * sqry.setParameter("idprocess", idprocess).executeUpdate();
			 * 
			 * phase = (Phase)lres.get(0); phase.setStatus("in_progress_init");
			 * session.save(phase);
			 */
			if (phase_encours != "") {
				//set invisible in_progress_init à to_be_started
				qry = session.createSQLQuery(P2cSql
						 .UPDATE_PHASE_NOTVISIBLE).addEntity(Process.class);
				qry.setParameter("idprocess", idprocess).executeUpdate();
				
				qry = session.createSQLQuery(P2cSql.UPDATE_PROCESS_PHASEENCOURS)
						.addEntity(Process.class);
				qry.setParameter("idprocess", idprocess)
						.setParameter("phaseencours", phase_encours)
						.executeUpdate();

			}

		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}

	public void deleteProcess(Long id) {

		try {

			SQLQuery qry = session
					.createSQLQuery(P2cSql.DEL_TACHE_BYPROCESS)
					.addEntity(Tache.class);
			qry.setParameter("idprocess", id).executeUpdate();


			qry = session.createSQLQuery(P2cSql.DEL_ETAPE_BYPROCESS).addEntity(
					Phase.class);
			qry.setParameter("idprocess", id).executeUpdate();

			qry = session.createSQLQuery(P2cSql.DEL_CHAMPS_BYPROCESS).addEntity(
					Phase.class);
			qry.setParameter("idprocess", id).executeUpdate();

			
			qry = session.createSQLQuery(P2cSql.DEL_PHASE_BYPROCESS).addEntity(
					Phase.class);
			qry.setParameter("idprocess", id).executeUpdate();

			
			qry = session.createSQLQuery(P2cSql.DEL_PROCESS_BYPROCESS).addEntity(
					Process.class);
			qry.setParameter("idprocess", id).executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getChamp(String request) {
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
	public List<Process> listDevisZero(String Criteria, int refprocess) {
		List<Process> courses = null;
		try {
			Query qry;
				qry = session.createQuery(P2cSql.GET_PROCESSS_BYLOGIN_DEVISZERO)
						.setParameter("login", Criteria)
						.setParameter("refprocess", (long)refprocess); // .addEntity(Phase.class);
			courses = qry.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}
	
	@SuppressWarnings("unchecked")
	public List<Process> listDevisNonSigne(String Criteria, int refprocess) {
		List<Process> courses = null;
		try {
			Query qry;
				qry = session.createQuery(P2cSql.GET_PROCESSS_BYLOGIN_DEVISNONSIGNE)
						.setParameter("login", Criteria)
						.setParameter("refprocess", (long)refprocess); // .addEntity(Phase.class);
			courses = qry.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}
	
	public Long getCount(String request) {
			return ((Long)session.createQuery(request).uniqueResult());
	}
	
	
}
