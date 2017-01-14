package com.atai.dental.module.invent.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.atai.dental.generic.interfaces.Model;

@Entity
@Table(name = "part_category_tab")
public class PartCategory implements Model<String> {

	@Id
	private String category;
	private String description;
	private String objid;
	
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getObjid() {
		return objid;
	}

	public void setObjid(String objid) {
		this.objid = objid;
	}

	public String getId() {
		// TODO Auto-generated method stub
		return category;
	}

	public void setId(String id) {
		this.category = id;

	}

}
