package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.EtatcivileDao;
import com.gp.domain.Etatcivile;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class EtatcivilServiceImpl implements EtatcivilService {

	@Autowired
	private EtatcivileDao etatcivileDao;
	@Override
	public Etatcivile trouverParId(Integer id) {
		// TODO Auto-generated method stub
		return etatcivileDao.trouverParId(id);
	}

	@Override
	public void enregistrer(Etatcivile etatcivile) {
		// TODO Auto-generated method stub
		etatcivileDao.enregistrer(etatcivile);
	}

	@Override
	public boolean supprimer(Etatcivile etatcivile) {
		// TODO Auto-generated method stub
		return etatcivileDao.supprimer(etatcivile);
	}

}
