package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.AffectationDao;
import com.gp.domain.Affectation;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class AffectationServiceImpl implements AffectationService {

	@Autowired
	private AffectationDao affectationDao;
	@Override
	public Affectation trouverParId(Integer num) {
		// TODO Auto-generated method stub
		return affectationDao.trouverParId(num);
	}

	@Override
	public void enregistrer(Affectation affectation) {
		// TODO Auto-generated method stub
		affectationDao.enregistrer(affectation);
	}

	@Override
	public boolean supprimer(Affectation affectation) {
		// TODO Auto-generated method stub
		return affectationDao.supprimer(affectation);
	}

}
