package com.atai.dental.module.invent.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.dental.generic.service.AbstractService;
import com.atai.dental.module.invent.dao.InventoryPartCostDao;
import com.atai.dental.module.invent.model.InventoryPartCost;
import com.atai.dental.module.invent.model.InventoryPartCostKey;

@Service
public class InventoryPartCostService extends AbstractService<InventoryPartCostKey, InventoryPartCost> {

	@Autowired
	public InventoryPartCostService(InventoryPartCostDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}

}
