package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.PrimesalarieDao;
import com.gp.domain.Primesalarie;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class PrimesalarieServiceImpl implements PrimesalarieService {
	@Autowired
	private PrimesalarieDao primesalarieDao;
	@Override
	public Primesalarie trouverParId(Integer num) {
		// TODO Auto-generated method stub
		return primesalarieDao.trouverParId(num);
	}

	@Override
	public void enregistrer(Primesalarie primesalarie) {
		primesalarieDao.enregistrer(primesalarie);

	}

	@Override
	public boolean supprimer(Primesalarie primesalarie) {
		// TODO Auto-generated method stub
		return primesalarieDao.supprimer(primesalarie);
	}

}
