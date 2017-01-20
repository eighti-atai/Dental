package com.atai.dental.module.invent.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.atai.dental.generic.interfaces.Model;

@Entity
@Table(name = "inv_part_in_stock_tab")
public class InvPartInStock implements Serializable, Model<InvPartInStockKey>{
	
	@EmbeddedId
	InvPartInStockKey id;
	
	@Column(name = "stock_qty")
	private int stockQuantity;
	
	private String objid;
		
	public String getObjid() {
		return objid;
	}
	public void setObjid(String objid) {
		this.objid = objid;
	}


		
	@ManyToOne//(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumns({
		@JoinColumn(name = "inv_part_no", referencedColumnName = "inv_part_no", insertable = false, updatable = false),
		@JoinColumn(name = "inv_part_cost_no", referencedColumnName = "inv_part_cost_no", insertable = false, updatable = false)
	})
	private InventoryPartCost invPartCost;
	
	public int getStockQuantity() {
		return stockQuantity;
	}
	public void setStockQuantity(int stockQuantity) {
		this.stockQuantity = stockQuantity;
	}
	
	public InvPartInStockKey getId() {
		return id;
	}
	public void setId(InvPartInStockKey id) {
		this.id = id;
	}
	public void setId(String invPartNo, int invPartCostNo, String siteId, String invLocationId)
	{
		id.setInvPartNo(invPartNo);
		id.setInvPartCostNo(invPartCostNo);
		id.setInvLocationId(invLocationId);
	}
	
	public InventoryPartCost getInvPartCost() {
		return invPartCost;
	}
	public void setInvPartCost(InventoryPartCost invPartCost) {
		this.invPartCost = invPartCost;
	}
}
