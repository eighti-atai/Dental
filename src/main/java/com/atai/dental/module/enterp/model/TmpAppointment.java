
package com.atai.dental.module.enterp.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.atai.dental.generic.interfaces.Model;
import com.atai.dental.generic.other.Time12HoursValidator;

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
	@Column(name = "contact_no")
	private Integer contactNo;
	
	
	
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
		Time12HoursValidator timeValidate = new Time12HoursValidator();
		return timeValidate.convertTimeBack(time);
	}

	public void setTime(String time) {
		String timeT = time.replaceAll("\\s","");
		Time12HoursValidator timeValidate = new Time12HoursValidator();
		timeValidate.validate(timeT);
		this.time = timeValidate.convertTime(timeT);
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

	public Integer getContactNo() {
		return contactNo;
	}

	public void setContactNo(Integer contactNo) {
		this.contactNo = contactNo;
	}


}
