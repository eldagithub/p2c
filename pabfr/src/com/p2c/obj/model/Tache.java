package com.p2c.obj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import javax.persistence.Transient;
import java.util.Date;


@Entity
@Table(name="TACHE")
public class Tache {

	private Long id;
	
	private Long idphase;
	
	private int idref;
	private int ordre;
	
	private String nom;
	private String description;

	private Long idresponsable;
	@Transient private String responsable;

	private String visibilite;
	private String status;

	
	private Date dstartprev;
	private Date dstart;
	private Date dfinprev; 
	private Date dfin;

	private int montant;
	private String type;

	public Tache () {
		
	}
	
	public Tache  (Long id, Long idphase, int idref, int ordre, String nom, String description, 
			Long idresponsable, String visibilite, String status, Date dstartprev, Date dstart, Date dfinprev, Date dfin, int montant, String type, String responsable){
		this.id = id;
		this.idphase = idphase;
		this.idref = idref;
		this.ordre = ordre;
		this.nom = nom;
		this.description = description;
		this.idresponsable = idresponsable;
		this.visibilite = visibilite;
		this.status = status;
		this.dstartprev = dstartprev;
		this.dstart = dstart;
		this.dfinprev = dfinprev;
		this.dfin = dfin;
		this.responsable = responsable;	
		this.montant = montant;
		this.type = type;
		
	}
	
	
	
	public Long getIdphase() {
		return idphase;
	}
	public void setIdphase(Long idphase) {
		this.idphase = idphase;
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
	
	@Transient public String getResponsable() {
		return responsable;
	}
	@Transient public void setResponsable(String responsable) {
		this.responsable = responsable;
	}
	
	public Long getIdresponsable() {
		return idresponsable;
	}
	public void setIdresponsable(Long idresponsable) {
		this.idresponsable = idresponsable;
	}

	
	public String getVisibilite() {
		return visibilite;
	}
	public void setVisibilite(String visibilite) {
		this.visibilite = visibilite;
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
	
	public Date getDfinprev() {
		return dfinprev;
	}
	public void setDfinprev(Date dfinprev) {
		this.dfinprev = dfinprev;
	}

	public int getMontant() {
		return montant;
	}

	public void setMontant(int montant) {
		this.montant = montant;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
