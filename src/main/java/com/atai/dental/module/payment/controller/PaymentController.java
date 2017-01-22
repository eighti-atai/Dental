package com.atai.dental.module.payment.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.atai.dental.generic.controller.AbstractController;
import com.atai.dental.generic.service.AbstractService;
import com.atai.dental.module.payment.model.Payment;
import com.atai.dental.module.payment.model.PaymentKey;
import com.atai.dental.module.payment.service.PaymentService;

public class PaymentController extends AbstractController<PaymentKey, Payment> {

	private final String initUrl = "/Payments";
	private final String url = "/Payment";
	@Autowired
	public PaymentController(PaymentService service) {
		super(service, PaymentKey.class, "Payments");
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
	public ResponseEntity<List<Payment>> list() {
		// TODO Auto-generated method stub
		return super.list();
	}
	@Override
	@PostMapping(value = url)
	public ResponseEntity<Payment> add(@RequestBody Payment object) {
		// TODO Auto-generated method stub
		return super.add(object);
	}
	@Override
	@PutMapping(value = url)
	public ResponseEntity<Payment> modify(@RequestBody Payment newObject) {
		// TODO Auto-generated method stub
		return super.modify(newObject);
	}
	@Override
	@DeleteMapping(value = "/Payment/{objid:.+}")
	public ResponseEntity<Payment> delete(@PathVariable("objid") String objid) {
		// TODO Auto-generated method stub
		return super.delete(objid);
	}
	@Override
	@PostMapping(value = "/Payment/Search")
	public ResponseEntity<List<Payment>> search(@RequestBody Payment object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	
}
