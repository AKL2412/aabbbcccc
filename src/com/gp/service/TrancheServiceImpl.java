package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.TrancheDao;
import com.gp.domain.Tranche;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class TrancheServiceImpl implements TrancheService {

	@Autowired
	private TrancheDao trancheDao;
	@Override
	public Tranche trouverParId(Integer num) {
		// TODO Auto-generated method stub
		return trancheDao.trouverParId(num);
	}

	@Override
	public void enregistrer(Tranche tranche) {
		// TODO Auto-generated method stub
		trancheDao.enregistrer(tranche);

	}

	@Override
	public boolean supprimer(Tranche tranche) {
		// TODO Auto-generated method stub
		return trancheDao.supprimer(tranche);
	}

}
