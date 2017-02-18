package com.atai.dental.module.enterp.validator;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.atai.dental.module.enterp.model.Appointment;
import com.atai.dental.module.enterp.model.User;
import com.atai.dental.module.enterp.service.AppointmentService;
import com.atai.dental.module.enterp.service.UserService;

public class AppointmentValidator implements Validator{

	@Autowired
	private AppointmentService appointmentService;
	@Autowired
	private UserService userService;
	
	public boolean supports(Class<?> arg0) {
		return Appointment.class.isAssignableFrom(arg0);
	}

	public void validate(Object target, Errors errors) {
		Appointment form = (Appointment)target;
		Date appointmentDate = form.getAppointmentDate();
		String appointmentTime = form.getAppointmentTime();
		String doctorId = form.getDoctor();
		
		if(validateDoctor(errors, doctorId)){
			validateApointmentDateAndTime(errors, form);
		}
	}
	
	private boolean validateDoctor(Errors errors, String doctorName){
		User doctor = userService.findByUsername(doctorName);
        if (doctor == null) {
        	errors.reject("doctor.notExists", "Doctor "+ doctorName +" is not a regitered doctor.");
        	return false;
        }
		return true;
	}
	
	private boolean validateApointmentDateAndTime(Errors errors, Appointment appointment){
		/*if(appointmentService.AppointemtTimeExists(appointment)){
        	errors.reject("appointment.DateAndTimeExists", "Doctor a=has a appointment at this date and time.");
        	return false;
		}*/
		return true;
	}
}
