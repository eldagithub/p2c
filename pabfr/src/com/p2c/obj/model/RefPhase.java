package com.p2c.obj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="REFPHASE")
public class RefPhase {

	private Long idref;
	private Long idrefprocess;
	private int ordre;
	private String nom;
	private String description;
	private String obligatoire;
	private String classe;

	@Id
	@GeneratedValue
	@Column(name="idref")
	public Long getIdref() {
		return idref;
	}
	public void setIdref(Long idref) {
		this.idref = idref;
	}

	public Long getIdrefprocess() {
		return idrefprocess;
	}
	public void setIdrefprocess(Long idrefprocess) {
		this.idrefprocess = idrefprocess;
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

	public String getClasse() {
		return classe;
	}
	public void setClasse(String classe) {
		this.classe = classe;
	}

}
