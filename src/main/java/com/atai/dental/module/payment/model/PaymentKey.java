package com.atai.dental.module.payment.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class PaymentKey implements Serializable{

	@Column(name = "patient_id")
	private int patient_id;
	@Column(name = "treatment_id")
	private int treatmentId;
	@Column(name = "payment_no")
	private int paymentNo;
	public int getPatient_id() {
		return patient_id;
	}
	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}
	public int getTreatmentId() {
		return treatmentId;
	}
	public void setTreatmentId(int treatmentId) {
		this.treatmentId = treatmentId;
	}
	public int getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + patient_id;
		result = prime * result + paymentNo;
		result = prime * result + treatmentId;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PaymentKey other = (PaymentKey) obj;
		if (patient_id != other.patient_id)
			return false;
		if (paymentNo != other.paymentNo)
			return false;
		if (treatmentId != other.treatmentId)
			return false;
		return true;
	}
	
	
	
}
