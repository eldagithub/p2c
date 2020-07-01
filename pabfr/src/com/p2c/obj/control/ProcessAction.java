package com.p2c.obj.control;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.dispatcher.SessionMap;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.p2c.obj.back.ChampsDAO;
import com.p2c.obj.back.P2cDAO;
import com.p2c.obj.model.Log;
import com.p2c.obj.back.ProcessDAO;
import com.p2c.obj.model.Champs;
import com.p2c.obj.model.Process;
import com.p2c.obj.model.RefProcess;
import com.p2c.obj.model.Objet;
import com.p2c.obj.back.ObjetDAO;
import com.p2c.obj.model.Phase;
import com.p2c.obj.back.PhaseDAO;
import com.p2c.obj.model.User;
import com.p2c.obj.back.UserDAO;

import com.p2c.obj.back.EtapeDAO;
import com.p2c.obj.model.Etape;
import com.p2c.session.AuthenticationInterceptor;
import com.p2c.session.UserSession;



public class ProcessAction extends ActionSupport implements ModelDriven<Process> {

	private static final long serialVersionUID = -7759925652584240539L;

	private Process process = new Process();
	private Phase phase = new Phase();

	private ProcessDAO processDAO = new ProcessDAO();
	private List<Process> processList = new ArrayList<Process>();
	private List<RefProcess> refProcessList = new ArrayList<RefProcess>();

	private PhaseDAO phaseDAO = new PhaseDAO();
	private List<Phase> phaseList = new ArrayList<Phase>();

	private ObjetDAO objetDAO = new ObjetDAO();
	private List<Objet> gareList = new ArrayList<Objet>();
	private List<Objet> programmeList = new ArrayList<Objet>();

	private UserDAO userDAO = new UserDAO();
	private List<User> dpList = new ArrayList<User>();
	private List<User> cpList = new ArrayList<User>();
	
	private EtapeDAO etapeDAO = new EtapeDAO();
	private List<Objet> actesunitList = new ArrayList<Objet>();
	private List<Objet> actesallList = new ArrayList<Objet>();
	private List<Etape> etapeList = new ArrayList<Etape>();

	private P2cDAO p2cDao = new P2cDAO();

	private Champs champs = new Champs();
	private List<Champs> champsList = new ArrayList<Champs>();
	private ChampsDAO champsDAO = new ChampsDAO();
	
	private String default_refprocess;

	private String montantDevis;
	private Long montantPaiements;
	private String devisSigne;

	public String getDefault_refprocess() {
		return default_refprocess;
	}

	public void setDefault_refprocess(String default_refprocess) {
		this.default_refprocess = default_refprocess;
	}

	@Override
	public Process getModel() {
		return process;
	}
	
	public String create()
	{
		/*int count = p2cDao.getCount("select count(*) from Process pr where pr.idgare = " + this.process.getIdgare() + " and  pr.idprogramme = " + this.process.getIdprogramme() + " ");

		if (count == 0) {*/
		
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		String defaultProcessRef = (String) session.get("DFAULTREFPROCESS");
		
		process.setIdref((long) Integer.parseInt(defaultProcessRef));
		
		processDAO.createProcess(process);
		
		Process prcTmp = processDAO.getProcess(this.process.getId());
		
		String nomPrj = "<a class='libelle_programme'>" + prcTmp.getProgramme() + "</a> | <a class='libelle_phase'>" + prcTmp.getGare() + "</a>";
		String coment = "<br>Création du nouveau plan de traitement<br>"; 
		
		Log log = new     Log("EVENT", prcTmp.getId(),  "Gare", nomPrj , "log", "success", prcTmp.getCouleur() , coment);
		p2cDao.addLog(log);
		
		processDAO.updateProcessPhaseEncours(prcTmp.getId());

		if (this.process.getId() != null ){
			champsList = champsDAO.listChamps(this.process.getId());
			process = processDAO.getProcess(this.process.getId()) ;
		} 
		
		

		/*if (champsList.size()>0) return SUCCESS;
		else {*/
			phaseList = phaseDAO.listPhaseAll(process.getId());

			for (int i=0; i<phaseList.size(); i++){
				if (phaseList.get(i).getClasse().equals("DENTISTE")) {
					this.setPhase(phaseList.get(i));
					setActesunitList(etapeDAO.listActes("yes"));
					setActesallList(etapeDAO.listActes("no"));
					
					setEtapeList(etapeDAO.listEtape( phaseList.get(i).getId()));
					return "dentiste2";				
				}
			}
			
			return "nodynfield";
		/*}*/
		/*} else {
			programmeList = objetDAO.listObjet("PROGRAMME");
			gareList = objetDAO.listObjet("GARE");

			dpList = userDAO.listObjet2("DIRECTEUR PROCESS' or profile = 'full");
			cpList = userDAO.listObjet2("CONDUCTEUR' or profile = 'full");
			addActionError("Un process portant le couple Programme/Gare saisi existe déjà!");
			return INPUT;			
		}*/
			


	}

