package com.atai.dental.module.invent.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.dental.generic.service.AbstractService;
import com.atai.dental.module.invent.dao.InvPartInStockDao;
import com.atai.dental.module.invent.model.InvPartInStock;
import com.atai.dental.module.invent.model.InvPartInStockKey;

@Service
public class InvPartInStockService extends AbstractService<InvPartInStockKey, InvPartInStock> {

	@Autowired
	public InvPartInStockService(InvPartInStockDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}

}
