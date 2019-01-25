package com.atai.dental.module.trment.model;
import java.sql.Blob;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;

import com.atai.dental.generic.interfaces.Model;
import com.atai.dental.module.enterp.dao.PatientDao;
import com.atai.dental.module.enterp.model.Patient;
import com.atai.dental.module.enterp.service.PatientService;

@Entity
@Table(name = "treatment_tab")
public class Treatment implements Model<TreatmentKey> {

	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private TreatmentKey id;

	
	/*@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "treatment_id")
	private int treatmentId;*/
	
//	@ManyToOne
//	@JoinColumn(name = "patient_id", referencedColumnName = "patient_id", insertable = false, updatable = false)
//	private Patient patient;
	
	@Column(name = "treatment_main_type")
	private String mttId;
	@Column(name = "treatment_sub_type")
	private String sttId;
	@Column(name = "treatment_desc")
	private String treatmentDesc;
	@Column(name = "treatment_image")
	private String treatmentImage;
	@Column(name = "treatment_stat")
	private String treatmentStat;
	@Column(name = "treatment_paid_stat")
	private String treatmentPaidStat;
	@Column(name = "treatment_doctor")
	private String treatmentDoctor;
	@Column(name = "treatment_date")
	private Date treatmentDate;
	@Column(name = "treatment_amount")
	private Double treatmentAmount;
	@Column(name = "treatment_discount")
	private Double treatmentDiscount;
	@Column(name = "treatment_total")
	private Double treatmentTotal;
	@Column(name = "treatment_paid")
	private Double treatmentPaid;
	private String objid;
	
	//@Transient
	//private String patientName;
	
	@ManyToOne
	@JoinColumn(name = "patient_id", referencedColumnName = "patient_id", insertable = false, updatable = false)
	private Patient patient;
	
//	public Patient getPatient() {
//		return patient;
//	}
//
//	public void setPatient(Patient patient) {
//		this.patient = patient;
//	}

	/*public void setId(TreatmentKey key) {
		this.key = key;
	}
	
	public TreatmentKey getKey() {
		return key;
	}*/
	
	public void setKey(int patientId, int treatmentId)
	{
		this.id.setPatientId(patientId);
		this.id.setTreatmentId(treatmentId);
	}
	
	public String getObjid() {
		return objid;
	}

	public void setObjid(String objid) {
		this.objid = objid;
	}

	public TreatmentKey getId() {
		// TODO Auto-generated method stub
		return id;
	}

	public void setId(TreatmentKey id) {
		this.id = id;

	}

	public String getmttId() {
		return mttId;
	}

	public void setmttId(String mttId) {
		this.mttId = mttId;
	}

	public String getsttId() {
		return sttId;
	}

	public void setsttId(String sttId) {
		this.sttId = sttId;
	}

	public String getTreatmentDesc() {
		return treatmentDesc;
	}

	public void setTreatmentDesc(String treatmentDesc) {
		this.treatmentDesc = treatmentDesc;
	}

	public String getTreatmentImage() {
		return treatmentImage;
	}

	public void setTreatmentImage(String treatmentImage) {		
		this.treatmentImage = treatmentImage;
	}

	public String getTreatmentStat() {
		return treatmentStat;
	}

	public void setTreatmentStat(String treatmentStat) {
		this.treatmentStat = treatmentStat;
	}

	 @Transient
	public Patient getPatient() {	
		return patient;
	}

	// @Transient
	/*public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	 @Transient
	public String getPatientName() {
		return this.patientName ;
	}
	*/
	public String getTreatmentDoctor() {
		return treatmentDoctor;
	}

	public void setTreatmentDoctor(String treatmentDoctor) {
		this.treatmentDoctor = treatmentDoctor;
	}

	public Date getTreatmentDate() {
		return treatmentDate;
	}

	public void setTreatmentDate(Date treatmentDate) {
		this.treatmentDate = treatmentDate;
	}

	public Double getTreatmentAmount() {
		return treatmentAmount;
	}

	public void setTreatmentAmount(Double treatmentAmount) {
		this.treatmentAmount = treatmentAmount;
	}

	public Double getTreatmentDiscount() {
		return treatmentDiscount;
	}

	public void setTreatmentDiscount(Double treatmentDiscount) {
		this.treatmentDiscount = treatmentDiscount;
	}

	public Double getTreatmentTotal() {
		return treatmentTotal;
	}

	public void setTreatmentTotal(Double treatmentTotal) {
		this.treatmentTotal = treatmentTotal;
	}

	public Double getTreatmentPaid() {
		return treatmentPaid;
	}

	public void setTreatmentPaid(Double treatmentPaid) {
		this.treatmentPaid = treatmentPaid;
	}
	
	public String getTreatmentPaidStat() {
		return treatmentPaidStat;
	}

	public void setTreatment_paid_stat(String treatmentPaidStat) {
		this.treatmentPaidStat = treatmentPaidStat;
	}


}
