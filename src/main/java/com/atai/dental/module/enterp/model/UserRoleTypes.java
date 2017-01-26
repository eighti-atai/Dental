package com.atai.dental.module.enterp.model;

public enum UserRoleTypes {
	
	USER("USER"),
	DBA("DBA"),
	ADMIN("ADMIN");
	
	String userRoleType;
	
	private UserRoleTypes(String userRoleType){
		this.userRoleType = userRoleType;
	}
	
	public String getUserRoleType(){
		return userRoleType;
	}

}
