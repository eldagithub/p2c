package com.p2c.obj.control;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.struts2.dispatcher.SessionMap;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.p2c.obj.back.TacheDAO;
import com.p2c.obj.back.UserDAO;
import com.p2c.obj.model.Tache;
import com.p2c.obj.model.User;

import com.p2c.obj.back.PhaseDAO;
import com.p2c.obj.model.Phase;

import com.p2c.obj.back.ProcessDAO;
import com.p2c.obj.model.Process;
import com.p2c.obj.back.P2cDAO;

import com.p2c.obj.model.PrjPhaTsk;
import com.p2c.session.AuthenticationInterceptor;
import com.p2c.session.UserSession;



public class TacheAction extends ActionSupport implements ModelDriven<Tache> {


	/**
	 * 
	 */
	private static final long serialVersionUID = 262106723964577392L;
	private Tache tache = new Tache();
	private List<Tache> tacheList = new ArrayList<Tache>();
	private TacheDAO tacheDAO = new TacheDAO();

	private Phase phase = new Phase();
	private PhaseDAO phaseDAO = new PhaseDAO();
	private P2cDAO p2cDao = new P2cDAO();

	private ProcessDAO processDAO = new ProcessDAO();

	private UserDAO userDAO = new UserDAO();
	private List<User> ctList = new ArrayList<User>();

	private List<PrjPhaTsk> pptList = new ArrayList<PrjPhaTsk>();
	
	private String order; 
	private String ordBy; 

	@Override
	public Tache getModel() {
		return tache;
	}
	
	public String populate()
	{
		this.tache = tacheDAO.getTache(this.tache.getId());

		return SUCCESS;
	}

	public String add()
	{
		tacheDAO.saveTache(tache);

		Tache tskTmp = tacheDAO.getTache(this.tache.getId());
		tskTmp.setOrdre(this.tache.getId().intValue());
		tskTmp.setIdref(this.tache.getIdref());

		Phase phaseTmp = phaseDAO.getPhase(tskTmp.getIdphase());
		Process processTmp = processDAO.getProcess(phaseTmp.getIdprocess());

		String coment = "La tache  <b>"+ tskTmp.getNom()  + "</b> a été ajoutée";
		p2cDao.addLog(processTmp, coment);

		
		return SUCCESS;
	}
	
	public String list()
	{

		if (ordBy == null) ordBy = ""; //" sum(e.duree) desc  "
		if (phase.getId() != null ){
			tacheList = tacheDAO.listTache(phase.getId(), ordBy);
			phase = phaseDAO.getPhase(phase.getId()); //.listPhase(" where id=" + datain).get(0);			
		} 
		
		return SUCCESS;
	}

	public String taskListReader()
	{


		if (phase.getIdprocess() != null ){
			tacheList = tacheDAO.listReaderTache(phase.getIdprocess());
		} 
		
		return SUCCESS;
	}

	public String listTdbByDate(String lateToday)
	{
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);
		String defaultProcessRef = (String) session.get("DFAULTREFPROCESS");



		tacheList = tacheDAO.listTacheTdbByDate(usersession.getName(),(long)Integer.parseInt(defaultProcessRef), lateToday);
		
		for (int i=0; i<tacheList.size(); i++){
			
			Tache tsktmp = tacheList.get(i);
			Phase phatmp = phaseDAO.getPhase(tsktmp.getIdphase());
			Process prjtmp = processDAO.getProcess(phatmp.getIdprocess());
			
			pptList.add(new PrjPhaTsk(tsktmp, phatmp, prjtmp));
			
		}


