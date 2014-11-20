package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.PrimeDao;
import com.gp.domain.Prime;
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class PrimeServiceImpl implements PrimeService {

	@Autowired
	private PrimeDao primeDao;
	@Override
	public Prime trouverParId(Integer num) {
		// TODO Auto-generated method stub
		return primeDao.trouverParId(num);
	}

	@Override
	public void enregistrer(Prime prime) {
		primeDao.enregistrer(prime);

	}

	@Override
	public boolean supprimer(Prime prime) {
		// TODO Auto-generated method stub
		return primeDao.supprimer(prime);
	}

}