	public String createStep2()
	{
		Process prcTmp = processDAO.getProcess(this.process.getId());
		
		String nomPrj = "<a class='libelle_programme'>" + prcTmp.getProgramme() + "</a> | <a class='libelle_phase'>" + prcTmp.getGare() + "</a>";
		String coment = "<br>Création du nouveau process : champs dynamiques<br>"; 
		
		Log log = new     Log("EVENT", prcTmp.getId(),  "Gare", nomPrj , "log", "success", prcTmp.getCouleur() , coment);
		//p2cDao.addLog(log);

		phaseList = phaseDAO.listPhaseAll(process.getId());

		for (int i=0; i<phaseList.size(); i++){
			if (phaseList.get(i).getClasse().equals("DENTISTE")) {
				this.setPhase(phaseList.get(i));
				setActesunitList(etapeDAO.listActes("yes"));
				setActesallList(etapeDAO.listActes("no"));
				
				setEtapeList(etapeDAO.listEtape( phaseList.get(i).getId()));
				return "dentiste2";				
			}
			
		}

		return SUCCESS;

	}
	
	
	public String update()
	{
			phaseList = phaseDAO.listPhase(this.process.getId());
			this.setProcess(processDAO.getProcess(this.process.getId())); 

		return populate();
	}
	

	public String save()
	{
		/*int count = p2cDao.getCount("select count(*) from Process pr where pr.id <> " + this.process.getId() + " and pr.idgare = " + this.process.getIdgare() + " and  pr.idprogramme = " + this.process.getIdprogramme() + " ");

		if (count == 0) {*/
		processDAO.saveProcess(process);
		
		Process prcTmp = processDAO.getProcess(this.process.getId());
		
		String nomPrj = "<a class='libelle_programme'>" + prcTmp.getProgramme() + "</a> | <a class='libelle_phase'>" + prcTmp.getGare() + "</a>";
		String coment = "<br>Mise a jour plan de traitement<br>"; 
		
		Log log = new     Log("EVENT", prcTmp.getId(),  "Gare", nomPrj , "log", "success", prcTmp.getCouleur() , coment);
		p2cDao.addLog(log);


		
		if (this.process.getId() != null ){
			System.out.println(this.process.getId());
			champsList = champsDAO.listChamps(this.process.getId());
			process = processDAO.getProcess(this.process.getId()) ;
		} 
		
		//phaseList = phaseDAO.listPhaseAll(process.getId());
		//process = processDAO.getProcess(process.getId()) ;

		if (champsList.size()>0){
			return SUCCESS;
		}
		else {
			phaseList = phaseDAO.listPhaseAll(process.getId());

			/*for (int i=0; i<phaseList.size(); i++){
				if (phaseList.get(i).getClasse().equals("DENTISTE")) {
					this.setPhase(phaseList.get(i));
					setActesunitList(etapeDAO.listActes("yes"));
					setActesallList(etapeDAO.listActes("no"));
					
					setEtapeList(etapeDAO.listEtapeActeDent( phaseList.get(i).getId()));
					return "dentiste2";				
				}
			}
			
			return "nodynfield";*/
			return "success2";

		}
		/*} else {
			programmeList = objetDAO.listObjet("PROGRAMME");
			gareList = objetDAO.listObjet("GARE");

			dpList = userDAO.listObjet2("DIRECTEUR PROCESS' or profile = 'full");
			cpList = userDAO.listObjet2("CONDUCTEUR' or profile = 'full");
			addActionError("Un process portant le couple Programme/Gare saisi existe déjà!");
			return INPUT;			
		}*/
	}

