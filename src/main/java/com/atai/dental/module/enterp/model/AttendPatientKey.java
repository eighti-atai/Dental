package com.atai.dental.module.enterp.model;

import javax.persistence.Column;

public class AttendPatientKey {
	
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
