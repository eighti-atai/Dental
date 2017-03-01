package com.atai.dental.module.enterp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.atai.dental.generic.interfaces.Model;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.DateSerializer;

@Entity
@Table(name = "patient_tab")
public class Patient implements Model<Integer> {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "patient_id")
	private int patientId;
	@Column(name = "patient_name")
	private String patientName;
	@Column(name = "patient_address")
	private String patientAddress;
	@Column(name = "patient_id_no")
	private String patientIdNo;
	@Column(name = "patient_birth_date")
	private Date patientBirthDate;
	@Column(name = "patient_contact_no")
	private String patientContactNo;
	@Column(name = "patient_gender")
	private String patientGender;
	private String email;
	private String objid;
	@Column(name = "contact_no2")
	private String contactNo2;
	@Column(name = "contact_no_fo")
	private String contactNoFo;
	private String title;
	
	
	public String getObjid() {
		return objid;
	}

	public void setObjid(String objid) {
		this.objid = objid;
	}
	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getPatientAddress() {
		return patientAddress;
	}

	public void setPatientAddress(String patientAddress) {
		this.patientAddress = patientAddress;
	}

	public String getPatientIdNo() {
		return patientIdNo;
	}

	public void setPatientIdNo(String patientIdNo) {
		this.patientIdNo = patientIdNo;
	}

	public Date getPatientBirthDate() {
		return patientBirthDate;
	}

	public void setPatientBirthDate(Date patientBirthDate) {
		this.patientBirthDate = patientBirthDate;
	}

	public String getPatientContactNo() {
		return patientContactNo;
	}

	public void setPatientContactNo(String patientContactNo) {
		this.patientContactNo = patientContactNo;
	}

	public String getPatientGender() {
		return patientGender;
	}

	public void setPatientGender(String patientGender) {
		this.patientGender = patientGender;
	}

	public Integer getId() {
		// TODO Auto-generated method stub
		return getPatientId();
	}

	public void setId(Integer id) {
		setPatientId(id);

	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContactNo2() {
		return contactNo2;
	}

	public void setContactNo2(String contactNo2) {
		this.contactNo2 = contactNo2;
	}

	public String getContactNoFo() {
		return contactNoFo;
	}

	public void setContactNoFo(String contactNoFo) {
		this.contactNoFo = contactNoFo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}
