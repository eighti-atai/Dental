package com.atai.dental.module.invent.controller;

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
import com.atai.dental.module.invent.model.PartCategory;
import com.atai.dental.module.invent.service.PartCategoryService;

@RestController
public class PartCategoryController extends AbstractController<String, PartCategory> {

	private final String initUrl = "/PartCategories";
	private final String url = "/PartCategory";
	
	@Autowired
	public PartCategoryController(PartCategoryService service) {
		super(service, String.class, "PartCategories");
		// TODO Auto-generated constructor stub
	}
	
	@Override
	@GetMapping(value = initUrl)
	public ModelAndView init(Model model) {
		// TODO Auto-generated method stub
		return super.init(model);
	}

	@Override
	@GetMapping(value = url)
	public ResponseEntity<List<PartCategory>> list() {
		// TODO Auto-generated method stub
		return super.list();
	}

	@Override
	@PostMapping(value = url)
	public ResponseEntity<PartCategory> add(@RequestBody PartCategory object) {
		// TODO Auto-generated method stub
		return super.add(object);
	}

	@Override
	@PutMapping(value = url)
	public ResponseEntity<PartCategory> modify(@RequestBody PartCategory newObject) {
		// TODO Auto-generated method stub
		return super.modify(newObject);
	}

	@Override
	@DeleteMapping(value  = "/PartCategory/{objid:.+}")
	public ResponseEntity<PartCategory> delete(@PathVariable("objid") String objid) {
		// TODO Auto-generated method stub
		return super.delete(objid);
	}

	@Override
	@PostMapping(value = "/PartCategory/Search")
	public ResponseEntity<List<PartCategory>> search(@RequestBody PartCategory object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	

}
