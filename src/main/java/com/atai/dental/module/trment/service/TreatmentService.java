package com.atai.dental.module.trment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.dental.generic.service.AbstractService;
import com.atai.dental.module.trment.dao.TreatmentDao;
import com.atai.dental.module.trment.model.Treatment;
import com.atai.dental.module.trment.model.TreatmentKey;

@Service
public class TreatmentService extends AbstractService<TreatmentKey, Treatment>{

	@Autowired
	public TreatmentService(TreatmentDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}
	
}