	public String saveStep2()
	{
		Process prcTmp = processDAO.getProcess(this.process.getId());
		
		String nomPrj = "<a class='libelle_programme'>" + prcTmp.getProgramme() + "</a> | <a class='libelle_phase'>" + prcTmp.getGare() + "</a>";
		String coment = "<br>Mise a jour champs dynamiques process<br>"; 
		
		Log log = new     Log("EVENT", prcTmp.getId(),  "Gare", nomPrj , "log", "success", prcTmp.getCouleur() , coment);
		//p2cDao.addLog(log);

		phaseList = phaseDAO.listPhaseAll(process.getId());

		for (int i=0; i<phaseList.size(); i++){
			if (phaseList.get(i).getClasse().equals("DENTISTE")) {
				this.setPhase(phaseList.get(i));
				setActesunitList(etapeDAO.listActes("yes"));
				setActesallList(etapeDAO.listActes("no"));
				
				setEtapeList(etapeDAO.listEtapeActeDent( phaseList.get(i).getId()));
				process = processDAO.getProcess(process.getId()) ;
				return "dentiste2";				
			}
			
		}
	
		
		return SUCCESS;
	}

	public String getDentiste2Contenu()
	{
		phaseList = phaseDAO.listPhaseAll(process.getId());

		for (int i=0; i<phaseList.size(); i++){
			if (phaseList.get(i).getClasse().equals("DENTISTE")) {
				this.setPhase(phaseList.get(i));
				setActesunitList(etapeDAO.listActes("yes"));
				System.out.println(actesunitList.size()+"actesunitList");
				setActesallList(etapeDAO.listActes("no"));
				
				setEtapeList(etapeDAO.listEtapeActeDent( phaseList.get(i).getId()));
				process = processDAO.getProcess(process.getId()) ;
				return "success";				
			}
			
		}
		return SUCCESS;
	}	

	public String print()
	{		
		if (this.process.getId() != null ){
			System.out.println(this.process.getId());
			process = processDAO.getProcess(this.process.getId()) ;
		
			programmeList = objetDAO.listObjet("PROGRAMME");
			gareList = objetDAO.listObjet("GARE");
	
			dpList = userDAO.listObjet2("DIRECTEUR PROCESS' or profile = 'full");
			cpList = userDAO.listObjet2("CONDUCTEUR' or profile = 'full");
			phaseList = phaseDAO.listPhaseAll(process.getId());

			for (int i=0; i<phaseList.size(); i++){
				if (phaseList.get(i).getClasse().equals("DENTISTE")) {
					this.setPhase(phaseList.get(i));
					setActesunitList(etapeDAO.listActes("yes"));
					setActesallList(etapeDAO.listActes("no"));
					
					setEtapeList(etapeDAO.listEtapeActeDent( phaseList.get(i).getId()));
				}
			}
			return "dentiste2";				
		} else{
			return ERROR;
		}
	}
	
	@SuppressWarnings("unchecked")
	public String changeRefprocess()
	{	
		if (default_refprocess != null) {
			@SuppressWarnings("rawtypes")
			SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
	        session.put("DFAULTREFPROCESS", default_refprocess);
		}

		
	
		return this.list();
	}
	
	public String list()
	{
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);
		String defaultProcessRef = (String) session.get("DFAULTREFPROCESS");

		processList = processDAO.listProcess(usersession.getName(), Integer.parseInt(defaultProcessRef) );				
//		refProcessList = processDAO.listRefProcess();	
		
