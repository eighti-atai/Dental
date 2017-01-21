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
import com.atai.dental.module.invent.model.InventoryPartCost;
import com.atai.dental.module.invent.model.InventoryPartCostKey;
import com.atai.dental.module.invent.service.InventoryPartCostService;

@RestController
public class InventoryPartCostController extends AbstractController<InventoryPartCostKey, InventoryPartCost> {

	private final String initUrl = "/InventoryPartCosts";
	private final String url = "/InventoryPartCost";
	
	@Autowired
	public InventoryPartCostController(InventoryPartCostService service) {
		super(service, InventoryPartCostKey.class, "InventoryPartCosts");
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
	public ResponseEntity<List<InventoryPartCost>> list() {
		// TODO Auto-generated method stub
		return super.list();
	}
	@Override
	@PostMapping(value = url)
	public ResponseEntity<InventoryPartCost> add(@RequestBody InventoryPartCost object) {
		// TODO Auto-generated method stub
		return super.add(object);
	}
	@Override
	@PutMapping(value = url)
	public ResponseEntity<InventoryPartCost> modify(@RequestBody InventoryPartCost newObject) {
		// TODO Auto-generated method stub
		return super.modify(newObject);
	}
	@Override
	@DeleteMapping(value = "/InventoryPartCost/{objid:.+}")
	public ResponseEntity<InventoryPartCost> delete(@PathVariable("objid") String objid) {
		// TODO Auto-generated method stub
		return super.delete(objid);
	}
	@Override
	@PostMapping(value = "/InventoryPartCost/Search")
	public ResponseEntity<List<InventoryPartCost>> search(@RequestBody InventoryPartCost object) {
		// TODO Auto-generated ethod stub
		return super.search(object);
	}

	
}
