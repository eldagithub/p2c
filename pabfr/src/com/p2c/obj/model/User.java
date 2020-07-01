package com.p2c.obj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="USER")
public class User {



	private Long id;
	private String nom;
	private String prenom;

	private String profile;
	private String objet;
	private String email;

	private String login;
	private String password;
	private String oldpassword;
	private String password2;

	private String active;
	private String dcreate;

	private Long hpjournee;
	private Long hpsemaine;

	@Id
	@GeneratedValue
	@Column(name="ID")
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
		

	@Transient public String getPassword2() {
		return password2;
	}
	@Transient public void setPassword2(String password2) {
		this.password2 = password2;
	}
	@Transient public String getOldpassword() {
		return oldpassword;
	}
	@Transient public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	
	public String getObjet() {
		return objet;
	}
	public void setObjet(String objet) {
		this.objet = objet;
	}
	
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	public String getDcreate() {
		return dcreate;
	}
	public void setDcreate(String dcreate) {
		this.dcreate = dcreate;
	}
	public Long getHpjournee() {
		return hpjournee;
	}
	public void setHpjournee(Long hpjournee) {
		this.hpjournee = hpjournee;
	}
	public Long getHpsemaine() {
		return hpsemaine;
	}
	public void setHpsemaine(Long hpsemaine) {
		this.hpsemaine = hpsemaine;
	}
	
}
