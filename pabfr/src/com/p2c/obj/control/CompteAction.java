package com.p2c.obj.control;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.dispatcher.SessionMap;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.p2c.obj.back.ObjetDAO;
import com.p2c.obj.back.UserDAO;
import com.p2c.obj.model.Objet;
import com.p2c.obj.model.User;
import com.p2c.session.AuthenticationInterceptor;
import com.p2c.session.UserSession;

import com.p2c.auth.CryptoUtil;




public class CompteAction extends ActionSupport implements ModelDriven<User> {

	private static final long serialVersionUID = -7759925652584240539L;

	
	private List<User> userList = new ArrayList<User>();
	private UserDAO userDAO = new UserDAO();
	private User user = new User();
	


	
	private Long fromId;
	private String action=SUCCESS;

	private Objet objet = new Objet();
	private ObjetDAO objetDAO = new ObjetDAO();
	private List<Objet> profileList = new ArrayList<Objet>();
	private List<Objet> objetList = new ArrayList<Objet>();
	
	private Long HPJourneeDR;
	private Long HPSemaineDR;
	
	/* ************************************** */
	/*        Global Reference Method         */
	/* ************************************** */
	public String populate()
	{
		profileList = objetDAO.listObjet( "PROFILE" );

		return SUCCESS;
	}

	@Override
	public User getModel() {
		return user;
	}
	
	
	
	
	/* ************************************** */
	/*        User CRUDL --> SRDL             */
	/* ************************************** */
	public String readUser()
	{
		if (user.getId() == null) return ERROR;
		user = userDAO.getUser(user.getId());

		profileList = objetDAO.listObjet( "PROFILE" );


		return action;
	}
	
	public String update()
	{
		if (user.getId() == null) return ERROR;
		User usertmp = userDAO.getUser(user.getId());
		
		usertmp.setNom(user.getNom());
		usertmp.setPrenom(user.getPrenom());
		usertmp.setProfile(user.getProfile());
		usertmp.setEmail(user.getEmail());
		usertmp.setHpjournee(user.getHpjournee());
		usertmp.setHpsemaine(user.getHpsemaine());
		
		return action;
	}
	
	public String HPJourneeDR() throws Exception {

		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);
		
