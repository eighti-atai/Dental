package com.atai.dental.module.trment.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.atai.dental.generic.controller.AbstractController;
import com.atai.dental.module.enterp.dao.PatientDao;
import com.atai.dental.module.enterp.model.Patient;
import com.atai.dental.module.enterp.service.PatientService;
import com.atai.dental.module.trment.model.Treatment;
import com.atai.dental.module.trment.model.TreatmentKey;
import com.atai.dental.module.trment.service.TreatmentService;

@Transactional
@RestController
public class TreatmentController extends AbstractController<TreatmentKey, Treatment>{

	@Autowired
	PatientService patientService;
	@Autowired
	public TreatmentController(TreatmentService service) {
		super(service, TreatmentKey.class, "Treatments");
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

	 @Autowired
	    private SessionFactory sessionFactory;
	 
	    protected Session getSession(){
	        return sessionFactory.getCurrentSession();
	    }
	    
	@Override
	@PostMapping(value = "/Treatment/Search")
	public ResponseEntity<List<Treatment>> search(@RequestBody Treatment object) {
		// TODO Auto-generated method stub
		return super.search(object);
	}

	@Override
	@PostMapping(value = "/Treatment/GetByKeys")
	public ResponseEntity<Treatment> getByKeys(@RequestBody Treatment object) {
		// TODO Auto-generated method stub
		return super.getByKeys(object);
	}
	
	@Override
	@PostMapping(value = "/Treatment/Validate")
	public ResponseEntity<Treatment> validate(@RequestBody Treatment object,@RequestBody Model entity) {
		// TODO Auto-generated method stub
		//String a = 
		System.out.println(entity.toString()+" XXXXX object will be added");
		return super.validate(object,entity);
	}
	
	/*@RequestMapping(value = "/Treatment/Validate", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Treatment> getTreatment(@RequestBody Treatment treatment) {
        System.out.println("Fetching Sales Part with id XXXXXXXXXXXX"+ treatment.getId().getPatientId());
       // PatientService patientService = new PatientService(PatientDao);
        Patient patient = patientService.getByKey(treatment.getId().getPatientId());
        if (patient == null) {
            System.out.println("Sales Part with id " + "" + " not found");
            return new ResponseEntity<Treatment>(HttpStatus.NOT_FOUND);
        }
        treatment.setTreatment_paid_stat(patient.getPatientName());
        return new ResponseEntity<Treatment>(treatment, HttpStatus.OK);
    }*/
	
}

