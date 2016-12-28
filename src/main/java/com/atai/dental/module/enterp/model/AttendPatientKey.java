package com.atai.dental.module.enterp.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class AttendPatientKey implements Serializable {
	
	@Column(name = "patient_id")
	private int patientId;
	@Column(name = "attend_patient_id")
	private int attendPatientId;
	
	public int getAttendPatientId() {
		return attendPatientId;
	}

	public void setAttendPatientId(int attendPatientId) {
		this.attendPatientId = attendPatientId;
	}

	public int getPatientId() {
		return patientId;
	}
	
	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}
	

}
