package com.atai.dental.module.trment.model;

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
@Table(name = "main_treatment_type_tab")
public class MainTreatmentType implements Model<String> {

	@Id
	@Column(name = "mtt_id")
	private String mttId;
	@Column(name = "mtt_name")
	private String mttName;
	@Column(name = "mtt_description")
	private String mttDescription;
	private String objid;
	
	
	public String getMttId() {
		return mttId;
	}

	public void setMttId(String mttId) {
		this.mttId = mttId;
	}

	public String getMttName() {
		return mttName;
	}

	public void setMttName(String mttName) {
		this.mttName = mttName;
	}

	public String getMttDescription() {
		return mttDescription;
	}

	public void setMttDescription(String mttDescription) {
		this.mttDescription = mttDescription;
	}

	public String getObjid() {
		return objid;
	}

	public void setObjid(String objid) {
		this.objid = objid;
	}

	public String getId() {
		// TODO Auto-generated method stub
		return getMttId();
	}

	public void setId(String id) {
		setMttId(id);

	}

}

