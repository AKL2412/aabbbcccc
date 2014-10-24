package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.CoordonneebancaireDao;
import com.gp.domain.Coordonneebancaire;
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class CoordonneebancaireServiceImpl implements CoordonneebancaireService {

	@Autowired
	private CoordonneebancaireDao coordonneebancaireDao;
	@Override
	public Coordonneebancaire trouverParId(Integer id) {
		// TODO Auto-generated method stub
		return coordonneebancaireDao.trouverParId(id);
	}

	@Override
	public void enregistrer(Coordonneebancaire coordonneebancaire) {
		coordonneebancaireDao.enregistrer(coordonneebancaire);

	}

	@Override
	public boolean supprimer(Coordonneebancaire coordonneebancaire) {
		// TODO Auto-generated method stub
		return coordonneebancaireDao.supprimer(coordonneebancaire);
	}

}
