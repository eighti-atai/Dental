package com.atai.dental.module.enterp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.atai.dental.generic.controller.AbstractController;
import com.atai.dental.module.enterp.model.AttendPatient;
import com.atai.dental.module.enterp.service.AttendPatientService;


@RestController
public class AttendPatientController extends AbstractController<Integer, AttendPatient>{

	@Autowired
	public AttendPatientController(AttendPatientService service) {
		super(service, Integer.class, "AttendPatients");
		// TODO Auto-generated constructor stub
	}

	@Override
	@GetMapping(value = "/AttendPatients")
	public ModelAndView init(Model model) {
		// TODO Auto-generated method stub
		return super.init(model);
	}

	@Override
	@GetMapping(value = "/AttendPatient")
	public ResponseEntity<List<AttendPatient>> list() {
		// TODO Auto-generated method stub
		return super.list();
	}

	@Override
	@PostMapping(value = "/AttendPatient")
	public ResponseEntity<Void> add(@RequestBody AttendPatient object) {
		// TODO Auto-generated method stub
		return super.add(object);
	}

	@Override
	@PutMapping(value = "/AttendPatient")
	public ResponseEntity<AttendPatient> modify(@RequestBody AttendPatient newObject) {
		// TODO Auto-generated method stub
		return super.modify(newObject);
	}

	@Override
	@DeleteMapping(value = "/AttendPatient/{objid:.+}")
	public ResponseEntity<AttendPatient> delete(@PathVariable String objid) {
		// TODO Auto-generated method stub
		return super.delete(objid);
	}

	@Override
	@PostMapping(value = "/AttendPatient/Search")
	public ResponseEntity<List<AttendPatient>> search(@RequestBody AttendPatient object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	
}


