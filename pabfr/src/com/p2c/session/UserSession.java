package com.p2c.session;

import java.io.Serializable;
import java.util.Date;

/**
 * Represends a user in the Chat example.
 */
public class UserSession implements Serializable {

	private static final long serialVersionUID = -1434958919516089297L;

	private String name;
	private String profile;
	private Date creationDate;


	public UserSession(String name) {
		this.name = name;
		this.creationDate = new Date(System.currentTimeMillis());
	}
	public UserSession(String name, String profile) {
		this.name = name;
		this.profile = profile;
		this.creationDate = new Date(System.currentTimeMillis());
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public String getName() {
		return name;
	}
	public String getProfile() {
		return profile;
	}
}
