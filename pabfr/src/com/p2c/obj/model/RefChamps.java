package com.p2c.obj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="REFCHAMPS")
public class RefChamps {

	private Long idrefchamps;
	private Long idrefprocess;
	private int ordre;
	private String nom;
	private String description;
	private String obligatoire;
	private String active;


	private String type;
//	private String readonly;
//	private String autocomplete;

	private int maxlength;
	private int minlength;

//	private String defaultvalue;
	private String listvalues;
//`	private String maxvalue;
//	private String minvalue;

	private int width;
	private int height;

	
	
	
	@Id
	@GeneratedValue
	@Column(name="idrefchamps")
	public Long getIdrefchamps() {
		return idrefchamps;
	}
	public void setIdrefchamps(Long idrefchamps) {
		this.idrefchamps = idrefchamps;
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
	
	

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getMaxlength() {
		return maxlength;
	}
	public void setMaxlength(int maxlength) {
		this.maxlength = maxlength;
	}
	public int getMinlength() {
		return minlength;
	}
	public void setMinlength(int minlength) {
		this.minlength = minlength;
	}

	public String getListvalues() {
		return listvalues;
	}
	public void setListvalues(String listvalues) {
		this.listvalues = listvalues;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	


}
