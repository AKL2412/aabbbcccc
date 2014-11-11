package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.SalariebaremeDao;
import com.gp.domain.Salariebareme;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class SalariebaremeServiceImpl implements SalariebaremeService {
	@Autowired
	private SalariebaremeDao baremeDao;
	@Override
	public Salariebareme trouverParId(Integer id) {
		// TODO Auto-generated method stub
		return baremeDao.trouverParId(id);
	}

	@Override
	public void enregistrer(Salariebareme bareme) {
		baremeDao.enregistrer(bareme);

	}

	@Override
	public boolean supprimer(Salariebareme bareme) {
		// TODO Auto-generated method stub
		return baremeDao.supprimer(bareme);
	}

}
