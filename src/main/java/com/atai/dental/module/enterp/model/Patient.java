package com.atai.dental.module.enterp.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.atai.dental.generic.interfaces.Model;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.DateSerializer;

@Entity
@Table(name = "payment_tab")
public class Patient implements Model<Integer> {

	@Id
	@Column(name = "payment_no")
	private int paymentNo;
	@Column(name = "payment_type")
	private String paymentType;
	@Column(name = "payment_method")
	private String paymentMethod;
	@Column(name = "cheque_no")
	private String chequeNo;
	@Column(name = "cheque_exp_date")
	private Date chequeExpDate;
	@Column(name = "cheque_bank")
	private String chequeBank;
	private String objid;
	
	
	public String getObjid() {
		return objid;
	}

	public void setObjid(String objid) {
		this.objid = objid;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
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

	//@JsonSerialize(using=DateSerializer.class)
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

	public Integer getId() {
		// TODO Auto-generated method stub
		return getPaymentNo();
	}

	public void setId(Integer id) {
		setPaymentNo(id);

	}

}
