package com.p2c.obj.control;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.struts2.dispatcher.SessionMap;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.p2c.obj.back.EtapeDAO;
import com.p2c.obj.back.RefDAO;
import com.p2c.obj.model.Etape;
import com.p2c.obj.model.Objet;
import com.p2c.obj.model.RefEtape;
import com.p2c.obj.back.PhaseDAO;
import com.p2c.obj.model.Phase;

import com.p2c.obj.back.TacheDAO;
import com.p2c.obj.model.Tache;

import com.p2c.obj.back.UserDAO;
import com.p2c.obj.model.User;
import com.p2c.session.AuthenticationInterceptor;
import com.p2c.session.UserSession;

public class EtapeAction extends ActionSupport implements ModelDriven<Etape> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 262106723964577392L;
	private Etape etape = new Etape();
	private List<Etape> etapeList = new ArrayList<Etape>();
	private List<Etape> familleList = new ArrayList<Etape>();
	private EtapeDAO etapeDAO = new EtapeDAO();

	private Phase phase = new Phase();
	private PhaseDAO phaseDAO = new PhaseDAO();

	private List<Objet> actesunitList = new ArrayList<Objet>();
	private List<Objet> actesallList = new ArrayList<Objet>();
	


	private Tache tache = new Tache();
	private List<Tache> tacheList = new ArrayList<Tache>();
	private TacheDAO tacheDAO = new TacheDAO();

	// private P2cDAO p2cDao = new P2cDAO();

	// private ProcessDAO processDAO = new ProcessDAO();

	private UserDAO userDAO = new UserDAO();
	private List<User> ctList = new ArrayList<User>();
	private RefDAO refDAO = new RefDAO();

	//private List<PrjPhaTsk> pptList = new ArrayList<PrjPhaTsk>();

	private String order;

	private int dureeTache;
	private int delaiTache;
	private String dentsList;
	private String tachesList;
	
	/****** variable pour la partie Dashboard *******/
	private String KpiHPJournee;
	private Long KpiDureePlanTTT;
	private int KpiHonoProgPatient;
	private Long KpiHonoProgJournee;
	private Long KpiHonoProg7NextDays;
	private Long KpiHonoProg7PreviousDays;
	private Long CAProdTache;
	
	@Override
	public Etape getModel() {
		return etape;
	}

	public String populate() {
		//this.etape = etapeDAO.getEtape(this.etape.getId());
		setActesunitList(etapeDAO.listActes("yes"));
		setActesallList(etapeDAO.listActes("no"));

		setEtapeList(etapeDAO.listEtape(this.phase.getId()));
		//setFamilleList(etapeDAO.listFamille((long)63));
		
		
		return SUCCESS;
	}

	public String populateFamille() {
		setFamilleList(etapeDAO.listFamille(this.phase.getId()));
		return SUCCESS;
	}
	public String populateSeance() {
		setEtapeList(etapeDAO.listEtapeActeDentTache(this.phase.getId()));
		setTacheList(tacheDAO.listTache(phase.getId(), ""));
		setCtList(userDAO.listObjet2("CONTRIBUTEUR' or profile = 'CONDUCTEUR' or profile='DIRECTEUR PROJET' or profile='full"));
		
		
		return SUCCESS;
	}

	public String setResponsableSeance() {
		
		Tache tacheTmp = tacheDAO.getTache(this.tache.getId());
		
		tacheTmp.setIdresponsable(this.tache.getIdresponsable());
		
		return  populateSeance();
	}

	public String setSeanceActe() {
		
		int idtachetodelete = etapeDAO.getCount("select distinct idtache from Etape where idphase= "+ this.etape.getIdphase()+" and idacte= "+this.etape.getIdacte()+" and dent= "+this.etape.getDent() +" ");
		etapeDAO.setSeanceActe(etape);
		int count = etapeDAO.getCount("select count(*) from Etape where idtache= "+ idtachetodelete +" ");

		if (count == 0){
			tacheDAO.delete((long) idtachetodelete);
			System.out.println("Suppression idtache à suppr ok "+ idtachetodelete);
		}
		
		return  populateSeance();
	}
	
	public String updateOrdrefamille() {
		String[] parts = order.split("-");
		Etape etapeTmp = etape;
		
		for (int i=1; i<parts.length; i++){
			etapeTmp.setIdfamille(Integer.parseInt(parts[i]));
			etapeTmp.setOrdrefamille(i);
			etapeDAO.updateOrdrefamille(etapeTmp);

		} 
		//etapeDAO.updateOrdrefamille(etape);
		this.phase.setId(this.etape.getIdphase());
		return populateFamille();
	}

	
	
	public String addActeDent() {
		etapeDAO.addActeDent(etape);

		// Etape etapeTmp = etapeDAO.getEtape(etape.getId());
		System.out.println("Etape :  + etapeTmp.getActe()");

		/*
		 * Etape etapeTmp = etapeDAO.getEtape(etape.getId());
		 * 
		 * String coment = "L acte : <b>"+ etapeTmp.getNom() +
		 * " </b>/<b> Dent : " +etapeTmp.getDent() + " a été ajoutée";
		 * 
		 * Process processTmp = processDAO.getProcess(phaseTmp.getIdprocess());
		 * p2cDao.addLog(processTmp, coment);
		 */

		return SUCCESS;
	}

	public String addActeDent2() {
		tacheDAO.saveTache(tache);

		Tache tskTmp = tacheDAO.getTache(this.tache.getId());
		tskTmp.setOrdre(this.tache.getId().intValue());
		tskTmp.setIdref(this.tache.getIdref());
		
		StringTokenizer st = new StringTokenizer(this.dentsList, ";");
		Etape etapeTmp = new Etape();
		etapeTmp.setIdacte(this.etape.getIdacte());
		etapeTmp.setIdphase(this.tache.getIdphase());
		etapeTmp.setIdtache(this.tache.getId());

		while (st.hasMoreTokens()) {
			etapeTmp.setDent(Integer.parseInt(st.nextToken()));
			etapeDAO.addActeDent2(etapeTmp);
		}

		//etapeDAO.addActeDent2(etape);
		return SUCCESS;
	}

	public String addActeDent3() {

		List<RefEtape> refEtapeTmp = refDAO.getRefEtapeByIdacte2(this.etape.getIdacte());
		Tache tskTmp = new Tache();
	    for(int i = 0; i < refEtapeTmp.size(); i++){
	    	if(i==0){
	    		tacheDAO.saveTache(tache);

	    		tskTmp = tacheDAO.getTache(this.tache.getId());
	    		tskTmp.setOrdre(this.tache.getId().intValue());
	    		
	    		Etape etapeTmp = new Etape();
	    		etapeTmp.setIdacte(this.etape.getIdacte());
	    		etapeTmp.setIdphase(this.tache.getIdphase());
	    		etapeTmp.setIdtache(this.tache.getId());
	    		etapeTmp.setIdref(refEtapeTmp.get(i).getIdref());
	    		etapeTmp.setDelai(0);
	    		etapeTmp.setDuree(0);
	    		etapeTmp.setDent(this.etape.getDent());
	    		
	    		StringTokenizer st = new StringTokenizer(this.dentsList, ";");
	    		while (st.hasMoreTokens()) {
	    			etapeTmp.setDent(Integer.parseInt(st.nextToken()));
		    		etapeDAO.addActeDent3(etapeTmp);
	    		}

	    	}else{
	    		Etape etapeTmp = new Etape();
	    		etapeTmp.setIdtache(this.tache.getId());
	    		if(! (refEtapeTmp.get(i-1).getDescription().equals(refEtapeTmp.get(i).getDescription()))){
	    			Tache tskTmp2 = new Tache();
	    			tskTmp2.setIdphase(this.tache.getIdphase());
	    			tskTmp2.setIdref(this.tache.getIdref());
	    			tskTmp2.setNom(this.tache.getNom());
	    			tskTmp2.setIdresponsable(this.tache.getIdresponsable());
	    			tskTmp2.setDstartprev(this.tache.getDstartprev());
	    			tskTmp2.setDescription(this.tache.getDescription());
	    			tskTmp2.setMontant(0);
	    			tskTmp2.setType("etape");
	    			tskTmp2.setStatus(this.tache.getStatus());
	    			tskTmp2.setVisibilite(this.tache.getVisibilite());
	    			tacheDAO.saveOrUpdateTache(tskTmp2);
	    			tskTmp2.setOrdre(tskTmp2.getId().intValue());
		    		etapeTmp.setIdtache(tskTmp2.getId());
	    		}
	    		etapeTmp.setIdacte(this.etape.getIdacte());
	    		etapeTmp.setIdphase(this.tache.getIdphase());
	    		etapeTmp.setIdref(refEtapeTmp.get(i).getIdref());
	    		etapeTmp.setDelai(0);
	    		etapeTmp.setDuree(0);
	    		
	    		StringTokenizer st = new StringTokenizer(this.dentsList, ";");
	    		while (st.hasMoreTokens()) {
	    			etapeTmp.setDent(Integer.parseInt(st.nextToken()));
		    		etapeDAO.addActeDent3(etapeTmp);
	    		}
	    	}
	    }

		return list();
	}

	public String addActe(){
		phase.setId(this.phase.getId());
		System.out.println(this.etape.getDent());
		return SUCCESS;
	}

	public String acteToAdd(){
		phase.setId(this.phase.getId());
		populate();
		setCtList(userDAO.listObjet2("CONTRIBUTEUR' or profile = 'CONDUCTEUR' or profile='DIRECTEUR PROJET' or profile='full"));
		return SUCCESS;
	}

	public String etapesToUpdate(){
		listByTache2();
		return SUCCESS;
	}

	public String updateEtape(){
		Etape etapeTmp = etapeDAO.getEtape(this.etape.getId());
		if (this.etape.getNom() != null & this.etape.getNom() != "" ) etapeTmp.setNom(this.etape.getNom());
		if (this.etape.getDuree() > 0) etapeTmp.setDuree(this.etape.getDuree());
		if (this.etape.getDelai() > 0) etapeTmp.setDelai(this.etape.getDelai());
		if (this.etape.getDent() > 0) etapeTmp.setDent(this.etape.getDent());
		
		listByTache2();
		return SUCCESS;
	}

	public String updateEtapeDuree(){
		Etape etapeTmp = etapeDAO.getEtape(this.etape.getId());
		etapeTmp.setDuree(this.etape.getDuree());
		listByTache2();
		return SUCCESS;
	}

	public String updateEtapeDelai(){
		Etape etapeTmp = etapeDAO.getEtape(this.etape.getId());
		etapeTmp.setDelai(this.etape.getDelai());
		listByTache2();
		return SUCCESS;
	}

	public String updateEtapeDent(){
		Etape etapeTmp = etapeDAO.getEtape(this.etape.getId());
		etapeTmp.setDent(this.etape.getDent());
		listByTache2();
		return SUCCESS;
	}

	public String deleteEtape() {
		etapeDAO.deleteEtape(this.etape.getId());
		listByTache2();
		return SUCCESS;
	}

	public String delActeDent() {
		etapeDAO.delActeDent(etape);

		// Etape etapeTmp = etapeDAO.getEtape(etape.getId());
		System.out.println("Del Etape :  + etapeTmp.getActe()");
		return SUCCESS;
	}

	public String delActeDent2() {
		int count = etapeDAO.getCount("select distinct idtache from Etape where idacte= "+ this.etape.getIdacte() +" and idphase= " + this.etape.getIdphase() + " and dent= " + this.etape.getDent() + " ");
		tacheDAO.delete((long) count);
		etapeDAO.delActeDent(etape);

		return SUCCESS;
	}

	public String delActeDent3() {
		tacheDAO.delete2(this.etape.getIdacte(), this.etape.getIdphase(), this.etape.getDent());
		etapeDAO.delActeDent(etape);
		
		return SUCCESS;
	}

	public String taskGroup() {
		StringTokenizer st = new StringTokenizer(this.tachesList, ";");
		Long idtachelast = (long) Integer.parseInt(st.nextToken());
		while (st.hasMoreTokens()) {
			Long idtachetodelete = (long) Integer.parseInt(st.nextToken());
			etapeDAO.taskGroup(idtachetodelete, idtachelast);
			tacheDAO.delete(idtachetodelete);
		}
		tache.setIdphase(this.phase.getId());
		Long idtacheRef = idtachelast;
		System.out.println("tache ID Ref : "+ idtachelast);
		
		/*
		//On récupère la liste des séances à regrouper dans le format : 272, 312
		String listeTaches = (this.tachesList.replaceAll(";", ",")).substring(0, this.tachesList.length()-1);
		System.out.println("listeTaches : "+listeTaches);*/
		
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);
		
		//On récupére les ratios individuels du praticien connecté pour calculer les durées des étapes de traitement à regrouper
		int group_by_mm_dent_1 = 100 - etapeDAO.getKPIPraticien("select o.description from Objet o, User u where o.idresponsable=u.id and u.login= '"+ usersession.getName() +"' and o.nom='group_by_mm_dent_1'");
		int group_by_mm_dent_2 =  100 -etapeDAO.getKPIPraticien("select o.description from Objet o, User u where o.idresponsable=u.id and u.login= '"+ usersession.getName() +"' and o.nom='group_by_mm_dent_2'");
		int group_by_mm_secteur_1 =  100 -etapeDAO.getKPIPraticien("select o.description from Objet o, User u where o.idresponsable=u.id and u.login= '"+ usersession.getName() +"' and o.nom='group_by_mm_secteur_1'");
		int group_by_mm_secteur_2 =  100 -etapeDAO.getKPIPraticien("select o.description from Objet o, User u where o.idresponsable=u.id and u.login= '"+ usersession.getName() +"' and o.nom='group_by_mm_secteur_2'");
		int group_by_mm_acte_1 = 100 - etapeDAO.getKPIPraticien("select o.description from Objet o, User u where o.idresponsable=u.id and u.login= '"+ usersession.getName() +"' and o.nom='group_by_mm_acte_1'");
		int group_by_mm_acte_2 = 100 - etapeDAO.getKPIPraticien("select o.description from Objet o, User u where o.idresponsable=u.id and u.login= '"+ usersession.getName() +"' and o.nom='group_by_mm_acte_2'");
		int group_by_others_1 = 100 - etapeDAO.getKPIPraticien("select o.description from Objet o, User u where o.idresponsable=u.id and u.login= '"+ usersession.getName() +"' and o.nom='group_by_others_1'");
		int group_by_others_2 = 100 - etapeDAO.getKPIPraticien("select o.description from Objet o, User u where o.idresponsable=u.id and u.login= '"+ usersession.getName() +"' and o.nom='group_by_others_2'");

		
		//On récupère l'étape de traitement dont la durée est la plus longue pour s'en servir comme étape de référence 
		//et calculer les durées des étapes traitement qui vont s'ajouter à celle là
		List<Etape> etapeListTmp2 = etapeDAO.getEtapeDureeMax(idtacheRef);
		int dentRef = etapeListTmp2.get(0).getDent();
		int idacteRef = etapeListTmp2.get(0).getIdacte();
		
		// 1 - On regroupe d'abord les étapes de traitement qui ont : la même dent mais un acte différent
		//On récupére parmi les séances séléctionnées la liste des étapes de traitement = meme dent mais idacte différent
		List<Etape> etapeListTmp = etapeDAO.taskGroupdiffActememeDent(idtacheRef, idacteRef, dentRef);
		Boolean memeSeance = true;
	    for(int i = 0; i < etapeListTmp.size(); i++){
	    	Etape etapeTmp = etapeDAO.getEtape(etapeListTmp.get(i).getId());
			if (i == 0){
				//S'il s'agit de la première étape de traitement on applique un ratio particulier
				etapeTmp.setDuree(etapeListTmp.get(i).getDuree()*group_by_mm_dent_1/100);
			}else{
				if((etapeListTmp.get(i-1).getIdtache() == etapeListTmp.get(i).getIdtache()) && (memeSeance)){
					//Si les étapes de traitement suivantes concernent la même séance on applique le même ratio
					etapeTmp.setDuree(etapeListTmp.get(i).getDuree()*group_by_mm_dent_1/100);
				}else{
					//Pour les étapes de traitements suivantes correspondant à des séances distinctes on applique le deuxième ratio
					memeSeance = false;
					etapeTmp.setDuree(etapeListTmp.get(i).getDuree()*group_by_mm_dent_2/100);
				}
			}
	    }
		
		// 2 - On regroupe les étapes de traitement qui ont : même acte mais sur des dents différentes
		//On récupére parmi les séances séléctionnées la liste des étapes de traitement = meme acte mais dent différent
		etapeListTmp = etapeDAO.taskGroupmemeActediffDent(idtacheRef, idacteRef, dentRef);
		memeSeance = true;
	    for(int i = 0; i < etapeListTmp.size(); i++){
	    	Etape etapeTmp = etapeDAO.getEtape(etapeListTmp.get(i).getId());
			if (i == 0){
				//S'il s'agit de la première étape de traitement on applique un ratio particulier
				etapeTmp.setDuree(etapeListTmp.get(i).getDuree()*group_by_mm_acte_1/100);
			}else{
				if((etapeListTmp.get(i-1).getIdtache() == etapeListTmp.get(i).getIdtache()) && (memeSeance)){
					//Si les étapes de traitement suivantes concernent la même séance on applique le même ratio
					etapeTmp.setDuree(etapeListTmp.get(i).getDuree()*group_by_mm_acte_1/100);
				}else{
					//Pour les étapes de traitements suivantes correspondant à des séances distinctes on applique le deuxième ratio
					memeSeance = false;
					etapeTmp.setDuree(etapeListTmp.get(i).getDuree()*group_by_mm_acte_2/100);
				}
			}
	    }
		
		// 3 - On regroupe les étapes de traitement qui ont : même secteur mais sur des dents et des actes différents
		//On récupére parmi les séances séléctionnées la liste des étapes de traitement = meme secteur mais acte et dent différent
		etapeListTmp = etapeDAO.taskGroupmemeSecteurdiffActeDent(idtacheRef, idacteRef, dentRef);
		memeSeance = true;
	    for(int i = 0; i < etapeListTmp.size(); i++){
	    	Etape etapeTmp = etapeDAO.getEtape(etapeListTmp.get(i).getId());
			if (i == 0){
				//S'il s'agit de la première étape de traitement on applique un ratio particulier
				etapeTmp.setDuree(etapeListTmp.get(i).getDuree()*group_by_mm_secteur_1/100);
			}else{
				if((etapeListTmp.get(i-1).getIdtache() == etapeListTmp.get(i).getIdtache()) && (memeSeance)){
					//Si les étapes de traitement suivantes concernent la même séance on applique le même ratio
					etapeTmp.setDuree(etapeListTmp.get(i).getDuree()*group_by_mm_secteur_1/100);
				}else{
					//Pour les étapes de traitements suivantes correspondant à des séances distinctes on applique le deuxième ratio
					memeSeance = false;
					etapeTmp.setDuree(etapeListTmp.get(i).getDuree()*group_by_mm_secteur_2/100);
				}
			}
	    }
		
		// 4 - On regroupe les étapes de traitement qui ont : un secteur différent
		//On récupére parmi les séances séléctionnées la liste des étapes de traitement = secteur différent
		etapeListTmp = etapeDAO.taskGroupdiffSecteur(idtacheRef, idacteRef, dentRef);
		memeSeance = true;
	    for(int i = 0; i < etapeListTmp.size(); i++){
	    	Etape etapeTmp = etapeDAO.getEtape(etapeListTmp.get(i).getId());
			if (i == 0){
				//S'il s'agit de la première étape de traitement on applique un ratio particulier
				etapeTmp.setDuree(etapeListTmp.get(i).getDuree()*group_by_others_1/100);
			}else{
				if((etapeListTmp.get(i-1).getIdtache() == etapeListTmp.get(i).getIdtache()) && (memeSeance)){
					//Si les étapes de traitement suivantes concernent la même séance on applique le même ratio
					etapeTmp.setDuree(etapeListTmp.get(i).getDuree()*group_by_others_1/100);
				}else{
					//Pour les étapes de traitements suivantes correspondant à des séances distinctes on applique le deuxième ratio
					memeSeance = false;
					etapeTmp.setDuree(etapeListTmp.get(i).getDuree()*group_by_others_2/100);
				}
			}
	    }
	
		etapeList = etapeDAO.listEtape(this.phase.getId());
		tache.setIdphase(this.phase.getId());
		return SUCCESS;
	}

	public String list() {

		if (phase.getId() != null) {
			etapeList = etapeDAO.listEtape(phase.getId());
			phase = phaseDAO.getPhase(phase.getId()); // .listPhase(" where id="
														// + datain).get(0);
		}

		return SUCCESS;
	}

	public String listByTache() {

		if (tache.getId() != null) {
			
			int count = etapeDAO.getCount("select count(*) from Etape where idtache= "+ tache.getId() +" ");

			if (count > 0) {		
				etapeList = etapeDAO.listEtapeByTache(tache.getId());
			}else{
				etapeList = null;
			}
			tache = tacheDAO.getTache(tache.getId()); // .listPhase(" where id="
		}

		return SUCCESS;
	}

	public String listByTache2() {

		if (tache.getId() != null) {
			
			int count = etapeDAO.getCount("select count(*) from Etape where idtache= "+ tache.getId() +" ");

			if (count > 0) {		
				etapeList = etapeDAO.listEtapesByTache(tache.getId());
			}else{
				etapeList = null;
			}
			tache = tacheDAO.getTache(tache.getId()); // .listPhase(" where id="
		}

		return SUCCESS;
	}

	public String dentsListByTache() {

		if (tache.getId() != null) {
			etapeList = etapeDAO.listDentsByTache(tache.getId());
			tache = tacheDAO.getTache(tache.getId()); // .listPhase(" where id="
														// + datain).get(0);
		}
		return SUCCESS;
	}

	public String getDureeByTache() {

		if (tache.getId() != null) {
			int count = etapeDAO.getCount("select count(*) from Etape where idtache= "+ tache.getId() +" ");

			if (count > 0) {		
				dureeTache = etapeDAO.getSum("select sum(duree) from Etape e where e.idtache="+ tache.getId());
			}else{
				dureeTache = 0;
			}
			return SUCCESS;
		}else{
			return SUCCESS;
		}
	}

	public String getDelaiByTache() {

		if (tache.getId() != null) {
			int count = etapeDAO.getCount("select count(*) from Etape where idtache= "+ tache.getId() +" ");

			if (count > 0) {		
				delaiTache = etapeDAO.getSum("select sum(delai) from Etape e where e.idtache="+ tache.getId());
			}else{
				dureeTache = 0;
			}
			return SUCCESS;
		}else{
			return SUCCESS;
		}
	}

	
	/************** KPI pour la partie Dashboard  ***************/
	public String Kpis_dentiste(){
		return SUCCESS;
	}

	@SuppressWarnings("unused")
	public String KpiHPJournee(){
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);
		String defaultProcessRef = (String) session.get("DFAULTREFPROCESS");

		//tacheList = tacheDAO.listTacheTdbByDate(usersession.getName(),(long)Integer.parseInt(defaultProcessRef), lateToday);

		int count = etapeDAO.getCount("select count(*) from Etape where idtache= "+ tache.getId() +" ");

		if (count > 0) {		
			setKpiHPJournee("");
		}else{
			setKpiHPJournee("");
		}
		
		return SUCCESS;
	}
	
	public String KpiDureePlanTTT(){
		Long duree = (Long) etapeDAO.getSum2("select sum(e.duree) from Etape e, Tache t, Phase ph, Process p where p.id="+ this.phase.getIdprocess()+" and p.id = ph.idprocess and ph.id = t.idphase and t.id = e.idtache ");

		if (duree > 0) {		
			KpiDureePlanTTT = duree;
		}else{
			KpiDureePlanTTT = (long) 0;
		}

		
		return SUCCESS;
	}

	public String KpiHonoProgPatient(){
		int duree = (etapeDAO.getSum2("select sum(e.duree) from Etape e, Tache t, Phase ph, Process p where p.id="+ this.phase.getIdprocess()+" and p.id = ph.idprocess and ph.id = t.idphase and t.id = e.idtache ")).intValue();
		String devis = etapeDAO.getSum3("select c.value from Champs c where c.idprocess="+ this.phase.getIdprocess()+" and c.nom='Montant devis' ");
		if(devis == null || devis == "") {
			devis = "0";
		}//double c = (a * 1.0/b)*100.0;
		if (duree > 0) {	
			KpiHonoProgPatient = Integer.parseInt(devis);
			if (KpiHonoProgPatient > 0){
				KpiHonoProgPatient = (int) (KpiHonoProgPatient / (duree / 60.0)) ;
			}else{
				KpiHonoProgPatient = 0;
			}
		}else{
			KpiHonoProgPatient = 0;
		}
		return SUCCESS;
	}
	
	public String KpiHonoProgJournee(){
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);
		String defaultProcessRef = (String) session.get("DFAULTREFPROCESS");

	    SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy 00:00:00");
	    Date bornemin = tache.getDstartprev();
	    Date bornemax = new Date();
	 
	    Calendar c = Calendar.getInstance(); 
	    c.setTime(tache.getDstartprev());
	    int year = c.get(Calendar.YEAR);
	    int month = c.get(Calendar.MONTH) + 1;
	    int day = c.get(Calendar.DAY_OF_MONTH) + 1;
	    
	    try {
		    bornemax = ft.parse(day + "/" + month + "/" + year + " 00:00:00");
		} catch (ParseException e) {
	          System.out.println("Unparseable using " + ft); 
	          e.printStackTrace();
		}
	    System.out.println(bornemin+"-"+bornemax);
		setTacheList(tacheDAO.listTachesByDateLogin(usersession.getName(),(long)Integer.parseInt(defaultProcessRef), bornemin, bornemax));
		
		Long KpiHonoProgJourneeCumul = (long) 0;
		double dureeTacheTmp = 0;
		double KpiHonoProgPatientTmp = 0;
	    for(int i = 0; i < tacheList.size(); i++){
			 dureeTacheTmp = 0;
			 KpiHonoProgPatientTmp = 0;
	    	//Calcul du KpiHonoProgPatient de la tache en cours
				double dureeTTT = etapeDAO.getSum2("select sum(e.duree) from Etape e, Tache t, Phase ph, Process p where  p.id = ph.idprocess and ph.id = t.idphase and t.id = e.idtache and p.id= (select distinct p.id from Etape e, Tache t, Phase ph, Process p  where p.id = ph.idprocess and ph.id = t.idphase and t.id = e.idtache and t.id="+ tacheList.get(i).getId() +" )");
			String devisTTT = etapeDAO.getSum3("select c.value from Champs c, Tache t, Phase ph, Process p where c.idprocess = p.id and p.id = ph.idprocess and ph.id = t.idphase and t.id = "+ tacheList.get(i).getId() +" and c.nom='Montant devis' ");
			if(devisTTT == null || devisTTT == "") devisTTT = "0";
			if (dureeTTT > 0) {		
				KpiHonoProgPatientTmp = Integer.parseInt(devisTTT);
				if (KpiHonoProgPatientTmp > 0){
					dureeTTT = (double)(dureeTTT / 60.0);
					KpiHonoProgPatientTmp = (double) KpiHonoProgPatientTmp / dureeTTT;
				}else{
					KpiHonoProgPatientTmp = 0;
				}
			}else{
				KpiHonoProgPatientTmp = 0;
			}
			//Calcul de la durée de la tache en cours
			int count = etapeDAO.getCount("select count(*) from Etape where idtache= "+ tacheList.get(i).getId() +" ");

			if (count > 0) {		
				dureeTacheTmp = etapeDAO.getSum("select sum(duree) from Etape e where e.idtache="+ tacheList.get(i).getId());
				dureeTacheTmp = (double)(dureeTacheTmp / 60.0);
			}else{
				dureeTacheTmp = 0;
			}
			//Ajout de l'HP en cours à la variable de cumul
			KpiHonoProgJourneeCumul = (long) (KpiHonoProgJourneeCumul + ( Math.round(dureeTacheTmp * KpiHonoProgPatientTmp)));
	    }  	
	    KpiHonoProgJournee = KpiHonoProgJourneeCumul;
		return SUCCESS;
	}
	
	public String KpiHonoProg7NextDays(){
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);
		String defaultProcessRef = (String) session.get("DFAULTREFPROCESS");

	    SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy 00:00:00");
	    Date bornemin = tache.getDstartprev();
	    Date bornemax = new Date();
	 
	    Calendar c = Calendar.getInstance(); 
	    c.setTime(tache.getDstartprev());
	    c.add(Calendar.DAY_OF_YEAR, 8);
	    int year = c.get(Calendar.YEAR);
	    int month = c.get(Calendar.MONTH) + 1;
	    int day = c.get(Calendar.DAY_OF_MONTH) + 1;
	    try {
		    bornemax = ft.parse(day + "/" + month + "/" + year + " 00:00:00");
		} catch (ParseException e) {
	          System.out.println("Unparseable using " + ft); 
	          e.printStackTrace();
		}
	    System.out.println(bornemin+"-"+bornemax);
		setTacheList(tacheDAO.listTachesByDateLogin(usersession.getName(),(long)Integer.parseInt(defaultProcessRef), bornemin, bornemax));
		
		Long KpiHonoProgJourneeCumul = (long) 0;
		double dureeTacheTmp = 0;
		double KpiHonoProgPatientTmp = 0;
	    for(int i = 0; i < tacheList.size(); i++){
	    	//Calcul du KpiHonoProgPatient de la tache en cours
			double dureeTTT = etapeDAO.getSum2("select sum(e.duree) from Etape e, Tache t, Phase ph, Process p where  p.id = ph.idprocess and ph.id = t.idphase and t.id = e.idtache and p.id= (select distinct p.id from Etape e, Tache t, Phase ph, Process p  where p.id = ph.idprocess and ph.id = t.idphase and t.id = e.idtache and t.id="+ tacheList.get(i).getId() +" )");
			String devisTTT = etapeDAO.getSum3("select c.value from Champs c, Tache t, Phase ph, Process p where c.idprocess = p.id and p.id = ph.idprocess and ph.id = t.idphase and t.id = "+ tacheList.get(i).getId() +" and c.nom='Montant devis' ");
			if(devisTTT == null || devisTTT == "") devisTTT = "0";
			if (dureeTTT > 0) {		
				KpiHonoProgPatientTmp = Integer.parseInt(devisTTT);
				if (KpiHonoProgPatientTmp > 0){
					dureeTTT = (double)(dureeTTT / 60.0);
					KpiHonoProgPatientTmp = (double) KpiHonoProgPatientTmp / dureeTTT;
				}else{
					KpiHonoProgPatientTmp = 0;
				}
			}else{
				KpiHonoProgPatientTmp = 0;
			}
			//Calcul de la durée de la tache en cours
			int count = etapeDAO.getCount("select count(*) from Etape where idtache= "+ tacheList.get(i).getId() +" ");

			if (count > 0) {		
				dureeTacheTmp = etapeDAO.getSum("select sum(e.duree) from Etape e where e.idtache="+ tacheList.get(i).getId());
				dureeTacheTmp = (double)(dureeTacheTmp / 60.0);
			}else{
				dureeTacheTmp = 0;
			}
			//Ajout de l'HP en cours à la variable de cumul
			KpiHonoProgJourneeCumul = (long) (KpiHonoProgJourneeCumul + Math.round((dureeTacheTmp * KpiHonoProgPatientTmp)));
	    }  	
	    KpiHonoProg7NextDays = KpiHonoProgJourneeCumul;

		return SUCCESS;
	}
	
	public String KpiHonoProg7PreviousDays(){
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);
		String defaultProcessRef = (String) session.get("DFAULTREFPROCESS");

	    SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy 00:00:00");
	    Date bornemax = tache.getDstartprev();
	    Date bornemin = new Date();
	 
	    Calendar c = Calendar.getInstance(); 
	    c.setTime(tache.getDstartprev());
	    c.add(Calendar.DAY_OF_YEAR, -8);
	    int year = c.get(Calendar.YEAR);
	    int month = c.get(Calendar.MONTH) + 1;
	    int day = c.get(Calendar.DAY_OF_MONTH) + 1;
	    try {
	    	bornemin = ft.parse(day + "/" + month + "/" + year + " 00:00:00");
		} catch (ParseException e) {
	          System.out.println("Unparseable using " + ft); 
	          e.printStackTrace();
		}
	    System.out.println(bornemin+"-"+bornemax);
		setTacheList(tacheDAO.listTachesByDateLogin(usersession.getName(),(long)Integer.parseInt(defaultProcessRef), bornemin, bornemax));
		
		Long KpiHonoProgJourneeCumul = (long) 0;
		double KpiHonoProgPatientTmp = 0;
		double dureeTacheTmp = 0;
		String devisTTT;
	    for(int i = 0; i < tacheList.size(); i++){
	    	//Calcul du KpiHonoProgPatient de la tache en cours
			double dureeTTT = etapeDAO.getSum2("select sum(e.duree) from Etape e, Tache t, Phase ph, Process p where  p.id = ph.idprocess and ph.id = t.idphase and t.id = e.idtache and p.id= (select distinct p.id from Etape e, Tache t, Phase ph, Process p  where p.id = ph.idprocess and ph.id = t.idphase and t.id = e.idtache and t.id="+ tacheList.get(i).getId() +" )");
			devisTTT =  etapeDAO.getSum3("select c.value from Champs c, Tache t, Phase ph, Process p where c.idprocess = p.id and p.id = ph.idprocess and ph.id = t.idphase and t.id = "+ tacheList.get(i).getId() +" and c.nom='Montant devis' ");
			if(devisTTT == null || devisTTT == "") devisTTT = "0";
			if (dureeTTT > 0) {		
				KpiHonoProgPatientTmp = Integer.parseInt(devisTTT);
				if (KpiHonoProgPatientTmp > 0){
					dureeTTT = (double)(dureeTTT / 60.0);
					KpiHonoProgPatientTmp = (double) KpiHonoProgPatientTmp / dureeTTT;
				}else{
					KpiHonoProgPatientTmp = 0;
				}
			}else{
				KpiHonoProgPatientTmp = 0;
			}
			//Calcul de la durée de la tache en cours
			int count = etapeDAO.getCount("select count(*) from Etape where idtache= "+ tacheList.get(i).getId() +" ");

			if (count > 0) {		
				dureeTacheTmp = etapeDAO.getSum("select sum(duree) from Etape e where e.idtache="+ tacheList.get(i).getId());
				dureeTacheTmp = (double)(dureeTacheTmp / 60.0);
			}else{
				dureeTacheTmp = 0;
			}
			//Ajout de l'HP en cours à la variable de cumul
			KpiHonoProgJourneeCumul = (long) (KpiHonoProgJourneeCumul + Math.round((dureeTacheTmp * KpiHonoProgPatientTmp)));
	    }  	
	    KpiHonoProg7PreviousDays = KpiHonoProgJourneeCumul;

		return SUCCESS;
	}
	
	public String KpiCAProdTache(){
		int dureeTacheTmp = 0;
		int KpiHonoProgPatientTmp = 0;
		Long duree = (Long) etapeDAO.getSum2("select sum(e.duree) from Etape e, Tache t, Phase ph, Process p where p.id="+ this.phase.getIdprocess()+" and p.id = ph.idprocess and ph.id = t.idphase and t.id = e.idtache ");
		String devis = etapeDAO.getSum3("select c.value from Champs c where c.idprocess="+ this.phase.getIdprocess()+" and c.nom='Montant devis' ");
		if(devis == null || devis == "") devis = "0";

		int count = etapeDAO.getCount("select count(*) from Etape where idtache= "+ tache.getId() +" ");

		if (count > 0) {		
			dureeTacheTmp = etapeDAO.getSum("select sum(duree) from Etape e where e.idtache="+ tache.getId());
		}else{
			dureeTacheTmp = 0;
		}

		if (duree > 0) {		
			KpiHonoProgPatientTmp = Integer.parseInt(devis);
			if (KpiHonoProgPatientTmp > 0){
				KpiHonoProgPatientTmp = (int) (KpiHonoProgPatientTmp / (duree / 60.0));
			}else{
				KpiHonoProgPatientTmp = 0;
			}
		}else{
			KpiHonoProgPatientTmp = 0;
		}
		CAProdTache = (long) (KpiHonoProgPatientTmp * (dureeTacheTmp / 60.0));
		return SUCCESS;
	}
	
	
	public Etape getEtape() {
		return etape;
	}

	public void setEtape(Etape etape) {
		this.etape = etape;
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

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public List<Objet> getActesunitList() {
		return actesunitList;
	}

	public void setActesunitList(List<Objet> actesunitList) {
		this.actesunitList = actesunitList;
	}

	public List<Objet> getActesallList() {
		return actesallList;
	}

	public void setActesallList(List<Objet> actesallList) {
		this.actesallList = actesallList;
	}

	public List<Etape> getFamilleList() {
		return familleList;
	}

	public void setFamilleList(List<Etape> familleList) {
		this.familleList = familleList;
	}

	public List<User> getCtList() {
		return ctList;
	}

	public void setCtList(List<User> ctList) {
		this.ctList = ctList;
	}

	public List<Tache> getTacheList() {
		return tacheList;
	}

	public void setTacheList(List<Tache> tacheList) {
		this.tacheList = tacheList;
	}

	public Tache getTache() {
		return tache;
	}

	public void setTache(Tache tache) {
		this.tache = tache;
	}

	public int getDureeTache() {
		return dureeTache;
	}

	public void setDureeTache(int dureeTache) {
		this.dureeTache = dureeTache;
	}

	public int getDelaiTache() {
		return delaiTache;
	}

	public void setDelaiTache(int delaiTache) {
		this.delaiTache = delaiTache;
	}

	public String getDentsList() {
		return dentsList;
	}

	public void setDentsList(String dentsList) {
		this.dentsList = dentsList;
	}

	public String getTachesList() {
		return tachesList;
	}

	public void setTachesList(String tachesList) {
		this.tachesList = tachesList;
	}

	public Long getKpiDureePlanTTT() {
		return KpiDureePlanTTT;
	}

	public void setKpiDureePlanTTT(Long kpiDureePlanTTT) {
		KpiDureePlanTTT = kpiDureePlanTTT;
	}

	public String getKpiHPJournee() {
		return KpiHPJournee;
	}

	public void setKpiHPJournee(String kpiHPJournee) {
		KpiHPJournee = kpiHPJournee;
	}

	public int getKpiHonoProgPatient() {
		return KpiHonoProgPatient;
	}

	public void setKpiHonoProgPatient(int kpiHonoProgPatient) {
		KpiHonoProgPatient = kpiHonoProgPatient;
	}

	public Long getCAProdTache() {
		return CAProdTache;
	}

	public void setCAProdTache(Long cAProdTache) {
		CAProdTache = cAProdTache;
	}

	public Long getKpiHonoProgJournee() {
		return KpiHonoProgJournee;
	}

	public void setKpiHonoProgJournee(Long kpiHonoProgJournee) {
		KpiHonoProgJournee = kpiHonoProgJournee;
	}

	public Long getKpiHonoProg7NextDays() {
		return KpiHonoProg7NextDays;
	}

	public void setKpiHonoProg7NextDays(Long kpiHonoProg7NextDays) {
		KpiHonoProg7NextDays = kpiHonoProg7NextDays;
	}

	public Long getKpiHonoProg7PreviousDays() {
		return KpiHonoProg7PreviousDays;
	}

	public void setKpiHonoProg7PreviousDays(Long kpiHonoProg7PreviousDays) {
		KpiHonoProg7PreviousDays = kpiHonoProg7PreviousDays;
	}

}
