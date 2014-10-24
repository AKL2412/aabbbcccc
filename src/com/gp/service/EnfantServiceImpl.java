package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.EnfantDao;
import com.gp.domain.Enfant;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class EnfantServiceImpl implements EnfantService {

	@Autowired
	private EnfantDao enfantDao;
	@Override
	public Enfant trouverParId(Integer id) {
		// TODO Auto-generated method stub
		return enfantDao.trouverParId(id);
	}

	@Override
	public void enregistrer(Enfant etatcivile) {
		// TODO Auto-generated method stub
		enfantDao.enregistrer(etatcivile);
	}

	@Override
	public boolean supprimer(Enfant etatcivile) {
		// TODO Auto-generated method stub
		return enfantDao.supprimer(etatcivile);
	}

}
