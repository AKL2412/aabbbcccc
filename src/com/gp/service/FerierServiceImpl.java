package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.FerierDao;
import com.gp.domain.Ferier;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class FerierServiceImpl implements FerierService {
	@Autowired
	private FerierDao ferierDao;
	@Override
	public Ferier trouverParId(Integer num) {
		// TODO Auto-generated method stub
		return ferierDao.trouverParId(num);
	}

	@Override
	public void enregistrer(Ferier ferier) {
		// TODO Auto-generated method stub
		ferierDao.enregistrer(ferier);
	}

	@Override
	public boolean supprimer(Ferier ferier) {
		// TODO Auto-generated method stub
		return ferierDao.supprimer(ferier);
	}

}
