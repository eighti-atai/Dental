package com.atai.dental.module.enterp.controller;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.atai.dental.module.enterp.model.AttendPatient;
import com.atai.dental.module.enterp.model.DoctorLov;

@RestController
public class DoctorLovController {

	@Autowired
    private SessionFactory sessionFactory;
	
	@PostMapping(value = "/DoctorLov/Search")
	@Transactional(readOnly = true)
	public ResponseEntity<List<DoctorLov>> search(@RequestBody DoctorLov object) {
		// TODO Auto-generated method stub
		
		List<DoctorLov> doctors = sessionFactory.getCurrentSession().createQuery("FROM DoctorLov").list(); 
		return new ResponseEntity<List<DoctorLov>>(doctors, HttpStatus.OK);
	}
}
