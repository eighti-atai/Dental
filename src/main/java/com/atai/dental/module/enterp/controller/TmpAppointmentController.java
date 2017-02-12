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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.atai.dental.generic.controller.AbstractController;
import com.atai.dental.module.enterp.model.TmpAppointment;
import com.atai.dental.module.enterp.service.TmpAppointmentService;

@RestController
public class TmpAppointmentController extends AbstractController<Integer, TmpAppointment>{

	@Autowired
	public TmpAppointmentController(TmpAppointmentService service) {
		super(service, Integer.class, "TmpAppointments");
		// TODO Auto-generated constructor stub
	}

	@Override
	@GetMapping(value = "/TmpAppointments")
	public ModelAndView init(Model model) {
		// TODO Auto-generated method stub
		return super.init(model);
	}

	@Override
	@GetMapping(value = "/TmpAppointment")
	public ResponseEntity<List<TmpAppointment>> list() {
		// TODO Auto-generated method stub
		return super.list();
	}

	@Override
	@PostMapping(value = "/TmpAppointment")
	public @ResponseBody ResponseEntity<TmpAppointment> add(@RequestBody TmpAppointment object) {
		// TODO Auto-generated method stub
		return super.add(object);
	}

	@Override
	@PutMapping(value = "/TmpAppointment")
	public ResponseEntity<TmpAppointment> modify(@RequestBody TmpAppointment newObject) {
		// TODO Auto-generated method stub
		return super.modify(newObject);
	}

	@Override
	@DeleteMapping(value = "/TmpAppointment/{objid:.+}")
	public ResponseEntity<TmpAppointment> delete(@PathVariable String objid) {
		// TODO Auto-generated method stub
		return super.delete(objid);
	}

	@Override
	@PostMapping(value = "/TmpAppointment/Search")
	public ResponseEntity<List<TmpAppointment>> search(@RequestBody TmpAppointment object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	@Override
	@PostMapping(value = "/TmpAppointment/GetByKeys")
	public ResponseEntity<TmpAppointment> getByKeys(@RequestBody TmpAppointment object) {
		System.out.println("#####################################");
		// TODO Auto-generated method stub
		return super.getByKeys(object);
	}
}
