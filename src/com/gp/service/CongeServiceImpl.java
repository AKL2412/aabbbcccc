package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.CongeDao;
import com.gp.domain.Conge;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class CongeServiceImpl implements CongeService {

	@Autowired
	private CongeDao congeDao;
	@Override
	public Conge trouverParId(Integer num) {
		// TODO Auto-generated method stub
		return congeDao.trouverParId(num);
	}

	@Override
	public void enregistrer(Conge contrat) {
		// TODO Auto-generated method stub
		congeDao.enregistrer(contrat);
	}

	@Override
	public boolean supprimer(Conge contrat) {
		// TODO Auto-generated method stub
		return congeDao.supprimer(contrat);
	}

}
