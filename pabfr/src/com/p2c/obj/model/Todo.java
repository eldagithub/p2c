/*
 * Created on Mar 31, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.p2c.obj.model;

import java.text.ParseException;
//import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

//import java.text.SimpleDateFormat;

/**
 * @author admin
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */

@Entity
@Table(name="TODO")
public class Todo {

	/**
	 * 
	 */
	private Long id ;
	private Long idobj ;
	private String typeobj = "";
	private Date dcreate ;
	private String description = "";
	private Long ordre ;
	private String owner = "";
	private Long progress ;
	private String status = "";
	private Date dend ;
	private Date dendprev; 

	/**
	 * 
	 */
	public Todo (){
	}
	


	/**
	 * @return
	 */
	@Id
	@GeneratedValue
	@Column(name="id")
	public Long getId() {
		return id;
	}

	/**
	 * @return
	 */
	@Column(name="idobj")
	public Long getIdobj() {
		return idobj;
	}



	/**
	 * @return
	 */
	@Column(name="typeobj")
	public String getTypeobj() {
		return typeobj;
	}



	/**
	 * @return
	 */
	@Column(name="dcreate")
	public Date getDcreate() {
		return dcreate;
	}



	/**
	 * @return
	 */
	@Column(name="description")
	public String getDescription() {
		return description;
	}



	/**
	 * @return
	 */
	@Column(name="ordre")
	public Long getOrdre() {
		return ordre;
	}



	/**
	 * @return
	 */
	@Column(name="owner")
	public String getOwner() {
		return owner;
	}



	/**
	 * @return
	 */
	@Column(name="progress")
	public Long getProgress() {
		return progress;
	}



	/**
	 * @return
	 */
	@Column(name="status")
	public String getStatus() {
		return status;
	}



	/**
	 * @return
	 */
	@Column(name="dend")
	public Date getDend() {
		return dend;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public void setIdobj(Long idobj) {
		this.idobj = idobj;
	}



	public void setTypeobj(String typeobj) {
		this.typeobj = typeobj;
	}



	public void setDcreate(Date dcreate) {
		this.dcreate = dcreate;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public void setOrdre(Long ordre) {
		this.ordre = ordre;
	}



	public void setOwner(String owner) {
		this.owner = owner;
	}



	public void setProgress(Long progress) {
		this.progress = progress;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public void setDend(Date dend) {
		this.dend = dend;
	}



	public Date getDendprev() {
		return dendprev;
	}


	
	public void setDendprev(Date dendprev) throws ParseException{
		this.dendprev = dendprev;
	}


/*	
	public void setDendprev(String sdendprev) throws ParseException{
	    if(sdendprev != null && sdendprev != "") {
		System.out.println("ma date dendprev is : " + sdendprev);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	    System.out.println("ma date dendprev after convert is : " + formatter.parse(sdendprev));

		this.dendprev = formatter.parse(sdendprev);
		}
		else {
			this.dendprev = null;
		}
	}

*/	

}
