package com.p2c.obj.control;

import java.util.ArrayList;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.p2c.obj.back.ProcessDAO;
import com.p2c.obj.back.ChampsDAO;


import com.p2c.obj.model.Champs;
import com.p2c.obj.model.Process;

public class ChampsAction extends ActionSupport implements ModelDriven<Champs> {


	/**
	 * 
	 */
	private static final long serialVersionUID = 262106796964577392L;
	
	private Process process = new Process();
	private ProcessDAO processDAO = new ProcessDAO();
	

	private Champs champs = new Champs();
	private List<Champs> champsList = new ArrayList<Champs>();
	private ChampsDAO champsDAO = new ChampsDAO();

	public Process getProcess() {
		return process;
	}

	public void setProcess(Process process) {
		this.process = process;
	}


	@Override
	public Champs getModel() {
		return champs;
	}
	
	public String add()
	{
		champsDAO.saveChamps(champs);
		return SUCCESS;
	}
	
	public String list()
	{
		
		if (process.getId() != null ){
			champsList = champsDAO.listChamps(process.getId());
			process = processDAO.getProcess(process.getId()) ;
		} 

		return SUCCESS;
	}

	

	public String update()
	{
		champsDAO.updateChamps(champs);
		return SUCCESS;
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

	
}
