package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.PrimedateDao;
import com.gp.domain.Primedate;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class PrimedateServiceImpl implements PrimedateService {
	@Autowired
	private PrimedateDao primedateDao;
	@Override
	public Primedate trouverParId(Integer num) {
		// TODO Auto-generated method stub
		return primedateDao.trouverParId(num);
	}

	@Override
	public void enregistrer(Primedate prime) {
		primedateDao.enregistrer(prime);
	}

	@Override
	public boolean supprimer(Primedate prime) {
		// TODO Auto-generated method stub
		return primedateDao.supprimer(prime);
	}

}
