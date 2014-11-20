package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.AvanceDao;
import com.gp.domain.Avance;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class AvanceServiceImpl implements AvanceService {
	@Autowired
	private AvanceDao avanceDao;
	@Override
	public Avance trouverParId(Integer num) {
		// TODO Auto-generated method stub
		return avanceDao.trouverParId(num);
	}

	@Override
	public void enregistrer(Avance avance) {
		avanceDao.enregistrer(avance);

	}

	@Override
	public boolean supprimer(Avance avance) {
		// TODO Auto-generated method stub
		return avanceDao.supprimer(avance);
	}

}
