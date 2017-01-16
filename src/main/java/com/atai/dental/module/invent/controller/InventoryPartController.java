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
import com.atai.dental.module.invent.model.InventoryPart;
import com.atai.dental.module.invent.service.InventoryPartService;

@RestController
public class InventoryPartController extends AbstractController<String, InventoryPart> {

	private final String initUrl = "/InventoryParts";
	private final String url = "/InventoryPart";
	
	@Autowired
	public InventoryPartController(InventoryPartService service) {
		super(service, String.class, "InventoryParts");
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
	public ResponseEntity<List<InventoryPart>> list() {
		// TODO Auto-generated method stub
		return super.list();
	}

	@Override
	@PostMapping(value = url)
	public ResponseEntity<InventoryPart> add(@RequestBody InventoryPart object) {
		// TODO Auto-generated method stub
		return super.add(object);
	}

	@Override
	@PutMapping(value = url)
	public ResponseEntity<InventoryPart> modify(@RequestBody InventoryPart newObject) {
		// TODO Auto-generated method stub
		return super.modify(newObject);
	}

	@Override
	@DeleteMapping(value = "/InventoryPart/{objid:.+}")
	public ResponseEntity<InventoryPart> delete(@PathVariable("objid") String objid) {
		// TODO Auto-generated method stub
		return super.delete(objid);
	}

	@Override
	@PostMapping(value = "/InventoryPart/Search")
	public ResponseEntity<List<InventoryPart>> search(@RequestBody InventoryPart object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

}
