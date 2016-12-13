

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
import com.atai.dental.module.enterp.model.Appointment;
import com.atai.dental.module.enterp.service.AppointmentService;


@RestController
public class AppointmentController extends AbstractController<Integer, Appointment>{

	@Autowired
	public AppointmentController(AppointmentService service) {
		super(service, Integer.class, "Appointments");
		// TODO Auto-generated constructor stub
	}

	@Override
	@GetMapping(value = "/Appointments")
	public ModelAndView init(Model model) {
		// TODO Auto-generated method stub
		return super.init(model);
	}

	@Override
	@GetMapping(value = "/Appointment")
	public ResponseEntity<List<Appointment>> list() {
		// TODO Auto-generated method stub
		return super.list();
	}

	@Override
	@PostMapping(value = "/Appointment")
	public ResponseEntity<Void> add(@RequestBody Appointment object) {
		// TODO Auto-generated method stub
		return super.add(object);
	}

	@Override
	@PutMapping(value = "/Appointment")
	public ResponseEntity<Appointment> modify(@RequestBody Appointment newObject) {
		// TODO Auto-generated method stub
		return super.modify(newObject);
	}

	@Override
	@DeleteMapping(value = "/Appointment/{objid:.+}")
	public ResponseEntity<Appointment> delete(@PathVariable String objid) {
		// TODO Auto-generated method stub
		return super.delete(objid);
	}

	@Override
	@PostMapping(value = "/Appointment/Search")
	public ResponseEntity<List<Appointment>> search(@RequestBody Appointment object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	
}

