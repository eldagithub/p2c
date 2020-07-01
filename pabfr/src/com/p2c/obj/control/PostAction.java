package com.p2c.obj.control;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.dispatcher.SessionMap;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.p2c.obj.back.P2cDAO;
import com.p2c.obj.back.ProcessDAO;
import com.p2c.obj.back.UserDAO;
import com.p2c.obj.model.Log;
import com.p2c.obj.model.Process;
import com.p2c.obj.model.User;
import com.p2c.session.AuthenticationInterceptor;
import com.p2c.session.UserSession;



public class PostAction extends ActionSupport implements ModelDriven<Log> {

	private static final long serialVersionUID = -7759925652584240539L;

	private Log log = new Log();
	private List<Log> logList = new ArrayList<Log>();
	private P2cDAO p2cDao = new P2cDAO();

	private ProcessDAO processDAO = new ProcessDAO();
	private List<Process> processList = new ArrayList<Process>();

	private UserDAO userDAO = new UserDAO();
	private List<User> userList = new ArrayList<User>();

	
	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public Log getModel() {
		return log;
	}
	
	public String addComent()
	{

		if(this.log.getIdobj() == null) { 
			userList = userDAO.listByObjet("USER");
			
			@SuppressWarnings("rawtypes")
			SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
			UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);
			String defaultProcessRef = (String) session.get("DFAULTREFPROCESS");

			if (usersession.getProfile().equals("LECTEUR")){
				setProcessList(processDAO.listProcessReader(usersession.getName(), Integer.parseInt(defaultProcessRef)));	
			}else{
				setProcessList(processDAO.listProcess(usersession.getName(), Integer.parseInt(defaultProcessRef)));			
			}
			
			return INPUT;
		} else {
				Process prj = processDAO.getProcess(this.log.getIdobj());
				
				String nomobj = " <a class=libelle_programme>" + prj.getProgramme() + 
						"</a> | <a class=libelle_phase> " + prj.getGare() + 
						"</a>";
		
			try {
				Log logpost = new Log("EVENT", this.log.getIdobj(), "User",
						nomobj, "log", "success", this.log.getTolist(),
						this.log.getTolist() + " : <pre>" + this.log.getComent()+ "</pre>") ;

				p2cDao.addLog(logpost);
				return this.list();

			} catch (Exception e) {
				e.printStackTrace();
				return ERROR;

			}
		}

}
		
	
	public String list()
	{
//		this.log.setIdobj(0);
		this.log.setClasse("EVENT");
//		logList = p2cDao.listLog(this.log);

		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);
		String defaultProcessRef = (String) session.get("DFAULTREFPROCESS");

		logList = p2cDao.listLog(this.log, 0, usersession.getName(), Integer.parseInt(defaultProcessRef));
		processList = processDAO.listProcess(usersession.getName(), Integer.parseInt(defaultProcessRef));				
		
		return SUCCESS;
		
		
	}
	
	public String wallListReader()
	{
		this.log.setClasse("EVENT");

		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);
		String defaultProcessRef = (String) session.get("DFAULTREFPROCESS");

		logList = p2cDao.listReaderLog(this.log, 0, usersession.getName(), Integer.parseInt(defaultProcessRef));
		processList = processDAO.listProcess(usersession.getName(), Integer.parseInt(defaultProcessRef));				
		
		return SUCCESS;
	}
	
	public Log getLog() {
		return log;
	}

	public void setLog(Log log) {
		this.log = log;
	}

	public List<Log> getLogList() {
		return logList;
	}

	public void setLogList(List<Log> logList) {
		this.logList = logList;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public List<Process> getProcessList() {
		return processList;
	}

	public void setProcessList(List<Process> processList) {
		this.processList = processList;
	}

}
