package com.p2c.obj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;

@Entity
@Table(name="PROCESS")
public class Process {

	private Long id;
	private Long idref;

	private int idprogramme; 
	@Transient private String programme;;
	
	private int idgare; 
	@Transient private String gare;

	private int iddp; 
	@Transient private String dp;

	private int idcp; 
	@Transient private String cp;

	private String couleur;
	private String codebudget;

	private String status; 
	private String phaseencours; 
	
	private Date dstart; 
	private Date dfinprev; 
	private Date dfin; 

	public Process (){
	}

	public Process (long id, long  idref, int idprogramme, String programme, int idgare, String gare, 
			int iddp, String dp, int idcp, String cp, String  status, 
			String couleur, String codebudget, Date dstart, Date dfinprev, Date dfin, String phaseencours ) {
		
		this.id=id;
		this.idref=idref;
		this.idprogramme=idprogramme;
		this.programme=programme;
		this.idgare=idgare;
		this.gare=gare;
		this.iddp=iddp;
		this.dp=dp;
		this.idcp=idcp;
		this.cp=cp;
		this.status=status;
		this.couleur=couleur;
		this.codebudget=codebudget;
		this.dstart=dstart;
		this.dfinprev=dfinprev;
		this.dfin =dfin ;
		this.phaseencours=phaseencours;
		
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

	public Long getIdref() {
		return idref;
	}
	public void setIdref(Long idref) {
		this.idref = idref;
	}

	public int getIdprogramme() {
		return idprogramme;
	}
	public void setIdprogramme(int idprogramme) {
		this.idprogramme = idprogramme;
	}

	@Transient public String getProgramme() {
		return programme;
	}
	public void setProgramme(String programme) {
		this.programme = programme;
	}

	public int getIdgare() {
		return idgare;
	}
	public void setIdgare(int idgare) {
		this.idgare = idgare;
	}

	@Transient public String getGare() {
		return gare;
	}
	public void setGare(String gare) {
		this.gare = gare;
	}

	public int getIddp() {
		return iddp;
	}
	public void setIddp(int iddp) {
		this.iddp = iddp;
	}

	@Transient public String getDp() {
		return dp;
	}
	public void setDp(String dp) {
		this.dp = dp;
	}

	public int getIdcp() {
		return idcp;
	}
	public void setIdcp(int idcp) {
		this.idcp = idcp;
	}

	@Transient public String getCp() {
		return cp;
	}
	public void setCp(String cp) {
		this.cp = cp;
	}

	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhaseencours() {
		return phaseencours;
	}

	public void setPhaseencours(String phaseencours) {
		this.phaseencours = phaseencours;
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
	
	
	public String getCouleur() {
		return couleur;
	}
	public void setCouleur(String couleur) {
		this.couleur = couleur;
	}
	
	
	public String getCodebudget() {
		return codebudget;
	}
	public void setCodebudget(String codebudget) {
		this.codebudget = codebudget;
	}

	public Date getDfinprev() {
		return dfinprev;
	}
	public void setDfinprev(Date dfinprev) {
		this.dfinprev = dfinprev;
	}

/*	
	public void setDfinprev(String sdfinprev) throws ParseException {
	    if(sdfinprev != null && sdfinprev != "") {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		this.dfinprev = formatter.parse(sdfinprev);
		}
		else {
			this.dfinprev = null;
		}
	}
*/
	
	

}
