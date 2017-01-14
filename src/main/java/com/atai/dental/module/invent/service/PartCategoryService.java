package com.atai.dental.module.invent.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.dental.generic.service.AbstractService;
import com.atai.dental.module.invent.dao.PartCategoryDao;
import com.atai.dental.module.invent.model.PartCategory;

@Service
public class PartCategoryService extends AbstractService<String, PartCategory> {

	@Autowired
	public PartCategoryService(PartCategoryDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}

}
