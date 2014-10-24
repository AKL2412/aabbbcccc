package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.AffectationDao;
import com.gp.dao.ContratDao;
import com.gp.domain.Contrat;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class ContratServiceImpl implements ContratService {
	@Autowired
	private ContratDao contratDao;
	@Override
	public Contrat trouverParId(Integer num) {
		// TODO Auto-generated method stub
		return contratDao.trouverParId(num);
	}

	@Override
	public void enregistrer(Contrat contrat) {
		// TODO Auto-generated method stub
		contratDao.enregistrer(contrat);
	}

	@Override
	public boolean supprimer(Contrat contrat) {
		// TODO Auto-generated method stub
		return contratDao.supprimer(contrat);
	}

}
