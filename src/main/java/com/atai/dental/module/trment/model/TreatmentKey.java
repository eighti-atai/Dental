package com.atai.dental.module.trment.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;


@Embeddable
public class TreatmentKey implements Serializable {
	@Column(name = "patient_id")
	private int patientId;
	@Column(name = "treatment_id")
	private int treatmentId;
	
	public int getPatientId() {
		return patientId;
	}
	public int getTreatmentId() {
		return treatmentId;
	}
	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}
	public void setTreatmentId(int treatmentId) {
		this.treatmentId = treatmentId;
	}
	
	
}
 