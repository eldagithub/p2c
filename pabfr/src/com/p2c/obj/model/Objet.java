package com.p2c.obj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="OBJET")
public class Objet {



	private Long idref;
	private String ordre;
	private String nom;
	private String description;
	private String categorie;
	private int idresponsable;

	
	
	@Id
	@GeneratedValue
	@Column(name="idref")
	public Long getIdref() {
		return idref;
	}
	public void setIdref(Long idref) {
		this.idref = idref;
	}
	
	
	public String getOrdre() {
		return ordre;
	}
	public void setOrdre(String ordre) {
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
		

	public String getCategorie() {
		return categorie;
	}
	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}

	public int getIdresponsable() {
		return idresponsable;
	}
	public void setIdresponsable(int idresponsable) {
		this.idresponsable = idresponsable;
	}
	
}
