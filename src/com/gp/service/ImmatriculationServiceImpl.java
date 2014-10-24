package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.ImmatriculationDao;
import com.gp.domain.Immatriculation;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class ImmatriculationServiceImpl implements ImmatriculationService {

	@Autowired
	private ImmatriculationDao immatriculationDao;
	@Override
	public Immatriculation trouverParId(Integer id) {
		// TODO Auto-generated method stub
		return immatriculationDao.trouverParId(id);
	}

	@Override
	public void enregistrer(Immatriculation immatriculation) {
		// TODO Auto-generated method stub
		immatriculationDao.enregistrer(immatriculation);
	}

	@Override
	public boolean supprimer(Immatriculation immatriculation) {
		// TODO Auto-generated method stub
		return immatriculationDao.supprimer(immatriculation);
	}

}
