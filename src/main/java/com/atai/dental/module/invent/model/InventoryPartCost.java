package com.atai.dental.module.invent.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import com.atai.dental.generic.interfaces.Model;

@Entity
@Table(name = "inventory_part_cost_tab")
public class InventoryPartCost implements Serializable, Model<InventoryPartCostKey>{
	
	@EmbeddedId
	private InventoryPartCostKey id;
	
	private BigDecimal cost;
	
	private String objid;
	
	public String getObjid() {
		return objid;
	}

	public void setObjid(String objid) {
		this.objid = objid;
	}

	@ManyToOne
	@JoinColumn(name = "inv_part_no", referencedColumnName = "inv_part_no", insertable = false, updatable = false)
	private InventoryPart inventoryPart;

	public InventoryPartCostKey getId() {
		return id;
	}

	public void setId(InventoryPartCostKey id) {
		this.id = id;
	}

	public BigDecimal getCost() {
		return cost;
	}

	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}

	public InventoryPart getInventoryPart() {
		return inventoryPart;
	}

	public void setInventoryPart(InventoryPart inventoryPart) {
		this.inventoryPart = inventoryPart;
	}

	
}
