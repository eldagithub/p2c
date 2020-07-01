package com.p2c.obj.model;


import com.p2c.obj.model.Tache;
import com.p2c.obj.model.Phase;
import com.p2c.obj.model.Process;

public class PrjPhaTsk {



	private Tache tache;
	private Phase phase;
	private Process process;
	
	public PrjPhaTsk () {
		
	}
	
	public PrjPhaTsk  (Tache tsk, Phase pha, Process prj){
		this.tache = tsk;
		this.phase = pha;
		this.process = prj;
	}

	public Tache getTache() {
		return tache;
	}
	public void setTache(Tache tache) {
		this.tache = tache;
	}
	public Phase getPhase() {
		return phase;
	}
	public void setPhase(Phase phase) {
		this.phase = phase;
	}
	public Process getProcess() {
		return process;
	}
	public void setProcess(Process process) {
		this.process = process;
	}

	
}
