package com.p2c.obj.back;

import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.p2c.obj.model.Log;
import com.p2c.obj.model.Process;
import com.p2c.obj.model.Todo;
import com.p2c.obj.model.Gedo;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class P2cDAO {

	/**
	 * 
	 */
	@SessionTarget
	Session session;
	@TransactionTarget
	Transaction transaction;

	public P2cDAO() {
	}


	/* *****************************
	
	Module Log 
	
	******************************* */
	
	@SuppressWarnings("unchecked")
	public List<Log> listLog() {	
		List<Log> logs = null;
		try {
			Query qry  = session.createQuery(P2cSql.GET_LOGS);
			logs = qry.list();  
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return logs;
	}

	@SuppressWarnings("unchecked")
	public List<Log> listLog(Log logfiltre, int maxrows, String login, int refprocess) {	
		List<Log> logs = null;
		try {
			Query qry;
			if (logfiltre.getIdobj() == null || logfiltre.getIdobj() == 0) {
				qry  = session.createQuery(P2cSql.GET_LOGS_BYCLASSE_LOGIN);
				qry.setString(0, logfiltre.getClasse());
				qry.setString(1, login);
				qry.setParameter(2, (long)refprocess);
				if (maxrows == 0) maxrows=100;
			}
			else {

				if (logfiltre.getIdobj() > 0) qry  = session.createQuery(P2cSql.GET_LOGS_BYPROCESS);
				else { qry  = session.createQuery(P2cSql.GET_LOGS_BYDATE);qry.setParameter(2, login);}
				

				qry.setString(0, logfiltre.getClasse());
				qry.setParameter(1, logfiltre.getIdobj());
				

			}
			
			if (maxrows != 0) qry.setMaxResults(maxrows);
			
			//qry.setInteger(1, logfiltre.getIdobj());
			logs = qry.list();  
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return logs;

	}


	@SuppressWarnings("unchecked")
	public List<Log> listReaderLog(Log logfiltre, int maxrows, String login, int refprocess) {	
		List<Log> logs = null;
		try {
			Query qry;
			if (logfiltre.getIdobj() == null || logfiltre.getIdobj() == 0) {
				qry  = session.createQuery(P2cSql.GET_LOGSREADER_BYCLASSE_LOGIN);
				qry.setString(0, logfiltre.getClasse());
				qry.setString(1, login);
				qry.setParameter(2, (long)refprocess);
				qry.setString(3, login);
				if (maxrows == 0) maxrows=100;
			}
			else {

				if (logfiltre.getIdobj() > 0) qry  = session.createQuery(P2cSql.GET_LOGS_BYPROCESS);
				else { qry  = session.createQuery(P2cSql.GET_LOGS_BYDATE);qry.setParameter(2, login);}
				

				qry.setString(0, logfiltre.getClasse());
				qry.setParameter(1, logfiltre.getIdobj());
				

			}
			
			if (maxrows != 0) qry.setMaxResults(maxrows);
			
			//qry.setInteger(1, logfiltre.getIdobj());
			logs = qry.list();  
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return logs;

	}

	public void addLog(Log log){
		try {
			session.save(log);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 

	}

	public void addLog(Process processTmp,  String what){
		try {

			String nomPrj = "<a class='libelle_programme'>" + processTmp.getProgramme() + "</a> | <a class='libelle_phase'>" + processTmp.getGare() + "</a>";
			String coment = "<br> " + what  + "<br>"; 

			Log log = new     Log("EVENT", processTmp.getId(),  "Gare", nomPrj , "log", "success", processTmp.getCouleur() , coment);
			
			session.save(log);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 

	}
	
	

	/* *****************************
	
	Module Log 
	
	******************************* */
	
/*
 * 
 CREATE TABLE `todo` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `IDOBJ` bigint(20) DEFAULT NULL,
  `TYPEOBJ` varchar(255) DEFAULT NULL,
  `DCREATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `ORDER` int(11) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `PROGRESS` bigint(20) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `DEND` timestamp ,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

 */
 
	public Todo getTodo(Long id) {	
		Todo todo = new Todo();
		try {
			todo =(Todo) session.get(Todo.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return todo;
	}
	
	public void addTodo(Todo todo){
		try {
			session.save(todo);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 

	}


	@SuppressWarnings("unchecked")
	public List<Todo> listTodo(String filtre) {	
		List<Todo> todos = null;
		try {
			Query qry  = session.createQuery(" from Todo " + filtre);
			todos = qry.list();  
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return todos;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Todo> listTodo() {	
		List<Todo> todos = null;
		try {
			Query qry  = session.createQuery(P2cSql.GET_TODOS);
			todos = qry.list();  
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return todos;
	}

	@SuppressWarnings("unchecked")
	public List<Todo> listTodo(Log todofiltre) {	
		List<Todo> todos = null;
		try {
			Query qry  = session.createQuery(P2cSql.GET_TODOS_FILTRE);
			qry.setString(0, todofiltre.getClasse());
			qry.setParameter(1, todofiltre.getIdobj());
			todos = qry.list();  
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return todos;

	}

	public void deleteTodo(Long id) {
		Todo todo = new Todo();
		try {
			todo =(Todo) session.get(Todo.class, id);

			session.delete(todo);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	//GET VALUE UNIQ
	public String getValue(String requete) {
		try {
			return (String)session.createQuery(requete).uniqueResult();
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} 
	}

	@SuppressWarnings("unchecked")
	public List<Gedo> listGed(Long idprocess) {	
		List<Gedo> gedos = null;
		try {
			Query qry  = session.createQuery(P2cSql.GET_GEDBYPROCESS);
			qry.setParameter(0, idprocess);
			gedos = qry.list();  
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return gedos;

	}
	
	public void deleteGedo(Long id) {
		Gedo gedo = new Gedo();
		try {
			gedo =(Gedo) session.get(Gedo.class, id);

			session.delete(gedo);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public int getCount(String request) {
		return  ((Long)session.createQuery(request).uniqueResult()).intValue();
	}
	

	
}