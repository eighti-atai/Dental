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
import com.atai.dental.module.enterp.model.Patient;
import com.atai.dental.module.enterp.service.PatientService;

@RestController
public class PatientController extends AbstractController<Integer, Patient>{

	@Autowired
	public PatientController(PatientService service) {
		super(service, Integer.class, "payments");
		// TODO Auto-generated constructor stub
	}

	@Override
	@GetMapping(value = "/payments")
	public ModelAndView init(Model model) {
		// TODO Auto-generated method stub
		return super.init(model);
	}

	@Override
	@GetMapping(value = "/Payment")
	public ResponseEntity<List<Patient>> list() {
		// TODO Auto-generated method stub
		return super.list();
	}

	@Override
	@PostMapping(value = "/Payment")
	public ResponseEntity<Void> add(@RequestBody Patient object) {
		// TODO Auto-generated method stub
		return super.add(object);
	}

	@Override
	@PutMapping(value = "/Payment")
	public ResponseEntity<Patient> modify(@RequestBody Patient newObject) {
		// TODO Auto-generated method stub
		return super.modify(newObject);
	}

	@Override
	@DeleteMapping(value = "/Payment/{objid:.+}")
	public ResponseEntity<Patient> delete(@PathVariable String objid) {
		// TODO Auto-generated method stub
		return super.delete(objid);
	}

	@Override
	@PostMapping(value = "/Payment/Search")
	public ResponseEntity<List<Patient>> search(@RequestBody Patient object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	
}
