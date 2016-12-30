package com.atai.dental.module.trment.model;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.atai.dental.generic.interfaces.Model;
import com.atai.dental.module.enterp.model.Patient;

@Entity
@Table(name = "treatment_tab")
public class Treatment implements Model<TreatmentKey> {

	

	@Id
	private TreatmentKey key;

	
	@ManyToOne
	@JoinColumn(name = "patient_id", referencedColumnName = "patient_id", insertable = false, updatable = false)
	private Patient patient;
	
	@Column(name = "treatment_main_type")
	private String treatmentMainType;
	@Column(name = "treatment_sub_type")
	private String treatmentSubType;
	@Column(name = "treatment_desc")
	private String treatmentDesc;
	@Column(name = "treatment_image")
	private byte[] treatmentImage;
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
	
	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public void setKey(TreatmentKey key) {
		this.key = key;
	}
	
	public TreatmentKey getKey() {
		return key;
	}
	
	public void setKey(int patientId, int treatmentId)
	{
		this.key.setPatientId(patientId);
		this.key.setTreatmentId(treatmentId);
	}
	
	public String getObjid() {
		return objid;
	}

	public void setObjid(String objid) {
		this.objid = objid;
	}

	public TreatmentKey getId() {
		// TODO Auto-generated method stub
		return getKey();
	}

	public void setId(TreatmentKey key) {
		setKey(key);

	}

	public String getTreatmentMainType() {
		return treatmentMainType;
	}

	public void setTreatmentMainType(String treatmentMainType) {
		this.treatmentMainType = treatmentMainType;
	}

	public String getTreatmentSubType() {
		return treatmentSubType;
	}

	public void setTreatmentSubType(String treatmentSubType) {
		this.treatmentSubType = treatmentSubType;
	}

	public String getTreatmentDesc() {
		return treatmentDesc;
	}

	public void setTreatmentDesc(String treatmentDesc) {
		this.treatmentDesc = treatmentDesc;
	}

	public byte[] getTreatmentIimage() {
		return treatmentImage;
	}

	public void setTreatmentImage(byte[] treatmentImage) {		
		this.treatmentImage = treatmentImage;
	}

	public String getTreatmentStat() {
		return treatmentStat;
	}

	public void setTreatmentStat(String treatmentStat) {
		this.treatmentStat = treatmentStat;
	}

	public String getTreatmentPaidStat() {
		return treatmentPaidStat;
	}

	public void setTreatment_paid_stat(String treatmentPaidStat) {
		this.treatmentPaidStat = treatmentPaidStat;
	}

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

}
