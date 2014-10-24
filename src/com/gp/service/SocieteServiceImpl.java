package com.gp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.SocieteDao;
import com.gp.domain.Societe;

@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class SocieteServiceImpl implements SocieteService {

	@Autowired
	private SocieteDao societeDao;

	@Override
	public List<Societe> trouverParIntitule(String intitule) {
		// TODO Auto-generated method stub
		return societeDao.trouverParIntitule(intitule);
	}

	@Override
	public void enregistrer(Societe societe) {
		// TODO Auto-generated method stub
		societeDao.enregistrer(societe);
		
	}

	@Override
	public boolean supprimer(Societe societe) {
		// TODO Auto-generated method stub
		return societeDao.supprimer(societe);
	}

	@Override
	public List<Societe> trouverTous() {
		// TODO Auto-generated method stub
		return societeDao.trouverTous();
	}

	@Override
	public Societe trouverParSlug(String slug) {
		// TODO Auto-generated method stub
		return societeDao.trouverParSlug(slug);
	}
}