		return populate();
	}
	
	public String listProcessReader()
	{
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);
		String defaultProcessRef = (String) session.get("DFAULTREFPROCESS");

		//processList = processDAO.listProcessReader(usersession.getName(), Integer.parseInt(defaultProcessRef) );				
		setProcessList(processDAO.listProcessReader(usersession.getName(), Integer.parseInt(defaultProcessRef)));	
		
		return populate();
	}
		
	
	

	public String populate()
	{
		programmeList = objetDAO.listObjet("PROGRAMME");
		gareList = objetDAO.listObjet("GARE");

		dpList = userDAO.listObjet("DIRECTEUR PROJET");
		cpList = userDAO.listObjet2("CONDUCTEUR' or profile = 'DIRECTEUR PROJET' or profile = 'full");
		
		return SUCCESS;
	}
	
	public String delete()
	{
		Process prcTmp = processDAO.getProcess(this.process.getId());
		
		String nomPrj = "<a class='libelle_programme'>" + prcTmp.getProgramme() + "</a> | <a class='libelle_phase'>" + prcTmp.getGare() + "</a>";
		String coment = "<br>Suppression du process<br>"; 
		
		Log log = new     Log("EVENT", prcTmp.getId(),  "Gare", nomPrj , "log", "success", prcTmp.getCouleur() , coment);

		
		processDAO.deleteProcess(this.process.getId());
		p2cDao.addLog(log);

		
		return SUCCESS;
	}
	
	
	public String listDevisZero()
	{
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);
		String defaultProcessRef = (String) session.get("DFAULTREFPROCESS");

		processList = processDAO.listDevisZero(usersession.getName(), Integer.parseInt(defaultProcessRef) );				
		
		return populate();
	}
	
	public String listDevisNonSigne()
	{
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);
		String defaultProcessRef = (String) session.get("DFAULTREFPROCESS");

		processList = processDAO.listDevisNonSigne(usersession.getName(), Integer.parseInt(defaultProcessRef) );				
		
		return populate();
	}

	public String KpiMontantPaiements()
	{
		montantPaiements = processDAO.getCount("select sum(t.montant) from Process p, Phase ph, Tache t where t.idphase=ph.id and ph.idprocess=p.id and p.id="+this.process.getId() +" and t.type = 'paiement' ");
		return SUCCESS;
	}

	
	//Getter Setter

	public Process getProcess() {
		return process;
	}

	public List<Objet> getGareList() {
		return gareList;
	}

	public void setGareList(List<Objet> objetList) {
		this.gareList = objetList;
	}

	public List<Objet> getProgrammeList() {
		return programmeList;
	}

	public void setProgrammeList(List<Objet> objetList) {
		this.programmeList = objetList;
	}
	
	public List<User> getDpList() {
		return dpList;
	}

	public void setDpList(List<User> dpList) {
		this.dpList = dpList;
	}

	public List<User> getCpList() {
		return cpList;
	}

	public void setCpList(List<User> cpList) {
		this.cpList = cpList;
	}

	public void setProcess(Process process) {
		this.process = process;
	}

	public List<Process> getProcessList() {
		return processList;
	}

	public void setProcessList(List<Process> processList) {
		this.processList = processList;
	}


	public List<RefProcess> getRefProcessList() {
		return refProcessList;
	}

	public void setRefProcessList(List<RefProcess> refProcessList) {
		this.refProcessList = refProcessList;
	}


	public List<Phase> getPhaseList() {
		return phaseList;
	}

	public void setPhaseList(List<Phase> phaseList) {
		this.phaseList = phaseList;
	}

	public Champs getChamps() {
		return champs;
	}

	public void setChamps(Champs champs) {
		this.champs = champs;
	}

	public List<Champs> getChampsList() {
		return champsList;
	}

	public void setChampsList(List<Champs> champsList) {
		this.champsList = champsList;
	}

	public List<Objet> getActesallList() {
		return actesallList;
	}

	public void setActesallList(List<Objet> actesallList) {
		this.actesallList = actesallList;
	}

	public List<Objet> getActesunitList() {
		return actesunitList;
	}

	public void setActesunitList(List<Objet> actesunitList) {
		this.actesunitList = actesunitList;
	}

	public List<Etape> getEtapeList() {
		return etapeList;
	}

	public void setEtapeList(List<Etape> etapeList) {
		this.etapeList = etapeList;
	}

	public Phase getPhase() {
		return phase;
	}

	public void setPhase(Phase phase) {
		this.phase = phase;
	}
	
	public String getMontantDevis() {
		return montantDevis;
	}

	public void setMontantDevis(String montantDevis) {
		this.montantDevis = montantDevis;
	}

	public String getDevisSigne() {
		return devisSigne;
	}

	public void setDevisSigne(String devisSigne) {
		this.devisSigne = devisSigne;
	}
	
	public String KpiMontantDevis(){
		setMontantDevis(processDAO.getChamp("select c.value from Champs c where c.idprocess="+ process.getId()+" and c.nom='Montant devis' "));
System.out.println("iouoiuoiuo");
return SUCCESS;
	}

	public String KpiDevisSigne(){
		setDevisSigne(processDAO.getChamp("select c.value from Champs c where c.idprocess="+ process.getId()+" and c.nom='Devis signé ?' "));
		return SUCCESS;
	}

	public Long getMontantPaiements() {
		return montantPaiements;
	}

	public void setMontantPaiements(Long montantPaiements) {
		this.montantPaiements = montantPaiements;
	}



}