		return SUCCESS;
	}

	public String listTdbByDateLate()
	{
		return listTdbByDate("late");
	}
	
	public String listTdbByDateToday()
	{
		return listTdbByDate("today");
	}
	
	public String listTdbByDateFuture()
	{
		return listTdbByDate("future");
	}
	
	public String update()
	{
		Tache tskTmp = tacheDAO.getTache(tache.getId());
		String coment = "";//Modification de la tache N¡:" + tskTmp.getId() + ", <b>"+ tskTmp.getNom()  + "</b>"; 
		
		if (tache.getNom() != null & tache.getNom() != "" ) tskTmp.setNom(tache.getNom());
		if (tache.getDescription() != null & tache.getDescription() != "" ) tskTmp.setDescription(tache.getDescription());
		if (tache.getStatus() != null & tache.getStatus() != "" ) {
			String statusAvant = tskTmp.getStatus();
			String statusApres = tache.getStatus();
			
			tskTmp.setStatus(tache.getStatus());
			
			if( tskTmp.getDstart() == null) tskTmp.setDstart( new Date(System.currentTimeMillis())  );

			if (tache.getStatus().equals("completed")) 	tskTmp.setDfin(  new Date(System.currentTimeMillis()) );
			else 	tskTmp.setDfin(null);


			Phase phaseTmp = phaseDAO.getPhase(tskTmp.getIdphase());
			Process prjTmp = processDAO.getProcess(phaseTmp.getIdprocess());
			if (phaseTmp.getStatus().equals("in_progress_init") ) {
				phaseTmp.setStatus("in_progress");
				phaseTmp.setDstart( new Date(System.currentTimeMillis()) );
			}

			if(statusApres.equals("blocked") && !statusAvant.equals("blocked")) {
				phaseTmp.setStatus("blocked");
				prjTmp.setStatus("blocked");
				processDAO.saveProcess(prjTmp);
				coment = "La tache  <b>"+ tskTmp.getNom()  + "</b> a été bloquée";
			} else if(!statusApres.equals("blocked") && statusAvant.equals("blocked")) {
				
				int count = p2cDao.getCount("select count(*) from Tache t where t.idphase=" + tskTmp.getIdphase() + " and t.status='blocked' ");
				if (count == 0 ) {
					phaseTmp.setStatus("in_progress");
					prjTmp.setStatus("in_progress");
					processDAO.saveProcess(prjTmp);
				}
				coment = "La tache  <b>"+ tskTmp.getNom()  + "</b> a été débloquée";

			}
			
			if(statusApres.equals("completed") ) coment = "La tache  <b>"+ tskTmp.getNom()  + "</b> est achevée";
			else if(statusAvant.equals("completed") && !statusApres.equals("completed")) coment = "La tache  <b>"+ tskTmp.getNom()  + "</b> a été relancée";

		}
			

		if (tache.getIdresponsable() != null ) tskTmp.setIdresponsable(tache.getIdresponsable());
		if (tache.getDstartprev() != null ){ 
	        /*Calendar calendar = Calendar.getInstance();
	        calendar.setTime(tache.getDstartprev());
	        calendar.set(Calendar.MINUTE, 0);
	        calendar.set(Calendar.HOUR, 9);*/
		    Calendar calendar = Calendar.getInstance(); 
		    calendar.setTime(tache.getDstartprev());

		    System.out.println(calendar.getTime()+"calendar.getTime()");
		    tskTmp.setDstartprev(calendar.getTime());
		}
		if (tache.getDfin() != null ) tskTmp.setDfin(tache.getDfin());
		if (tache.getDfinprev() != null ) tskTmp.setDfinprev(tache.getDfinprev());
		if (tache.getVisibilite() != null & tache.getVisibilite() != "" ) tskTmp.setVisibilite(tache.getVisibilite());
		if (tache.getType() != null & tache.getType() != "" ) tskTmp.setType(tache.getType());
		
		Phase phaseTmp = phaseDAO.getPhase(tskTmp.getIdphase());
		Process processTmp = processDAO.getProcess(phaseTmp.getIdprocess());
		this.phase.setIdprocess(phaseTmp.getIdprocess());

		if (!coment.equals("")){
			p2cDao.addLog(processTmp, coment);				
		}

		
		return SUCCESS;
		
	}
	
	public String updateMontant()
	{
		Tache tskTmp = tacheDAO.getTache(tache.getId());
		String coment = "";//Modification de la tache N¡:" + tskTmp.getId() + ", <b>"+ tskTmp.getNom()  + "</b>"; 
		
		if (tache.getMontant() >= 0) tskTmp.setMontant(tache.getMontant());
		
		Phase phaseTmp = phaseDAO.getPhase(tskTmp.getIdphase());
		Process processTmp = processDAO.getProcess(phaseTmp.getIdprocess());
		this.phase.setIdprocess(phaseTmp.getIdprocess());

		if (!coment.equals("")){
			p2cDao.addLog(processTmp, coment);				
		}

		
		return SUCCESS;
		
	}
	
	public String listEntenteFin3()
	{
		tacheList = tacheDAO.listTacheByProcess(this.phase.getIdprocess());		
		for (int i=0; i<tacheList.size(); i++){
			
			Tache tsktmp = tacheList.get(i);
			Phase phatmp = phaseDAO.getPhase(tsktmp.getIdphase());
			Process prjtmp = processDAO.getProcess(phatmp.getIdprocess());
			
			pptList.add(new PrjPhaTsk(tsktmp, phatmp, prjtmp));
			
		}
		return SUCCESS;
		
	}
	
	

	public String toAdd()
	{
		setCtList(userDAO.listObjet2("CONTRIBUTEUR' or profile = 'CONDUCTEUR' or profile='DIRECTEUR PROJET' or profile='full"));
		return SUCCESS;
	}

	public String toUpdate()
	{
		this.tache = tacheDAO.getTache(tache.getId());

		setCtList(userDAO.listObjet2("CONTRIBUTEUR' or profile = 'CONDUCTEUR' or profile='DIRECTEUR PROJET' or profile='full"));
		return SUCCESS;
	}

	public String toUpdateFull()
	{
		this.tache = tacheDAO.getTacheFull(tache.getId());
		return SUCCESS;
	}
