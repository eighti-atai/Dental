package com.atai.dental.module.enterp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.dental.generic.service.AbstractService;
import com.atai.dental.module.enterp.dao.TmpAppointmentDao;
import com.atai.dental.module.enterp.model.TmpAppointment;

@Service
public class TmpAppointmentService extends AbstractService<Integer, TmpAppointment>{

	@Autowired
	public TmpAppointmentService(TmpAppointmentDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}
	
}