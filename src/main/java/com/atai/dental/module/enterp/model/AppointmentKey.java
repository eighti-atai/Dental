package com.atai.dental.module.enterp.model;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class AppointmentKey implements Serializable {
	@Column(name = "patient_id")
	private int patientId;
	@Column(name = "appointment_id")
	private int appointmentId;
	
	public int getPatientId() {
		return patientId;
	}
	public int getAppointmentId() {
		return appointmentId;
	}
	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}
	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + appointmentId ;
		result = prime * result + patientId;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AppointmentKey other = (AppointmentKey) obj;
		if (appointmentId != other.appointmentId)
			return false;
		if (patientId != other.patientId)
			return false;
		return true;
	}
	
	
}
 