package com.atai.dental.module.enterp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.dental.generic.service.AbstractService;
import com.atai.dental.module.enterp.dao.PatientDao;
import com.atai.dental.module.enterp.model.Patient;

@Service
public class PatientService extends AbstractService<Integer, Patient>{

	@Autowired
	public PatientService(PatientDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}
	
}
