package com.atai.dental.module.enterp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.atai.dental.generic.interfaces.Model;

@Entity
@Table(name = "appointment_tab")
public class Appointment implements Model<AppointmentKey> {

	

	@Id
	private AppointmentKey key;
	
	//@Column(name = "appointment_id")
	//private int appointmentId;
	
	@ManyToOne
	@JoinColumn(name = "patient_id", referencedColumnName = "patient_id", insertable = false, updatable = false)
	private Patient patient;
	
	

	@Column(name = "appointment_date")
	private String appointmentDate;
	@Column(name = "appointment_time")
	private String appointmentTime;
	private String objid;
	
	
	

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
	
	public void setId(int patientId, int appointmentId)
	{
		this.key.setPatientId(patientId);
		this.key.setAppointmentId(appointmentId);
	}
	/*public int getAppointmentId() {
		return appointmentId;
	}

	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
	}

	public String getPatientId() {
		return patientId;
	}

	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}*/

	public String getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(String appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

	public String getAppointmentTime() {
		return appointmentTime;
	}

	public void setAppointmentTime(String appointmentTime) {
		this.appointmentTime = appointmentTime;
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
