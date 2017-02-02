package com.atai.dental.module.enterp.dao;

import org.springframework.stereotype.Repository;

import com.atai.dental.generic.dao.AbstractDao;
import com.atai.dental.module.enterp.model.Appointment;
import com.atai.dental.module.enterp.model.AppointmentKey;

@Repository
public class AppointmentDao extends AbstractDao<AppointmentKey, Appointment> {

}

