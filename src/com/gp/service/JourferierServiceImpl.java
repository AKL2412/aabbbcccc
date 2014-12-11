package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.JourferierDao;
import com.gp.domain.Tableferier;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class JourferierServiceImpl implements JourferierService {
	@Autowired
	private JourferierDao ferierDao;
	@Override
	public Tableferier trouverParId(Integer num) {
		// TODO Auto-generated method stub
		return ferierDao.trouverParId(num);
	}

	@Override
	public void enregistrer(Tableferier ferier) {
		ferierDao.enregistrer(ferier);

	}

	@Override
	public boolean supprimer(Tableferier ferier) {
		// TODO Auto-generated method stub
		return ferierDao.supprimer(ferier);
	}

}
