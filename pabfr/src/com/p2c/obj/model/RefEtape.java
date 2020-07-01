package com.p2c.obj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="REFETAPE")
public class RefEtape {

	private int idref;

	private int ordre;
	
	private String nom;
	private String description;
	private String unitaire;
	
	private int subordre;
	private int idrefphase;
	private int idacte;
	private String acte;
	private int idfamille;
	private String famille;

	private int duree;
	private int delai;

	
	
	public RefEtape () {
		
	}
	
	public RefEtape  (int idref, int ordre, String nom, String description, 
			 String unitaire, 
			int subordre, int idacte, String acte, int idfamille, String famille,
			int duree, int delai
			){
		this.idref = idref;
		this.ordre = ordre;
		this.nom = nom;
		this.description = description;
		this.setUnitaire(unitaire);

		this.subordre = subordre;
		this.idacte = idacte;
		this.acte = acte;
		this.idfamille = idfamille;
		this.famille = famille;
		
		this.duree = duree;
		this.delai = delai;
		
	}

	public RefEtape  (int idacte, String acte, int idfamille, String unitaire){
		this.idacte = idacte;
		this.acte = acte;
		this.unitaire = unitaire;
		this.idfamille = idfamille;
	}
	
	public RefEtape  (int idref, int idacte, String acte, int idfamille, String nom, int duree, int delai){
		this.idref = idref;
		this.idacte = idacte;
		this.acte = acte;
		this.idfamille = idfamille;
		this.nom = nom;
		this.duree = duree;
		this.delai = delai;
	} 
	
	public RefEtape  (int idref, int idacte, String acte, int idfamille, String nom, String description, int duree, int delai){
		this.idref = idref;
		this.idacte = idacte;
		this.acte = acte;
		this.idfamille = idfamille;
		this.nom = nom;
		this.description = description;
		this.duree = duree;
		this.delai = delai;
	} 

	public RefEtape  (int idrefphase, int ordre, int idacte, String acte, int idfamille, String famille, String unitaire){
		this.idrefphase = idrefphase;
		this.ordre = ordre;
		this.idacte = idacte;
		this.acte = acte;
		this.idfamille = idfamille;
		this.famille = famille;
		this.unitaire = unitaire;
	}
	
	
	
	@Id
	@GeneratedValue
	@Column(name="IDREF")
	public int getIdref() {
		return idref;
	}
	public void setIdref(int idref) {
		this.idref = idref;
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
	


	public int getSubordre() {
		return subordre;
	}

	public void setSubordre(int subordre) {
		this.subordre = subordre;
	}

	public int getIdacte() {
		return idacte;
	}

	public void setIdacte(int idacte) {
		this.idacte = idacte;
	}

	public String getActe() {
		return acte;
	}

	public void setActe(String acte) {
		this.acte = acte;
	}

	public int getIdfamille() {
		return idfamille;
	}

	public void setIdfamille(int idfamille) {
		this.idfamille = idfamille;
	}

	public String getFamille() {
		return famille;
	}

	public void setFamille(String famille) {
		this.famille = famille;
	}

	public String getUnitaire() {
		return unitaire;
	}

	public void setUnitaire(String unitaire) {
		this.unitaire = unitaire;
	}

	public int getDuree() {
		return duree;
	}

	public void setDuree(int duree) {
		this.duree = duree;
	}

	public int getDelai() {
		return delai;
	}

	public void setDelai(int delai) {
		this.delai = delai;
	}

	public int getIdrefphase() {
		return idrefphase;
	}

	public void setIdrefphase(int idrefphase) {
		this.idrefphase = idrefphase;
	}

}
