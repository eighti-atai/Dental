package com.atai.dental.module.enterp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "doctor_lov")
public class DoctorLov {

	@Id
	@Column(name = "user_id")
	private int doctor;
	
	@Column(name = "user_name")
	private String userName;

	public int getDoctor() {
		return doctor;
	}

	public void setDoctor(int doctor) {
		this.doctor = doctor;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
}
