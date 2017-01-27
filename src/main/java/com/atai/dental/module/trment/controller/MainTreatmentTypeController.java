package com.atai.dental.module.trment.controller;

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
import com.atai.dental.module.trment.model.MainTreatmentType;
import com.atai.dental.module.trment.service.MainTreatmentTypeService;
import com.atai.dental.module.trment.model.Treatment;

/*import com.atai.dental.generic.controller.AbstractController;
import com.atai.dental.module.enterp.model.MainTreatmentType;
import com.atai.dental.module.enterp.service.MainTreatmentTypeService;*/

@RestController
public class MainTreatmentTypeController extends AbstractController<Integer, MainTreatmentType>{

	@Autowired
	public MainTreatmentTypeController(MainTreatmentTypeService service) {
		super(service, Integer.class, "MainTreatmentTypes");
		// TODO Auto-generated constructor stub
	}

	@Override
	@GetMapping(value = "/MainTreatmentTypes")
	public ModelAndView init(Model model) {
		// TODO Auto-generated method stub
		return super.init(model);
	}

	@Override
	@GetMapping(value = "/MainTreatmentType")
	public ResponseEntity<List<MainTreatmentType>> list() {
		// TODO Auto-generated method stub
		return super.list();
	}

	@Override
	@PostMapping(value = "/MainTreatmentType")
	public @ResponseBody ResponseEntity<MainTreatmentType> add(@RequestBody MainTreatmentType object) {
		// TODO Auto-generated method stub
		return super.add(object);
	}

	@Override
	@PutMapping(value = "/MainTreatmentType")
	public ResponseEntity<MainTreatmentType> modify(@RequestBody MainTreatmentType newObject) {
		// TODO Auto-generated method stub
		return super.modify(newObject);
	}

	@Override
	@DeleteMapping(value = "/MainTreatmentType/{objid:.+}")
	public ResponseEntity<MainTreatmentType> delete(@PathVariable String objid) {
		// TODO Auto-generated method stub
		return super.delete(objid);
	}

	@Override
	@PostMapping(value = "/MainTreatmentType/Search")
	public ResponseEntity<List<MainTreatmentType>> search(@RequestBody MainTreatmentType object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	@Override
	@PostMapping(value = "/MainTreatmentType/GetByKeys")
	public ResponseEntity<MainTreatmentType> getByKeys(@RequestBody MainTreatmentType object) {
		System.out.println("#####################################");
		// TODO Auto-generated method stub
		return super.getByKeys(object);
	}
}
