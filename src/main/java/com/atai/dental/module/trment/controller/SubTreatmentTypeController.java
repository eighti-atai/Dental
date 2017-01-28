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
import com.atai.dental.module.trment.model.SubTreatmentType;
import com.atai.dental.module.trment.model.SubTreatmentTypeKey;
import com.atai.dental.module.trment.service.SubTreatmentTypeService;

@RestController
public class SubTreatmentTypeController extends AbstractController<SubTreatmentTypeKey, SubTreatmentType> {
	
	@Autowired
	public SubTreatmentTypeController(SubTreatmentTypeService service) {
		super(service, SubTreatmentTypeKey.class, "SubTreatmentTypes");
		// TODO Auto-generated constructor stub
	}

	@Override
	@GetMapping(value = "/SubTreatmentTypes")
	public ModelAndView init(Model model) {
		// TODO Auto-generated method stub
		return super.init(model);
	}

	@Override
	@GetMapping(value = "/SubTreatmentType")
	public ResponseEntity<List<SubTreatmentType>> list() {
		// TODO Auto-generated method stub
		return super.list();
	}

	@Override
	@PostMapping(value = "/SubTreatmentType")
	public @ResponseBody ResponseEntity<SubTreatmentType> add(@RequestBody SubTreatmentType object) {
		// TODO Auto-generated method stub
		return super.add(object);
	}

	@Override
	@PutMapping(value = "/SubTreatmentType")
	public ResponseEntity<SubTreatmentType> modify(@RequestBody SubTreatmentType newObject) {
		// TODO Auto-generated method stub
		return super.modify(newObject);
	}

	@Override
	@DeleteMapping(value = "/SubTreatmentType/{objid:.+}")
	public ResponseEntity<SubTreatmentType> delete(@PathVariable String objid) {
		// TODO Auto-generated method stub
		return super.delete(objid);
	}

	@Override
	@PostMapping(value = "/SubTreatmentType/Search")
	public ResponseEntity<List<SubTreatmentType>> search(@RequestBody SubTreatmentType object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	@Override
	@PostMapping(value = "/SubTreatmentType/GetByKeys")
	public ResponseEntity<SubTreatmentType> getByKeys(@RequestBody SubTreatmentType object) {
		System.out.println("#####################################");
		// TODO Auto-generated method stub
		return super.getByKeys(object);
	}
}
