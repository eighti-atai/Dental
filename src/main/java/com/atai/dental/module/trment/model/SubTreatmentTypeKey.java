package com.atai.dental.module.trment.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class SubTreatmentTypeKey implements Serializable {

	@Column(name = "stt_id")
	private String sttId;
	
	@Column(name  ="mtt_id")
	private String mttId;
	
	public SubTreatmentTypeKey() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public String getSttId() {
		return sttId;
	}


	public void setSttId(String sttId) {
		this.sttId = sttId;
	}


	public String getMttId() {
		return mttId;
	}


	public void setMttId(String mttId) {
		this.mttId = mttId;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((sttId == null) ? 0 : sttId.hashCode());
		result = prime * result + ((mttId == null) ? 0 : mttId.hashCode());
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
		SubTreatmentTypeKey other = (SubTreatmentTypeKey) obj;
		if (sttId == null) {
			if (other.sttId != null)
				return false;
		} else if (!sttId.equals(other.sttId))
			return false;
		if (mttId == null) {
			if (other.mttId != null)
				return false;
		} else if (!mttId.equals(other.mttId))
			return false;
		return true;
	}

		
}
