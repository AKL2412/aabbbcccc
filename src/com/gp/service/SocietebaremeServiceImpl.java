package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.SocietebaremeDao;
import com.gp.domain.Societebareme;

@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class SocietebaremeServiceImpl implements SocietebaremeService {

	@Autowired
	private SocietebaremeDao baremeDao;
	@Override
	public Societebareme trouverParId(Integer id) {
		// TODO Auto-generated method stub
		return baremeDao.trouverParId(id);
	}

	@Override
	public void enregistrer(Societebareme bareme) {
		// TODO Auto-generated method stub
		baremeDao.enregistrer(bareme);
	}

	@Override
	public boolean supprimer(Societebareme bareme) {
		// TODO Auto-generated method stub
		return baremeDao.supprimer(bareme);
	}

}
