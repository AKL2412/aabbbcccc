package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.PaieDao;
import com.gp.domain.Paie;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class PaieServiceImpl implements PaieService {
	@Autowired
	private PaieDao paieDao;
	@Override
	public Paie trouverParId(Integer id) {
		// TODO Auto-generated method stub
		return paieDao.trouverParId(id);
	}

	@Override
	public void enregistrer(Paie paie) {
		paieDao.enregistrer(paie);

	}

	@Override
	public boolean supprimer(Paie paie) {
		// TODO Auto-generated method stub
		return paieDao.supprimer(paie);
	}

}
