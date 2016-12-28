package com.atai.dental.module.enterp.model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.atai.dental.generic.interfaces.Model;

	
@Entity
@Table(name = "attend_patient_tab")
public class AttendPatient implements Model<AttendPatientKey> {
	@Id
	private AttendPatientKey key;

	
	@ManyToOne
	@JoinColumn(name = "patient_id", referencedColumnName = "patient_id", insertable = false, updatable = false)
	private Patient patient;
	
	private String doctor;
	@Column(name = "start_time")
	private String startTime;
	private String done;
	private String objid;
	
	
	public String getDoctor() {
		return doctor;
	}

	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}

	public String getStartTime() {
		String hms =  "";
		//if(startTime.length() > 0)
		if (startTime != null && !startTime.isEmpty()) 
		{
			SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
			Date date1 = new Date();
			Date date2 = new Date();;
			String timeStamp = new SimpleDateFormat("HH:mm:ss").format(Calendar.getInstance().getTime());
			try {
				date1 = format.parse(startTime);
				date2 = format.parse(timeStamp); 
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			long difference = date2.getTime() - date1.getTime();
			hms = String.format("%02d:%02d:%02d", TimeUnit.MILLISECONDS.toHours(difference),
		            TimeUnit.MILLISECONDS.toMinutes(difference) - TimeUnit.HOURS.toMinutes(TimeUnit.MILLISECONDS.toHours(difference)),
		            TimeUnit.MILLISECONDS.toSeconds(difference) - TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(difference)));
		}
		return hms;
	}

	public void setStartTime(String startTime) {
		String timeStamp = new SimpleDateFormat("HH:mm:ss").format(Calendar.getInstance().getTime());
		this.startTime = timeStamp;
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

	public void setKey(AttendPatientKey key) {
		this.key = key;
	}
	
	public AttendPatientKey getKey() {
		return key;
	}
	
	public void setKey(int patientId, int attendPatientId)
	{
		this.key.setAttendPatientId(attendPatientId);
		this.key.setPatientId(patientId);
		
	}


	public String getObjid() {
		return objid;
	}

	public void setObjid(String objid) {
		this.objid = objid;
	}

	public AttendPatientKey getId() {
		// TODO Auto-generated method stub
		return getKey();
	}

	public void setId(AttendPatientKey key) {
		setKey(key);

	}

	
	

}
