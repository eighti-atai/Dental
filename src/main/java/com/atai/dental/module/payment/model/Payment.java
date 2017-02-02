package com.atai.dental.module.payment.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.atai.dental.generic.interfaces.Model;
import com.atai.dental.module.trment.model.Treatment;

@Entity
@Table(name = "payment_tab")
public class Payment implements Model<PaymentKey> {

	@Id
	private PaymentKey id;
	@Column(name = "payment_date")
	private Date paymentDate;
	@Column(name = "payment_type")
	private String paymentType;
	@Column(name = "payment_method")
	private String paymentMethod;
	private Double amount;
	@Column(name = "cheque_no")
	private String chequeNo;
	@Column(name = "cheque_exp_date")
	private Date chequeExpDate;
	@Column(name = "cheque_bank")
	private String chequeBank;
	private String objid;
	
	@ManyToOne//(fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "patient_id", referencedColumnName = "patient_id", insertable = false, updatable = false),
		@JoinColumn(name = "treatment_id", referencedColumnName = "treatment_id", insertable = false, updatable  =false)
	})
	private Treatment treatment;
	
	public PaymentKey getId() {
		// TODO Auto-generated method stub
		return id;
	}

	public void setId(PaymentKey id) {
		this.id = id;

	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getChequeNo() {
		return chequeNo;
	}

	public void setChequeNo(String chequeNo) {
		this.chequeNo = chequeNo;
	}

	public Date getChequeExpDate() {
		return chequeExpDate;
	}

	public void setChequeExpDate(Date chequeExpDate) {
		this.chequeExpDate = chequeExpDate;
	}

	public String getChequeBank() {
		return chequeBank;
	}

	public void setChequeBank(String chequeBank) {
		this.chequeBank = chequeBank;
	}

	public String getObjid() {
		return objid;
	}

	public void setObjid(String objid) {
		this.objid = objid;
	}

	public Treatment getTreatment() {
		return treatment;
	}

	public void setTreatment(Treatment treatment) {
		this.treatment = treatment;
	}
	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}
	

}
