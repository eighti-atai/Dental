package com.atai.dental.module.enterp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.atai.dental.generic.controller.AbstractController;
import com.atai.dental.module.enterp.model.Patient;
import com.atai.dental.module.enterp.service.PatientService;
import com.atai.dental.module.trment.model.Treatment;

/*import com.atai.dental.generic.controller.AbstractController;
import com.atai.dental.module.enterp.model.Patient;
import com.atai.dental.module.enterp.service.PatientService;*/
//@CrossOrigin(origins = "http://localhost:4200")
@RestController
public class PatientController extends AbstractController<Integer, Patient>{

	@Autowired
	public PatientController(PatientService service) {
		super(service, Integer.class, "Patients");
		// TODO Auto-generated constructor stub
	}

	@Override
	@GetMapping(value = "/Patients")
	public ModelAndView init(Model model) {
		// TODO Auto-generated method stub
		return super.init(model);
	}

	@Override
	@GetMapping(value = "/Patient")
	public ResponseEntity<List<Patient>> list() {
		// TODO Auto-generated method stub
		return super.list();
	}

	@Override
	@PostMapping(value = "/Patient")
	public @ResponseBody ResponseEntity<Patient> add(@RequestBody Patient object) {
		// TODO Auto-generated method stub
		return super.add(object);
	}

	@Override
	@PutMapping(value = "/Patient")
	public ResponseEntity<Patient> modify(@RequestBody Patient newObject) {
		// TODO Auto-generated method stub
		return super.modify(newObject);
	}

	@Override
	@DeleteMapping(value = "/Patient/{objid:.+}")
	public ResponseEntity<Patient> delete(@PathVariable String objid) {
		// TODO Auto-generated method stub
		return super.delete(objid);
	}

	@Override
	@PostMapping(value = "/Patient/Search")
	public ResponseEntity<List<Patient>> search(@RequestBody Patient object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	@Override
	@PostMapping(value = "/Patient/GetByKeys")
	public ResponseEntity<Patient> getByKeys(@RequestBody Patient object) {
		System.out.println("#####################################");
		// TODO Auto-generated method stub
		return super.getByKeys(object);
	}
}
