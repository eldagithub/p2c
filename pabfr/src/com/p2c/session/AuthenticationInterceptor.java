package com.p2c.session;


import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

public class AuthenticationInterceptor implements Interceptor {
	private static final long serialVersionUID = 1L;

	String result = null;
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
		startingTime = System.currentTimeMillis();
		//System.out.println("Interceptor Starting Time" + new Date(startingTime));

		endingTime = System.currentTimeMillis();
		//System.out.println("Interceptor Enging Time " + new Date(endingTime));
		//System.out.println("Time Taken by the Interceptor " + new Date(endingTime - startingTime));

		Logger LOG = LoggerFactory.getLogger(AuthenticationInterceptor.class);
		LOG.info("Authenticating user");

		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get("UserSessionKey");

		if (usersession == null) {
			LOG.info("User not logged in");
			return "error";

		}
		
		return invocation.invoke();

	}
	
}
