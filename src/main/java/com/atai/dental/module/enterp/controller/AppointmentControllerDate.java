

package com.atai.dental.module.enterp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.atai.dental.generic.controller.AbstractController;
import com.atai.dental.module.enterp.model.Appointment;
import com.atai.dental.module.enterp.model.AppointmentKey;
import com.atai.dental.module.enterp.service.AppointmentService;


@RestController
public class AppointmentControllerDate extends AbstractController<AppointmentKey, Appointment>{

	@Autowired
	public AppointmentControllerDate(AppointmentService service) {
		super(service, AppointmentKey.class, "AppointmentsDates");
		System.out.println("Appointment dates entity");
		// TODO Auto-generated constructor stub
	}

	@Override
	@GetMapping(value = "/AppointmentsDates")
	public ModelAndView init(Model model) {
		// TODO Auto-generated method stub
		return super.init(model);
	}

	@Override
	@GetMapping(value = "/AppointmentsDate")
	public ResponseEntity<List<Appointment>> list() {
		// TODO Auto-generated method stub
		return super.list();
	}

	@Override
	@PostMapping(value = "/AppointmentsDate/Search")
	public ResponseEntity<List<Appointment>> search(@RequestBody Appointment object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	@Override
	@DeleteMapping(value = "/AppointmentsDate/{objid:.+}")
	public ResponseEntity<Appointment> delete(@PathVariable("objid") String objid) {
		// TODO Auto-generated method stub
		return super.delete(objid);
	}

	
}

