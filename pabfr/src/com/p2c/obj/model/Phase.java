package com.p2c.obj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import java.util.Date;

@Entity
@Table(name="PHASE")
public class Phase {

	private Long id;
	private Long idprocess;
	private int idref;
	private int ordre;
	private String nom;
	private String description;
	private String obligatoire;
	private String active;
	private String status;
	private Date dstart;
	private Date dfin;

	private String classe;
	
	public Long getIdprocess() {
		return idprocess;
	}
	public void setIdprocess(Long idprocess) {
		this.idprocess = idprocess;
	}

	@Id
	@GeneratedValue
	@Column(name="ID")
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public int getOrdre() {
		return ordre;
	}
	public void setOrdre(int ordre) {
		this.ordre = ordre;
	}


	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getObligatoire() {
		return obligatoire;
	}
	public void setObligatoire(String obligatoire) {
		this.obligatoire = obligatoire;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public Date getDstart() {
		return dstart;
	}
	public void setDstart(Date dstart) {
		this.dstart = dstart;
	}
	
	public Date getDfin() {
		return dfin;
	}
	public void setDfin(Date dfin) {
		this.dfin = dfin;
	}
	
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	
	public int getIdref() {
		return idref;
	}
	public void setIdref(int idref) {
		this.idref = idref;
	}
	public String getClasse() {
		return classe;
	}
	public void setClasse(String classe) {
		this.classe = classe;
	}


}
