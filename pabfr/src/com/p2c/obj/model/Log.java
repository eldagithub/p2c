/*
 * Created on Mar 31, 2006
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.p2c.obj.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;

import com.opensymphony.xwork2.ActionContext;
import com.p2c.session.AuthenticationInterceptor;
import com.p2c.session.UserSession;


/**
 * @author admin
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */

@Entity
@Table(name="LOG")
public class Log {

	/**
	 * 
	 */
	private Long id ;
	private String classe = "";
	private Long idobj ;
	private String nomobj = "";
	private String typeobj = "";
	private String creator = "";
	private String action = "";
	private String status = "";
	private String coment = "";
	private String tolist = "";
	private Date dcreate ;
	private String fromhost = "";

	/**
	 * 
	 */
	public Log (){
	}
	

	public Log(String classe, Long idobj, String typeobj, String nomobj, String action, String status, String tolist, String coment) {
		//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//String now_date =  dateFormat.format( new Date(System.currentTimeMillis()) );
		Date now_date = new Date(System.currentTimeMillis());
	    HttpServletRequest request = ServletActionContext.getRequest();
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().get(ActionContext.SESSION);
		UserSession usersession = (UserSession) session.get(AuthenticationInterceptor.USER_SESSION_KEY);

		this.creator = usersession.getName() ;
		this.fromhost         = request.getRemoteAddr() ;    

		this.idobj          = idobj ;     
		this.classe         = classe ;    
		this.action         = action ;    
		this.status         = status ;    
		this.tolist          = tolist ;     
		this.nomobj         = nomobj ;    
		this.typeobj        = typeobj ;   
		this.dcreate        = now_date ;   
		this.coment         = coment ;    
	}

	/**
	 * @return
	 */
	@Column(name="action")
	public String getAction() {
		return action;
	}

	/**
	 * @return
	 */
	@Column(name="classe")
	public String getClasse() {
		return classe;
	}

	/**
	 * @return
	 */
	@Column(name="coment")
	public String getComent() {
		return coment;
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
	@Column(name="tolist")
	public String getTolist() {
		return tolist;
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
	@Column(name="creator")
	public String getCreator() {
		return creator;
	}

	/**
	 * @return
	 */
	@Column(name="nomobj")
	public String getNomobj() {
		return nomobj;
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
	@Column(name="typeobj")
	public String getTypeobj() {
		return typeobj;
	}

	/**
	 * @return
	 */
	@Column(name="fromhost")
	public String getFromhost() {
		return fromhost;
	}

	/**
	 * @param string
	 */
	public void setAction(String string) {
		action = string;
	}

	/**
	 * @param string
	 */
	public void setClasse(String string) {
		classe = string;
	}

	/**
	 * @param string
	 */
	public void setComent(String string) {
		coment = string;
	}

	/**
	 * @param string
	 */
	public void setDcreate(Date string) {
		dcreate = string;
	}

	/**
	 * @param string
	 */
	public void setTolist(String string) {
		tolist = string;
	}

	/**
	 * @param string
	 */
	public void setId(Long string) {
		id = string;
	}

	/**
	 * @param string
	 */
	public void setIdobj(Long string) {
		idobj = string;
	}

	/**
	 * @param string
	 */
	public void setCreator(String string) {
		creator = string;
	}

	/**
	 * @param string
	 */
	public void setNomobj(String string) {
		nomobj = string;
	}

	/**
	 * @param string
	 */
	public void setStatus(String string) {
		status = string;
	}

	/**
	 * @param string
	 */
	public void setTypeobj(String string) {
		typeobj = string;
	}

	/**
	 * @param string
	 */
	public void setFromhost(String string) {
		fromhost = string;
	}
	
}
