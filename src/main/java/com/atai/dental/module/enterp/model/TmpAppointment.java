
package com.atai.dental.module.enterp.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.atai.dental.generic.interfaces.Model;

@Entity
@Table(name = "tmp_appointment_tab")
public class TmpAppointment implements Model<Integer> {

	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "app_id")
	private Integer appointmentId;
	@Column(name = "patient_id")
	private Integer patientId;
	@Column(name = "org_appoinment_id")
	private Integer orgAppoinmentId;
	private String name;
	private Date date;
	private String time;
	private Integer  doctor;
	private String code;
	private String objid;
	
	
	
	public Integer getAppointmentId() {
		return appointmentId;
	}

	public void setAppointmentId(Integer appointmentId) {
		this.appointmentId = appointmentId;
	}

	public Integer getPatientId() {
		return patientId;
	}

	public void setPatientId(Integer patientId) {
		this.patientId = patientId;
	}

	public Integer getOrgAppoinmentId() {
		return orgAppoinmentId;
	}

	public void setOrgAppoinmentId(Integer orgAppoinmentId) {
		this.orgAppoinmentId = orgAppoinmentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Integer getDoctor() {
		return doctor;
	}

	public void setDoctor(Integer  doctor) {
		this.doctor = doctor;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getObjid() {
		return objid;
	}

	public void setObjid(String objid) {
		this.objid = objid;
	}

	public Integer getId() {
		// TODO Auto-generated method stub
		return getAppointmentId();
	}

	public void setId(Integer id) {
		setAppointmentId(id);

	}
//	public String getAppointmentTime() {
//		return appointmentTime;
//	}
//
//	public void setAppointmentTime(String appointmentTime) {
//		
//		String time = appointmentTime.replaceAll("\\s","");
//		if(time.length()>2){
//			String s = time.substring(time.length()-1, time.length());
//			/*if(s.toLowerCase()=="pm")
//			{
//				string
//			}*/
//			
//			time = time.substring(0, time.length()-2);
//			time = time+":00";
//		}
//		
//		System.out.println("########### "+time );
//		this.appointmentTime = time;
//	}

}
