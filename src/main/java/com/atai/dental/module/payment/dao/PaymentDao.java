package com.atai.dental.module.payment.dao;

import org.springframework.stereotype.Repository;

import com.atai.dental.generic.dao.AbstractDao;
import com.atai.dental.module.payment.model.Payment;
import com.atai.dental.module.payment.model.PaymentKey;

@Repository
public class PaymentDao extends AbstractDao<PaymentKey, Payment> {

}
