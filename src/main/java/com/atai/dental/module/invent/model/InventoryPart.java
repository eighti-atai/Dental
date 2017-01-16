package com.atai.dental.module.invent.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.atai.dental.generic.interfaces.Model;

@Entity
@Table(name="inventory_part_tab")
public class InventoryPart implements Model<String>{
	
	@Id
	@Column(name = "inv_part_no")
	private String  invPartNo;
	
	public String getInvPartNo() {
		return invPartNo;
	}
	public void setInvPartNo(String invPartNo) {
		this.invPartNo = invPartNo;
	}
	private String description;
	
	@Column(name="uom_id")
	private String uomId;
	
	private String objid;

	
	@Column(name="reorder_level")
	private double reorderLevel;
	
	@Column(name="safety_stock_level")
	private double safetyStockLevel;
	
	private String category;
	
	@OneToOne
	@JoinColumn(name = "category", referencedColumnName = "category", insertable = false, updatable = false)
	private PartCategory partCategory;
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUomId() {
		return uomId;
	}
	public void setUomId(String uom) {
		this.uomId = uom;
	}
	public double getReorderLevel() {
		return reorderLevel;
	}
	public void setReorderLevel(double reorderLevel) {
		this.reorderLevel = reorderLevel;
	}
	public double getSafetyStockLevel() {
		return safetyStockLevel;
	}
	public void setSafetyStockLevel(double safetyStockLevel) {
		this.safetyStockLevel = safetyStockLevel;
	}
	public String getObjid() {
		return objid;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public PartCategory getPartCategory() {
		return partCategory;
	}
	public void setPartCategory(PartCategory partCategory) {
		this.partCategory = partCategory;
	}
	public void setObjid(String objid) {
		this.objid = objid;
	}
	
	public boolean isNew()
	{
		return (this.objid== null);
	}
	public String getId() {
		// TODO Auto-generated method stub
		return invPartNo;
	}
	public void setId(String id) {
		this.invPartNo = id;
		
	}
}
