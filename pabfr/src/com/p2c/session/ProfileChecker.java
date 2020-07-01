package com.p2c.session;


import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;

import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;


import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class ProfileChecker extends  AbstractInterceptor{
	private static final long serialVersionUID = 1L;

	String result = null;
	private String profile;

	String className = null;
	long startingTime = 0;
	long endingTime = 0;
	public static final String USER_SESSION_KEY = "UserSessionKey";
	final HttpServletRequest request = (HttpServletRequest) ActionContext
			.getContext().get(ServletActionContext.HTTP_REQUEST);
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		//System.out.println("Destroying Interceptor");

	}

	@Override
	public void init() {
		// TODO Auto-generated method stub
		//System.out.println("Intialising Interceptor");

	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		className = invocation.getAction().getClass().getName();

		Logger LOG = LoggerFactory.getLogger(ProfileChecker.class);
		LOG.info("Authenticating user");

		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get("UserSessionKey");

        
        
	if (usersession == null) {
			LOG.info("User not logged in");
			return "error";

		} 

	//System.out.println("profile exigessss : " + this.getProfile());
	//System.out.println("profile possede : " + usersession.getProfile());
	
	
	if (usersession.getProfile() == null) return "denied";
	else if (usersession.getProfile().equals("full") || usersession.getProfile().equals("DIRECTEUR PROJET") || 
			usersession.getProfile().equals("DIRECTEUR LIGNE")) invocation.invoke();
	else if (this.getProfile().equals("CONDUCTEUR") && usersession.getProfile().equals("CONDUCTEUR")) return invocation.invoke();
	else if (  this.getProfile().equals("CONTRIBUTEUR") && 
			   ( usersession.getProfile().equals("CONDUCTEUR") || usersession.getProfile().equals("CONTRIBUTEUR") 
			)) return invocation.invoke();
	else if (this.getProfile().equals("LECTEUR") && usersession.getProfile().equals("LECTEUR")) return invocation.invoke();
	
	
	return "denied";
	
	//if (usersession.getProfile() == null ||  (!usersession.getProfile().equals(this.getProfile()) && !usersession.getProfile().equals("full") )) return "denied";
	//return invocation.invoke();

	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	
	
}