/*	
	public String updateStatus()
	{

		Tache tskTmp = tacheDAO.getTache(tache.getId());
		tskTmp.setStatus(tache.getStatus());
		
		
		if(tache.getStatus().equals("completed") ){
			tskTmp.setDfin( new Date(System.currentTimeMillis()) );

			
		} else {
			tskTmp.setDfin( null );
			if(tache.getStatus().equals("in_progress") ) tskTmp.setDstart( new Date(System.currentTimeMillis())  );
			if(tache.getStatus().equals("to_be_started") ) tskTmp.setDstart( null );
		}
		//tacheList = tacheDAO.listTache(" where phase_id=" + datain);
		//this.datain = tache.getId().toString();
		//	tacheDAO.saveTache(tskTmp);
		//return SUCCESS;
		return this.list();

	}
*/
	public String taskOrder()
	{
		String[] parts = order.split(":");
		
		for (int i=1; i<parts.length; i++){
			
			Tache tskTmp = tacheDAO.getTache( Long.parseLong(parts[i]));
			tskTmp.setOrdre(i);
		} 
			
		
		
		
		if (phase.getId() != null ){
			tacheList = tacheDAO.listTache(phase.getId(), "");
			phase = phaseDAO.getPhase(phase.getId()); //.listPhase(" where id=" + datain).get(0);
			
		} 
		
		return SUCCESS;

	}

	public String delete()
	{
		Tache tskTmp = tacheDAO.getTache(this.tache.getId());
		this.tache.setIdphase(tskTmp.getIdphase());
		Phase phaseTmp = phaseDAO.getPhase(tskTmp.getIdphase());
		Process processTmp = processDAO.getProcess(phaseTmp.getIdprocess());
		
		String coment = "La tache  <b>"+ tskTmp.getNom()  + "</b> a été supprimée";
		
		tacheDAO.delete(this.tache.getId());
		p2cDao.addLog(processTmp, coment);

		return SUCCESS;
	}
	
	public String delete(Long id)
	{
		tacheDAO.delete(this.tache.getId());

		return SUCCESS;
	}
	
	public Tache getTache() {
		return tache;
	}

	public void setTache(Tache tache) {
		this.tache = tache;
	}

	public List<Tache> getTacheList() {
		return tacheList;
	}

	public void setTacheList(List<Tache> tacheList) {
		this.tacheList = tacheList;
	}

	public Phase getPhase() {
		return phase;
	}

	public void setPhase(Phase phase) {
		this.phase = phase;
	}

	public List<User> getCtList() {
		return ctList;
	}

	public void setCtList(List<User> ctList) {
		this.ctList = ctList;
	}

	public List<PrjPhaTsk> getPptList() {
		return pptList;
	}

	public void setPptList(List<PrjPhaTsk> pptList) {
		this.pptList = pptList;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getOrdBy() {
		return ordBy;
	}

	public void setOrdBy(String ordBy) {
		this.ordBy = ordBy;
	}
}
