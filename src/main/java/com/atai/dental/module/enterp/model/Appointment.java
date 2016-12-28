package com.atai.dental.module.enterp.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
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

	
	@ManyToOne
	@JoinColumn(name = "patient_id", referencedColumnName = "patient_id", insertable = false, updatable = false)
	private Patient patient;
	
	

	@Column(name = "appointment_date")
	private Date appointmentDate;
	@Column(name = "appointment_time")
	private String appointmentTime;
	private String doctor;
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
	
	public void setKey(int patientId, int appointmentId)
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

	public Date getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(Date appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

	public String getAppointmentTime() {
		return appointmentTime;
	}

	public void setAppointmentTime(String appointmentTime) {
		
		String time = appointmentTime.replaceAll("\\s","");
		if(time.length()>2){
			String s = time.substring(time.length()-1, time.length());
			/*if(s.toLowerCase()=="pm")
			{
				string
			}*/
			
			time = time.substring(0, time.length()-2);
			time = time+":00";
		}
		
		System.out.println("########### "+time );
		this.appointmentTime = time;
	}

	public String getDoctor() {
		return doctor;
	}

	public void setDoctor(String doctor) {
		this.doctor = doctor;
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
