
package com.atai.dental.module.enterp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atai.dental.generic.service.AbstractService;
import com.atai.dental.module.enterp.dao.AppointmentDao;
import com.atai.dental.module.enterp.model.Appointment;
import com.atai.dental.module.enterp.model.AppointmentKey;

@Service
public class AppointmentService extends AbstractService<AppointmentKey, Appointment>{

	private AppointmentDao dao;
	
	@Autowired
	public AppointmentService(AppointmentDao dao) {
		super(dao);
		this.dao = dao;
		// TODO Auto-generated constructor stub
	}
	
	@Transactional
	public boolean AppointemtTimeExists(Appointment appointment){
		return this.dao.AppointemtTimeExists(appointment);
	}
	
}
