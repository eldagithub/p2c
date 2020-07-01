package com.p2c.obj.control;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.dispatcher.SessionMap;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.p2c.obj.back.ObjetDAO;
import com.p2c.obj.back.P2cDAO;
import com.p2c.obj.back.UserDAO;
import com.p2c.obj.model.Objet;
import com.p2c.obj.model.Process;
import com.p2c.obj.model.User;
import com.p2c.session.AuthenticationInterceptor;
import com.p2c.session.UserSession;



public class ObjetAction extends ActionSupport implements ModelDriven<Objet> {

	private static final long serialVersionUID = -7759925652584240539L;

	//Objet attribute
	private Objet objet = new Objet();
	private List<Objet> objetList = new ArrayList<Objet>();
	private ObjetDAO objetDAO = new ObjetDAO();
	private List<Process> processList = new ArrayList<Process>();
	private UserDAO userDAO = new UserDAO();

	private P2cDAO p2cDao = new P2cDAO();

	
	private String action=SUCCESS;


	
	/* ************************************** */
	/*        Global Reference Method         */
	/* ************************************** */
	public String populate()
	{
		this.listObjet(this.objet.getCategorie());
		return SUCCESS;
	}

	@Override
	public Objet getModel() {
		return objet;
	}
	
	
	
	
	/* ************************************** */
	/*        Objet CRUDL --> SRDL           */
	/* ************************************** */
	public String saveObjet()
	{
		objetDAO.saveObjet(objet);
		System.out.println(objet.getNom());
		System.out.println(objet.getDescription());
		objet.setOrdre(objet.getIdref().toString());
		
		objetList = objetDAO.listObjet(objet.getCategorie());

		return SUCCESS;
	}

	public String editObjet()
	{
		Objet objetTmp = objetDAO.getObjet(this.objet.getIdref());
		
		objetTmp.setNom(this.objet.getNom());
		objetTmp.setDescription(this.objet.getDescription());

		objetDAO.saveObjet(objetTmp);
		
		objetList = objetDAO.listObjet(objet.getCategorie());

		return SUCCESS;
	}

	public String readObjet()
	{
		objet = objetDAO.getObjet(this.objet.getIdref());
		return action;
	}
	
	public String deleteObjet()
	{
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);

		objet = objetDAO.getObjet(this.objet.getIdref());
		
		int count = p2cDao.getCount("select count(*) from Process pr, Objet ob where (pr.idgare = ob.idref or pr.idprogramme = ob.idref) and ob.idref=" + this.objet.getIdref() + " ");

		if (count == 0) {

			if (this.objet.getIdresponsable() > 0){
				User usertmp = userDAO.getUser((long) this.objet.getIdresponsable());
				if(usertmp.getLogin().equals(usersession.getName())) {
		        	addActionError("Vous ne pouvez pas désactiver le compte avec lequel vous êtes connectés.");
		        	return ERROR; 
		        };
				usertmp.setActive("no");
				objetDAO.delObjetTemp(this.objet.getCategorie()+"_DELETED", this.objet.getIdref());
			}else{
				objetDAO.delObjet(this.objet.getIdref());
			}
			return SUCCESS;
		} return ERROR;
		
	}
				
	public String listObjet(String categorie)
	{
		objetList = objetDAO.listObjet(categorie);
		return SUCCESS;
	}

	public String listObjet()
	{
		objetList = objetDAO.listObjet(this.objet.getCategorie());
		return SUCCESS;
	}
	
	public String listProcess(){
		processList = objetDAO.listProcessByObjet(this.objet.getIdref());		
		return SUCCESS;
	}
	
	public String list_ratios(){
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);

		objetList = objetDAO.listRatios("KPI", usersession.getName() );
		return SUCCESS;
	}
	
	public String list_ratios2(){

		objetList = objetDAO.listRatios("KPI", (userDAO.getUser((long) this.objet.getIdresponsable())).getLogin() );
		return SUCCESS;
	}
	
	public String update_ratio(){
		objetDAO.update_ratio(this.objet.getDescription(), this.objet.getIdref());
		objetList = objetDAO.listRatios("KPI", (userDAO.getUser((long) objetDAO.getObjet(this.objet.getIdref()).getIdresponsable())).getLogin());
		return SUCCESS;
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

	public Objet getObjet() {
		return objet;
	}

	public void setObjet(Objet objet) {
		this.objet = objet;
	}

	public List<Objet> getObjetList() {
		return objetList;
	}

	public void setObjetList(List<Objet> objetList) {
		this.objetList = objetList;
	}

	public List<Process> getProcessList() {
		return processList;
	}

	public void setProcessList(List<Process> processList) {
		this.processList = processList;
	}


}
