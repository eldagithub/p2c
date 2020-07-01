package com.p2c.obj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="REFTACHE")
public class RefTache {

	private Long idref;
	private Long idrefphase;
	private int ordre;
	private String nom;
	private String description;
	private String obligatoire;

	@Id
	@GeneratedValue
	@Column(name="idref")
	public Long getIdref() {
		return idref;
	}
	public void setIdref(Long idref) {
		this.idref = idref;
	}

	public Long getIdrefphase() {
		return idrefphase;
	}
	public void setIdrefphase(Long idrefphase) {
		this.idrefphase = idrefphase;
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
	
}
