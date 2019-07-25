package com.atai.dental.module.enterp.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.atai.dental.generic.interfaces.Model;


@Entity
@Table(name = "user_role_tab")
public class UserRole implements Model<Integer> {

	@Id
	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "role_id")
	private int roleId;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public Integer getId() {
		// TODO Auto-generated method stub
		return userId;
	}

	public void setId(Integer id) {
		this.userId = id;
	}
	
	

}
