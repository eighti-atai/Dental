package com.atai.dental.module.enterp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

public class AttendPatient {
	@Id
	private AppointmentKey key;

	
	@ManyToOne
	@JoinColumn(name = "patient_id", referencedColumnName = "patient_id", insertable = false, updatable = false)
	private Patient patient;
	
	private Date doctor;
	@Column(name = "start_time")
	private String startTime;
	private String done;
	private String objid;
	
	
	public Date getDoctor() {
		return doctor;
	}

	public void setDoctor(Date doctor) {
		this.doctor = doctor;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getDone() {
		return done;
	}

	public void setDone(String done) {
		this.done = done;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public void setKey(AppointmentKey key) {
		this.key = key;
	}
	
	public AppointmentKey getKey() {
		return key;
	}
	
	public void setKey(int patientId, int appointmentId)
	{
		this.key.setPatientId(patientId);
		this.key.setAppointmentId(appointmentId);
	}


	public String getObjid() {
		return objid;
	}

	public void setObjid(String objid) {
		this.objid = objid;
	}

	public AppointmentKey getId() {
		// TODO Auto-generated method stub
		return getKey();
	}

	public void setId(AppointmentKey key) {
		setKey(key);

	}

	
	

}
