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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.atai.dental.generic.controller.AbstractController;
import com.atai.dental.generic.service.AbstractService;
import com.atai.dental.module.payment.model.Payment;
import com.atai.dental.module.payment.model.PaymentKey;
import com.atai.dental.module.payment.service.PaymentService;
import com.atai.dental.module.trment.model.Treatment;
import com.atai.dental.module.trment.model.TreatmentKey;
import com.atai.dental.module.trment.service.TreatmentService;
@RestController
public class PaymentController extends AbstractController<PaymentKey, Payment> {

	private final String initUrl = "/Payments";
	private final String url = "/Payment";
	@Autowired
	TreatmentService treatmentService;
	
	TreatmentKey tKey = new TreatmentKey();
	
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
		object.setPaymentType("cash");
		object.setPaymentMethod("cash");
		PaymentKey key = object.getId();
		ResponseEntity<Payment> res =  super.add(object);
		//Payment paymentObject = service.getByKey(key);
		tKey.setPatientId(key.getPatientId());
		tKey.setTreatmentId(key.getTreatmentId());
		Treatment treatment = treatmentService.getByKey(tKey);
		if (treatment.getTreatmentPaid()== null)
		{
			treatment.setTreatmentPaid(0.0);
		}
		treatment.setTreatmentPaid(treatment.getTreatmentPaid()+object.getAmount());
		treatmentService.update(treatment);
		return res;
	}
	@Override
	@PutMapping(value = url)
	public ResponseEntity<Payment> modify(@RequestBody Payment newObject) {
		PaymentKey key = newObject.getId();
		Double oldAmount = service.getByKey(key).getAmount();
		Double newAmount = newObject.getAmount();
		ResponseEntity<Payment> res =  super.modify(newObject);
		if (oldAmount != newAmount)
		{
			Payment paymentObject = service.getByKey(key);
			Treatment  treatment = paymentObject.getTreatment();
			treatment.setTreatmentPaid((treatment.getTreatmentPaid()- oldAmount) + newAmount);
			treatmentService.update(treatment);
		}
		return res;
	}
	@Override
	@DeleteMapping(value = "/Payment/{objid:.+}")
	public ResponseEntity<Payment> delete(@PathVariable("objid") String objid) {
		Payment paymentObject = service.getByObjid(objid);
		Double amount = paymentObject.getAmount();
		ResponseEntity<Payment> res = super.delete(objid);
		Treatment treatment = paymentObject.getTreatment();
		treatment.setTreatmentPaid(treatment.getTreatmentPaid() - amount);
		treatmentService.update(treatment);
		return res;
	}
	@Override
	@PostMapping(value = "/Payment/Search")
	public ResponseEntity<List<Payment>> search(@RequestBody Payment object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	
}
