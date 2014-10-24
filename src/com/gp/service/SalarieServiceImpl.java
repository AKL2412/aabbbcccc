package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.SalarieDao;
import com.gp.domain.Salarie;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class SalarieServiceImpl implements SalarieService {

	@Autowired
	private SalarieDao salarieDao;
	@Override
	public void enregistrer(Salarie s) {
		// TODO Auto-generated method stub
		salarieDao.enregistrer(s);
	}

	@Override
	public boolean supprimer(Salarie s) {
		// TODO Auto-generated method stub
		return salarieDao.supprimer(s);
	}

}
