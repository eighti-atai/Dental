package com.atai.dental.module.invent.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class InventoryPartCostKey implements Serializable {

	@Column(name  ="inv_part_no")
	private String invPartNo;
	
	@Column(name = "inv_part_cost_no")
	private int invPartCostNo;

	public InventoryPartCostKey() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getInvPartNo() {
		return invPartNo;
	}

	public void setInvPartNo(String invPartNo) {
		this.invPartNo = invPartNo;
	}

	public int getInvPartCostNo() {
		return invPartCostNo;
	}

	public void setInvPartCostNo(int invPartCostNo) {
		this.invPartCostNo = invPartCostNo;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + invPartCostNo;
		result = prime * result + ((invPartNo == null) ? 0 : invPartNo.hashCode());
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
		InventoryPartCostKey other = (InventoryPartCostKey) obj;
		if (invPartCostNo != other.invPartCostNo)
			return false;
		if (invPartNo == null) {
			if (other.invPartNo != null)
				return false;
		} else if (!invPartNo.equals(other.invPartNo))
			return false;
		return true;
	}

	
		
}
