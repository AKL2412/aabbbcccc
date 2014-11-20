package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.ParametreDao;
import com.gp.domain.Parametre;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class ParametreServiceImpl implements ParametreService {

	@Autowired
	private ParametreDao paremetreDao;
	@Override
	public Parametre trouverParId(Integer num) {
		// TODO Auto-generated method stub
		return paremetreDao.trouverParId(num);
	}

	@Override
	public void enregistrer(Parametre parametre) {
		// TODO Auto-generated method stub
		paremetreDao.enregistrer(parametre);
	}

	@Override
	public boolean supprimer(Parametre parametre) {
		// TODO Auto-generated method stub
		return paremetreDao.supprimer(parametre);
	}

}
