package com.atai.dental.module.enterp.model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

import com.atai.dental.generic.interfaces.Model;
import com.atai.dental.generic.other.Time12HoursValidator;

@Entity
@Table(name = "appointment_tab")
public class Appointment implements Model<AppointmentKey> {

	@Id
	private AppointmentKey id;

	@Transient
	private Patient patient;

	// @ManyToOne
	// @JoinColumn(name = "doctor", referencedColumnName = "user_name",
	// insertable = false, updatable = false)
	// private User user;

	@Column(name = "appointment_date")
	private Date appointmentDate;
	@Column(name = "appointment_time")
	private Date appointmentTime;
	private String doctor;
	private String objid;
	private String code;

	@Column(name = "appointment_end_time")
	private Date appointmentEndTime;

	@Transient
	public Patient getPatient() {
		return patient;
	}

	
	@Transient
	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	/*
	 * public int getAppointmentId() { return appointmentId; }
	 * 
	 * public void setAppointmentId(int appointmentId) { this.appointmentId =
	 * appointmentId; }
	 * 
	 * public String getPatientId() { return patientId; }
	 * 
	 * public void setPatientId(String patientId) { this.patientId = patientId;
	 * }
	 */

	public Date getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(Date appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

	
	/*public String getAppointmentEndTime() {
		// return appointmentEndTime;
		Time12HoursValidator timeValidate = new Time12HoursValidator();
		return timeValidate.convertTimeBack(appointmentEndTime);

	}

	public void setAppointmentEndTime(String appointmentEndTime) {
		// this.appointmentEndTime = appointmentEndTime;
		String time = appointmentEndTime.replaceAll("\\s", "");
		Time12HoursValidator timeValidate = new Time12HoursValidator();
		timeValidate.validate(time);
		this.appointmentEndTime = timeValidate.convertTime(time);
	}

	public String getAppointmentTime() {
		Time12HoursValidator timeValidate = new Time12HoursValidator();
		return timeValidate.convertTimeBack(appointmentTime);
	}

	public void setAppointmentTime(String appointmentTime) {

		String time = appointmentTime.replaceAll("\\s", "");
		Time12HoursValidator timeValidate = new Time12HoursValidator();
		timeValidate.validate(time);
		this.appointmentTime = timeValidate.convertTime(time);
	}*/

	public Date getAppointmentTime() {
		return appointmentTime;
	}

	public void setAppointmentTime(Date appointmentTime) {
		this.appointmentTime = appointmentTime;
	}

	public Date getAppointmentEndTime() {
		return appointmentEndTime;
	}

	public void setAppointmentEndTime(Date appointmentEndTime) {
		this.appointmentEndTime = appointmentEndTime;
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
		return id;
	}

	public void setId(AppointmentKey id) {
		this.id = id;

	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}
