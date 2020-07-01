package com.p2c.obj.control;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.p2c.obj.back.ProcessDAO;
import com.p2c.obj.back.PhaseDAO;
import com.p2c.obj.back.P2cDAO;

import com.p2c.obj.model.Phase;
import com.p2c.obj.model.Process;

public class PhaseAction extends ActionSupport implements ModelDriven<Phase> {


	/**
	 * 
	 */
	private static final long serialVersionUID = 262106796964577392L;
	
	private Process process = new Process();
	private ProcessDAO processDAO = new ProcessDAO();
	

	private Phase phase = new Phase();
	private List<Phase> phaseList = new ArrayList<Phase>();
	private PhaseDAO phaseDAO = new PhaseDAO();

	private P2cDAO p2cDao = new P2cDAO();

	String action ;

	/*
	private String idprocess;

	public String getIdprocess() {
		return idprocess;
	}
	
	public void setIdprocess(String idprocess) {
		this.idprocess = idprocess;
	}
	*/
	
	public Process getProcess() {
		return process;
	}

	public void setProcess(Process process) {
		this.process = process;
	}


	@Override
	public Phase getModel() {
		return phase;
	}
	
	public String add()
	{
		phaseDAO.savePhase(phase);
		return SUCCESS;
	}
	
	public String list()
	{
		
		if (process.getId() != null ){
			phaseList = phaseDAO.listPhase(process.getId());
			process = processDAO.getProcess(process.getId()) ;
			//phaseList = phaseDAO.listPhase(process.getId());

		} 
		/*
		else {
			phaseList = phaseDAO.listPhase();
		}
		*/
		return SUCCESS;
	}

	

	public String update()
	{
		long id =0 ;
		if (action == null) return ERROR;
		if (action.equals("active") && this.phase.getId() != null) {
			Phase phaseTmp = phaseDAO.getPhase(this.phase.getId());
			phaseTmp.setActive(this.phase.getActive());
			phaseDAO.savePhase(phaseTmp);
			id=phaseTmp.getIdprocess();
			
			String  coment;
			Process prcTmplog = processDAO.getProcess(id);
			if (this.phase.getActive().equals("yes")) coment = "Lancement de la phase <b>" + phaseTmp.getNom() + " </b>";
			else coment = "Desactivation de la phase " + phaseTmp.getNom();
			
			p2cDao.addLog(prcTmplog, coment);

		}
			
		if (action.equals("active") && this.phase.getId() != null) {
			processDAO.updateProcessPhaseEncours(id);
			//processDAO.updateProcessPhaseEncours(id); 
			
			return "active";
		}
		return SUCCESS;
	}

	public String updateStatus()
	{

		Phase actTmp = phaseDAO.getPhase(phase.getId());
		actTmp.setStatus(phase.getStatus());
		phaseDAO.savePhase(actTmp);

		Process prcTmplog = processDAO.getProcess(actTmp.getIdprocess()) ; 
		
		String coment = "Le nouveau de status de la phase " + actTmp.getNom() + " est <b> " + actTmp.getStatus() + " </b>";
		
		if (actTmp.getStatus().equals("completed")) coment = "la phase " + actTmp.getNom() + " est <b> achevée  </b>";
		
				
		
		if (phase.getStatus().equals("completed")){
			actTmp.setDfin(  new Date(System.currentTimeMillis()) );
			processDAO.updateProcessPhaseEncours(actTmp.getIdprocess());


			List<Phase> pListTmp = phaseDAO.listPhase(actTmp.getIdprocess());
			int actSize = pListTmp.size();
			int cpt = actSize;
			for (int i=0; i<actSize; i++){
				
				if (pListTmp.get(i).getStatus().equals("completed")) cpt--;
				
			}
			
			if (cpt==0) {
				Process prcTmp = processDAO.getProcess(actTmp.getIdprocess()) ; 
				prcTmp.setStatus("completed");
				prcTmp.setDfin( new Date(System.currentTimeMillis())  );
				processDAO.saveProcess(prcTmp);

				coment = coment + "<br>Le process est fini"; 
			}

		}

		
		if (phase.getStatus().startsWith("in_progress")){
			Process prcTmp = processDAO.getProcess(actTmp.getIdprocess()) ; 
			prcTmp.setStatus(phase.getStatus());
			processDAO.saveProcess(prcTmp);

		}
		
		p2cDao.addLog(prcTmplog, coment);
		
		this.phase.setIdprocess(prcTmplog.getId());
		//this.phase = null;//phaseDAO.getPhase(phase.getId());
		return this.list();
		
		//	taskDAO.saveTask(tskTmp);			
			
		//return SUCCESS;
	}
		
	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public Phase getPhase() {
		return phase;
	}

	public void setPhase(Phase phase) {
		this.phase = phase;
	}

	public List<Phase> getPhaseList() {
		return phaseList;
	}

	public void setPhaseList(List<Phase> phaseList) {
		this.phaseList = phaseList;
	}

	
}
