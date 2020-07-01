package com.p2c.obj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import java.util.Date;


@Entity
@Table(name="ETAPE")
public class Etape {

	private Long id;
	
	private Long idphase;
	private Long idtache;
	
	private int idref;
	private int ordre;
	
	private String nom;
	private String description;


	private String status;

	
	private Date dstartprev;
	private Date dstart;
	private Date dfin;


	private int subordre;
	private int dent;
	private int idacte;
	private String acte;
	private int ordreacte;

	private int idfamille;
	private String famille;
	private int ordrefamille;

	private int duree;
	private int delai;

	
	
	public Etape () {
		
	}


	public Etape  (Long id, Long idphase, Long idtache, int idref, int ordre, String nom, String description, 
			String status, Date dstartprev, Date dstart, Date dfin, 
			int subordre, int dent,int idacte, String acte, int ordreacte, int idfamille, String famille, int ordrefamille, 
			int duree, int delai
			){
		this.id = id;
		this.idphase = idphase;
		this.idtache = idtache;
		this.idref = idref;
		this.ordre = ordre;
		this.nom = nom;
		this.description = description;
		this.status = status;
		this.dstartprev = dstartprev;
		this.dstart = dstart;
		this.dfin = dfin;

		this.subordre = subordre;
		this.dent = dent;
		this.idacte = idacte;
		this.acte = acte;
		this.ordreacte = ordreacte;
		this.idfamille = idfamille;
		this.famille = famille;
		this.ordrefamille = ordrefamille;
		
		this.duree = duree;
		this.delai = delai;
		
	}
/*
	public Etape (int idacte, String acte, int ordreacte){
		this.idacte = idacte;
		this.acte = acte;
		this.ordreacte = ordreacte;
	}
*/	
	public Long getIdphase() {
		return idphase;
	}
	public void setIdphase(Long idphase) {
		this.idphase = idphase;
	}
	
	public Long getIdtache() {
		return idtache;
	}
	public void setIdtache(Long idtache) {
		this.idtache = idtache;
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
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public Date getDstartprev() {
		return dstartprev;
	}
	public void setDstartprev(Date dstartprev) {
		this.dstartprev = dstartprev;
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
	
	public int getIdref() {
		return idref;
	}
	public void setIdref(int idref) {
		this.idref = idref;
	}
	public int getSubordre() {
		return subordre;
	}

	public void setSubordre(int subordre) {
		this.subordre = subordre;
	}

	public int getDent() {
		return dent;
	}

	public void setDent(int dent) {
		this.dent = dent;
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


	public int getOrdreacte() {
		return ordreacte;
	}


	public void setOrdreacte(int ordreacte) {
		this.ordreacte = ordreacte;
	}


	public int getOrdrefamille() {
		return ordrefamille;
	}


	public void setOrdrefamille(int ordrefamille) {
		this.ordrefamille = ordrefamille;
	}


	public int getDelai() {
		return delai;
	}


	public void setDelai(int delai) {
		this.delai = delai;
	}


	public int getDuree() {
		return duree;
	}


	public void setDuree(int duree) {
		this.duree = duree;
	}

}
