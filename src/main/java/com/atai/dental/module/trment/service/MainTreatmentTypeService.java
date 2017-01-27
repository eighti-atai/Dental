package com.atai.dental.module.trment.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.dental.generic.service.AbstractService;
import com.atai.dental.module.trment.dao.MainTreatmentTypeDao;
import com.atai.dental.module.trment.model.MainTreatmentType;

@Service
public class MainTreatmentTypeService extends AbstractService<Integer, MainTreatmentType>{

	@Autowired
	public MainTreatmentTypeService(MainTreatmentTypeDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}
	
}

