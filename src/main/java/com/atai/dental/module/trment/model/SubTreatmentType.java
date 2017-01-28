
package com.atai.dental.module.trment.model;
import java.sql.Blob;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.atai.dental.generic.interfaces.Model;

@Entity
@Table(name = "sub_treatment_type_tab")
public class SubTreatmentType implements Model<SubTreatmentTypeKey> {

	@Id
	private SubTreatmentTypeKey id;

	
	@ManyToOne
	@JoinColumn(name = "mtt_id", referencedColumnName = "mtt_id", insertable = false, updatable = false)
	private MainTreatmentType mainTreatmentType;
	
	@Column(name = "stt_name")
	private String treatmentName;
	@Column(name = "stt_amount")
	private Double treatmentAmount;
	private String objid;

	
	public MainTreatmentType getMainTreatmentType() {
		return mainTreatmentType;
	}

	public void setMainTreatmentType(MainTreatmentType mainTreatmentType) {
		this.mainTreatmentType = mainTreatmentType;
	}

	public String getTreatmentName() {
		return treatmentName;
	}

	public void setTreatmentName(String treatmentName) {
		this.treatmentName = treatmentName;
	}

	public Double getTreatmentAmount() {
		return treatmentAmount;
	}

	public void setTreatmentAmount(Double treatmentAmount) {
		this.treatmentAmount = treatmentAmount;
	}

	public String getObjid() {
		return objid;
	}

	public void setObjid(String objid) {
		this.objid = objid;
	}

	public SubTreatmentTypeKey getId() {
		// TODO Auto-generated method stub
		return id;
	}

	public void setId(SubTreatmentTypeKey id) {
		this.id = id;

	}

}
