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
import com.atai.dental.module.invent.model.InvPartInStock;
import com.atai.dental.module.invent.model.InvPartInStockKey;
import com.atai.dental.module.invent.service.InvPartInStockService;

@RestController
public class InvPartInStockController extends AbstractController<InvPartInStockKey, InvPartInStock> {

	private final String url = "/InvPartInStock";
	private final String initUrl = "/InvPartInStocks";
	@Autowired
	public InvPartInStockController(InvPartInStockService service) {
		super(service, InvPartInStockKey.class, "InvPartInStocks");
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
	public ResponseEntity<List<InvPartInStock>> list() {
		// TODO Auto-generated method stub
		return super.list();
	}
	@Override
	@PostMapping(value = url)
	public ResponseEntity<InvPartInStock> add(@RequestBody InvPartInStock object) {
		// TODO Auto-generated method stub
		return super.add(object);
	}
	@Override
	@PutMapping(value = url)
	public ResponseEntity<InvPartInStock> modify(@RequestBody InvPartInStock newObject) {
		// TODO Auto-generated method stub
		return super.modify(newObject);
	}
	@Override
	@DeleteMapping("/InvPartInStock/{objid:.+}")
	public ResponseEntity<InvPartInStock> delete(@PathVariable("objid") String objid) {
		// TODO Auto-generated method stub
		return super.delete(objid);
	}
	@Override
	@PostMapping(value = "/InvPartInStock/Search")
	public ResponseEntity<List<InvPartInStock>> search(@RequestBody InvPartInStock object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	
}
