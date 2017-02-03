package com.atai.dental.module.enterp.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.atai.dental.generic.dao.AbstractDao;
import com.atai.dental.module.enterp.model.Appointment;
import com.atai.dental.module.enterp.model.AppointmentKey;

@Repository
public class AppointmentDao extends AbstractDao<AppointmentKey, Appointment> {

	@Autowired
	SessionFactory sessionFactory;
	
	public boolean AppointemtTimeExists(Appointment appointment){
		Session session = this.sessionFactory.getCurrentSession();
		AppointmentKey appointmentKey;
		//List<Appointment> appointmentList = session.createQuery("from Appointment where appointment_time = '" + appointment.getAppointmentTime()+"' and appointment_date = '"+ appointment.getAppointmentDate() +"'and doctor = '"+ appointment.getDoctor() +"'").list();
		List<Appointment> appointmentList = session.createQuery("from Appointment where appointment_time = '" + appointment.getAppointmentTime()+"' and doctor = '"+ appointment.getDoctor() +"'").list();
		if(appointment.getObjid() == null)
		{
			return !appointmentList.isEmpty();
		}
		else{
			appointmentKey = appointment.getKey();
			for (int i = 0; i < appointmentList.size(); i++) {
				if (appointmentList.get(i).getKey() == appointmentKey){
					return true;
				}
			}		
		}
		return false;
	}
}

