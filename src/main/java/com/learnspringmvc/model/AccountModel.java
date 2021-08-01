package com.learnspringmvc.model;

public class AccountModel extends AbstractModel<AccountModel> {
	
	private String email;
	private String password;
	private int permission;
	
	public int getPermission() {
		return permission;
	}
	public void setPermission(int permission) {
		this.permission = permission;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