		User usertmp = userDAO.getUser(usersession.getName());
		HPJourneeDR = usertmp.getHpjournee();
		return SUCCESS;		
	}
	
	public String HPSemaineDR() {

		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);
		
		User usertmp = new User();
		try {
			usertmp = userDAO.getUser(usersession.getName());
			setHPSemaineDR(usertmp.getHpsemaine());
			System.out.println(HPSemaineDR+"HPSemaineDR");
			//HPSemaineDR = (long) 900;
			return SUCCESS;		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		setHPSemaineDR(usertmp.getHpsemaine());
		System.out.println(HPSemaineDR+"HPSemaineDR");
		return SUCCESS;		
	}
	
	public String initpwd() throws Exception {
		
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);

		if ( usersession.getName() == null || ! usersession.getProfile().equals("full") ) return ERROR;
		
		
		if (user.getId() == null) return ERROR;
		
		User userTmp = userDAO.getUser(user.getId());
		
	       if ( !checkPwd()) {
	        	addActionError("Le mot de passe saisi est incorrect.");
	        	return INPUT; 
	        	
	        };

		        
		CryptoUtil cyptU = new CryptoUtil();
    
    
    if (userDAO.getUser(usersession.getName(), cyptU.encrypt(user.getOldpassword())) == null) {
    	addActionError("L'ancien mot de passe n'est pas correcte.");
    	return INPUT; 
    	
    };

		
		userTmp.setPassword(cyptU.encrypt(user.getPassword()));
		
		
		return SUCCESS;
	}
	
	public String deleteUser()
	{
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);

		if ( usersession.getName() == null || ! usersession.getProfile().equals("full") ) return ERROR;

		if (user.getId() == null) return ERROR;
		User usertmp = userDAO.getUser(user.getId());
		
		if(usertmp.getLogin().equals(usersession.getName())) {
        	addActionError("Vous ne pouvez pas désactiver le compte avec lequel vous êtes connectés.");
        	user = usertmp;
        	return INPUT; 
        	
        };

		
		usertmp.setActive(user.getActive());
		int count = userDAO.getCount("select count(*) from Objet o where o.idresponsable=" + this.user.getId() + " ");
		if (count > 0){
			objet = objetDAO.getObjetByIdresponsable(this.user.getId());
			if (user.getActive().equals("yes")){
				objetDAO.activateObjet((objet.getCategorie()).substring(0, (objet.getCategorie()).length()-8), this.user.getId());
			}else{
				objetDAO.delObjetTemp(objet.getCategorie()+"_DELETED", this.objet.getIdref());
			}
		}
		return SUCCESS;
	}
		
	public String listAll()
	{
		userList = userDAO.listAll();
		return SUCCESS;
	}

	public String addUser () throws Exception 
	{

		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);

		if ( usersession.getName() == null || ! usersession.getProfile().equals("full") ) return ERROR;
		
		
		if (user == null) return ERROR;
		
		
        if ( !checkPwd()) {
        	addActionError("Le mot de passe saisi est incorrect.");
    		profileList = objetDAO.listObjet( "PROFILE" );

        	return INPUT; 
        	
        };

		//int count = userDAO.getCount("select count(*) from User u where u.login = '" + usersession.getName() + "' ");
		int count = userDAO.getCount("select count(*) from User u where u.login = '" + user.getLogin() + "' ");

		if (count > 0){
			addActionError("Le login existe déjà.");
			populate();
			return INPUT;
		}
			
		CryptoUtil cyptU = new CryptoUtil();
		user.setPassword(cyptU.encrypt(user.getPassword()));
		user.setActive("yes");
		if (user.getProfile().equals("full")) user.setObjet("ADMIN");
		else user.setObjet("USER");

		userDAO.addUser(user);
		return this.listAll();
	}

	
	

	public String addUserAndProgramme () throws Exception 
	{

		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);

		if ( usersession.getName() == null || ! (usersession.getProfile().equals("full") || usersession.getProfile().equals("CONDUCTEUR")) ) return ERROR;
		
		if (user == null) return ERROR;
		
		
        if ( !checkPwd()) {
        	addActionError("Le mot de passe saisi est incorrect.");
    		profileList = objetDAO.listObjet( "PROFILE" );

        	return INPUT; 
        	
        };

		int count = userDAO.getCount("select count(*) from User u where u.login = '" + user.getLogin() + "' ");

		if (count > 0){
			addActionError("Le login existe déjà.");
			return INPUT;
		}
			
		CryptoUtil cyptU = new CryptoUtil();
		user.setPassword(cyptU.encrypt(user.getPassword()));
		user.setActive("yes");
		user.setObjet("USER");
		userDAO.addUser(user);
		
		int idUser = userDAO.getCount("select u.id from User u where u.login = '" + user.getLogin() + "' ");
		objet.setIdresponsable(idUser);
		objet.setCategorie("PROGRAMME");
		objet.setNom(user.getNom());
		objet.setDescription(user.getPrenom());
		objetDAO.saveObjet(objet);
		objet.setOrdre(objet.getIdref().toString());

		setObjetList(objetDAO.listObjet(this.objet.getCategorie()));
		return SUCCESS;
	}

	public String addUserUpdateProgram() throws Exception 
	{

		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);

		if ( usersession.getName() == null || ! (usersession.getProfile().equals("full") || usersession.getProfile().equals("CONDUCTEUR")) ) return ERROR;
		
		if (user == null) return ERROR;
		
		
        if ( !checkPwd()) {
        	addActionError("Le mot de passe saisi est incorrect.");
    		profileList = objetDAO.listObjet( "PROFILE" );

        	return INPUT; 
        	
        };

		int count = userDAO.getCount("select count(*) from User u where u.login = '" + user.getPrenom() + user.getLogin() + "' ");

		if (count > 0){
			addActionError("Le login existe déjà.");
			setObjetList(objetDAO.listObjet("PROGRAMME"));
			return INPUT;
		}
			
		Objet obj = objetDAO.getObjet(Long.parseLong(user.getLogin()));

		CryptoUtil cyptU = new CryptoUtil();
		user.setPassword(cyptU.encrypt(user.getPassword()));
		user.setLogin(user.getPrenom() + user.getLogin() );
		user.setActive("yes");
		user.setObjet("USER");
		userDAO.addUser(user);
		
		int idUser = userDAO.getCount("select u.id from User u where u.login = '" + user.getLogin() + "' ");
		obj.setIdresponsable(idUser);
		objetDAO.saveObjet(obj);

		setObjetList(objetDAO.listObjet("PROGRAMME"));
		return SUCCESS;
	}


	
	
	private boolean checkPwd() {
        if (user.getPassword() == null || user.getPassword().equals("") ) {
        	return false; 
        	
        };

        if (user.getPassword2() == null || user.getPassword2().equals("") ) {
        	return false; 
        	
        };
        
        if (! user.getPassword().equals( user.getPassword2() ) ) {
        	return false; 
        	
        };
		
        return true;
		
	}

	/* ************************************** */
	/*        Setter & Getter                 */
	/* ************************************** */
	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public Long getFromId() {
		return fromId;
	}

	public void setFromId(Long fromId) {
		this.fromId = fromId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public List<Objet> getProfileList() {
		return profileList;
	}

	public void setProfileList(List<Objet> profileList) {
		this.profileList = profileList;
	}

	public void setHPJourneeDR(Long hPJourneeDR) {
		HPJourneeDR = hPJourneeDR;
	}
	public Long getHPJourneeDR() {
		return HPJourneeDR;
	}

	public void setHPSemaineDR(Long hPSemaineDR) {
		this.HPSemaineDR= hPSemaineDR;
	}
	public Long getHPSemaineDR() {
		return HPSemaineDR;
	}

	public List<Objet> getObjetList() {
		return objetList;
	}

	public void setObjetList(List<Objet> objetList) {
		this.objetList = objetList;
	}



}
