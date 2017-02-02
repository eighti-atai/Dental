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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.atai.dental.generic.controller.AbstractController;
import com.atai.dental.module.enterp.service.PatientService;
import com.atai.dental.module.trment.model.Treatment;
import com.atai.dental.module.trment.model.TreatmentKey;
import com.atai.dental.module.trment.service.TreatmentService;


@RestController
public class TreatmentControllerQuery extends AbstractController<TreatmentKey, Treatment>{

	@Autowired
	PatientService patientService;
	@Autowired
	public TreatmentControllerQuery(TreatmentService service) {
		super(service, TreatmentKey.class, "TreatmentQueries");
		// TODO Auto-generated constructor stub
	}

	@Override
	@GetMapping(value = "/TreatmentQueries")
	public ModelAndView init(Model model) {
		// TODO Auto-generated method stub
		return super.init(model);
	}

	@Override
	@GetMapping(value = "/TreatmentQuery")
	public ResponseEntity<List<Treatment>> list() {
		// TODO Auto-generated method stub
		return super.list();
	}

	
	@Override
	@PostMapping(value = "/TreatmentQuery/Search")
	public ResponseEntity<List<Treatment>> search(@RequestBody Treatment object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	@Override
	@PostMapping(value = "/TreatmentQuery/GetByKeys")
	public ResponseEntity<Treatment> getByKeys(@RequestBody Treatment object) {
		// TODO Auto-generated method stub
		return super.getByKeys(object);
	}
	
	@Override
	@PostMapping(value = "/TreatmentQuery")
	public ResponseEntity<Treatment> add(@RequestBody Treatment object) {
		return null;
	}

	@Override
	@PutMapping(value = "/TreatmentQuery")
	public ResponseEntity<Treatment> modify(@RequestBody Treatment newObject) {
		return null;
	}

	@Override
	@DeleteMapping(value = "/TreatmentQuery/{objid:.+}")
	public ResponseEntity<Treatment> delete(@PathVariable String objid) {
		return null;
	}
		
}


