package com.p2c.session;

import com.opensymphony.xwork2.ActionSupport;
import com.p2c.obj.back.P2cDAO;
import com.p2c.obj.model.Log;

import org.apache.struts2.interceptor.SessionAware;

import java.util.Map;


public class LogoutAction extends ActionSupport implements SessionAware {


	private static final long serialVersionUID = 1L;

	@SuppressWarnings("rawtypes")
	private Map session;
	private P2cDAO p2cDao = new P2cDAO();



	public String execute() throws Exception {

		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);
		if (usersession != null) {
			Log log = new Log("SYSTEM", (long) 0,  "SYSTEM", "LOGIN", "logout", "success", "" , getText("login.logout", "", usersession.getName()));
			p2cDao.addLog(log);
			session.remove(AuthenticationInterceptor.USER_SESSION_KEY);
		}

		return SUCCESS;
	}


	// === SessionAware ===
	@SuppressWarnings("rawtypes")
	public void setSession(Map session) {
		this.session = session;
	}
}
