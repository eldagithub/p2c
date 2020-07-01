package com.p2c.obj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name="REFPROCESS")
public class RefProcess implements Serializable {



	/**
	 * 
	 */
	private static final long serialVersionUID = 2760762031977374135L;
	private Long idref;
	private String ordre;
	private String nom;
	private String description;
	private String active;
	private String version;

	public RefProcess (){
	}

	
	
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
		

	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}

	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	
}
