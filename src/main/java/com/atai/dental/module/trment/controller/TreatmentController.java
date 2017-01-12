package com.atai.dental.module.trment.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

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
import com.atai.dental.module.trment.model.Treatment;
import com.atai.dental.module.trment.service.TreatmentService;


@RestController
public class TreatmentController extends AbstractController<Integer, Treatment>{

	@Autowired
	public TreatmentController(TreatmentService service) {
		super(service, Integer.class, "Treatments");
		// TODO Auto-generated constructor stub
	}

	@Override
	@GetMapping(value = "/Treatments")
	public ModelAndView init(Model model) {
		// TODO Auto-generated method stub
		return super.init(model);
	}

	@Override
	@GetMapping(value = "/Treatment")
	public ResponseEntity<List<Treatment>> list() {
		// TODO Auto-generated method stub
		return super.list();
	}

	@Override
	@PostMapping(value = "/Treatment")
	public ResponseEntity<Treatment> add(@RequestBody Treatment object) {
		// TODO Auto-generated method stub
		return super.add(object);
	}

	@Override
	@PutMapping(value = "/Treatment")
	public ResponseEntity<Treatment> modify(@RequestBody Treatment newObject) {
		// TODO Auto-generated method stub
		return super.modify(newObject);
	}

	@Override
	@DeleteMapping(value = "/Treatment/{objid:.+}")
	public ResponseEntity<Treatment> delete(@PathVariable String objid) {
		// TODO Auto-generated method stub
		return super.delete(objid);
	}

	@Override
	@PostMapping(value = "/Treatment/Search")
	public ResponseEntity<List<Treatment>> search(@RequestBody Treatment object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	/*@GetMapping(value = "/imageDisplay")
	  public ResponseEntity<Treatment> showImage() 
	          throws ServletException, IOException{


	    Treatment item = service.getByKey(key)get(itemId);        
	    response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
	    response.getOutputStream().write(item.getItemImage());


	    response.getOutputStream().close();
	}*/
	
}

