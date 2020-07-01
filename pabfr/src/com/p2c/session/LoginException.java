package com.p2c.session;

public class LoginException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public enum ErrorType {
		USER_ALREADY_EXISTS,
		NO_SUCH_USER_EXISTS
	}

	public LoginException(String description, ErrorType type) {
		super(description);
	}
}
