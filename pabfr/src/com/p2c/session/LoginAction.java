package com.p2c.session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.p2c.obj.back.P2cDAO;
import com.p2c.obj.back.P2cSql;
import com.p2c.obj.back.ProcessDAO;
import com.p2c.obj.back.UserDAO;
import com.p2c.obj.model.Log;
import com.p2c.obj.model.RefProcess;
import com.p2c.obj.model.User;

import com.p2c.auth.CryptoUtil;



//import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

//import javax.servlet.http.HttpServletRequest;

public class LoginAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = 1L;

	
	private UserDAO userDAO = new UserDAO();
	private User userprofile = new User();
	private String message = "";

	private P2cDAO p2cDao = new P2cDAO();
	private CryptoUtil cyptU = new CryptoUtil();

	private ProcessDAO processDAO = new ProcessDAO();
	private List<RefProcess> refProcessList = new ArrayList<RefProcess>();
	
	
	@SuppressWarnings({ "rawtypes", "unused" })
	private Map session;


    private boolean isInvalid(String value) {
        return (value == null || value.length() == 0);
    }

    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    private String password;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

	


	@SuppressWarnings("unchecked")
	public String execute() throws Exception {

		try {
		
			@SuppressWarnings("rawtypes")
			SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
			UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);

			if (usersession == null) {
				
				if (isInvalid(getUsername()) && isInvalid(getPassword()) ) return INPUT; 

				if (isInvalid(getUsername())) {
		        	addActionError("Le nom d'utilisateur ou le mot de passe saisi est incorrect.");
		        	return INPUT; 
		        	
		        };

		        if (isInvalid(getPassword())) {
		        	addActionError("Le nom d'utilisateur ou le mot de passe saisi est incorrect.");
		        	return INPUT; 
		        	
		        };

		        User user = new User();
		        	user = (User) userDAO.getUser(getUsername(), cyptU.encrypt(getPassword()));
		        
		        if (user == null) {
		        	addActionError("Le nom d'utilisateur ou le mot de passe saisi est incorrect.");
		        	return INPUT; 
		        	
		        };
		        
				String default_refprocess = p2cDao
						.getValue(P2cSql.GET_DFAULTREFPROCESS);

				refProcessList = processDAO.listRefProcess();	

		        session.put(AuthenticationInterceptor.USER_SESSION_KEY, new UserSession( getUsername(), user.getProfile() ));
		        session.put("DFAULTREFPROCESS", default_refprocess);
		        session.put("refProcessList", refProcessList);

				long t = 0;
		        Log log = new Log("SYSTEM", t,  "SYSTEM", "LOGIN", "login", "success", "" , getText("login.login", "", getUsername()));
				p2cDao.addLog(log);
				
				/*if(user.getProfile().equals("LECTEUR")) {
					return "reader";
				};*/
			}else{
		      /*  User user = new User();
	        	user = (User) userDAO.getUser(getUsername(), cyptU.encrypt(getPassword()));
				if(user.getProfile().equals("LECTEUR")) {
					return "reader";
				};*/
		
			return SUCCESS;
			}
			return SUCCESS;
		} catch (LoginException e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			return INPUT;
		}
	}


	public String populate() throws Exception {
		
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);

		this.userprofile = userDAO.getUser(usersession.getName());
		
		return SUCCESS;
	}

	public String update() throws Exception {
		
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);

		if (this.userprofile == null || this.userprofile.getLogin() == null || !this.userprofile.getLogin().equals(usersession.getName())) return ERROR;
		
		User userTmp = userDAO.getUser(usersession.getName());
		
		if (!this.userprofile.getId().equals(userTmp.getId())) return ERROR;
		
        if (isInvalid(userprofile.getNom())) {
        	addActionError("Le nom doit être saisi");
        	return INPUT; 
        	
        };
        if (isInvalid(userprofile.getPrenom())) {
        	addActionError("Le prénom doit être saisi");
        	return INPUT; 
        	
        };
        if (isInvalid(userprofile.getEmail())) {
        	addActionError("L'adresse email est incorrecte.");
        	return INPUT; 
        	
        };
		userTmp.setNom(this.userprofile.getNom());
		userTmp.setPrenom(this.userprofile.getPrenom());
		userTmp.setEmail(this.userprofile.getEmail());
		
		

        message="La modification a été réalisée avec succés";

		return SUCCESS;
	}
		
	public String updatepwd() throws Exception {
		
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);

		if (this.userprofile == null || this.userprofile.getLogin() == null || !this.userprofile.getLogin().equals(usersession.getName())) return ERROR;
		
		User userTmp = userDAO.getUser(usersession.getName());
		
		if (!this.userprofile.getId().equals(userTmp.getId())) return ERROR;
		
		
		        if (isInvalid(userprofile.getPassword()) ) {
		        	addActionError("Le mot de passe saisi est incorrect.");
		        	return INPUT; 
		        	
		        };

		        if (!userprofile.getPassword().equals(userprofile.getPassword2()) ) {
		        	addActionError("Les deux mots de passe saisis ne sont pas identiques.");
		        	return INPUT; 
		        	
		        };

		
		        
		        if (userDAO.getUser(usersession.getName(), cyptU.encrypt(userprofile.getOldpassword())) == null) {
		        	addActionError("L'ancien mot de passe n'est pas correcte.");
		        	return INPUT; 
		        	
		        };

		        userTmp.setPassword(cyptU.encrypt(userprofile.getPassword()));
		        
		        this.userprofile = userTmp;
		
		        message="La modification du mot de passe a été réalisée avec succés";
		        return SUCCESS;
	}
		
		
	// === SessionAware ===
	@SuppressWarnings("rawtypes")
	public void setSession(Map session) {
		this.session = session;
	}

	public User getUserprofile() {
		return userprofile;
	}

	public void setUserprofile(User userprofile) {
		this.userprofile = userprofile;
	}

	public String getMessage() {
		return message;
	}



}
