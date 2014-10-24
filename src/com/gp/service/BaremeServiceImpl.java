package com.gp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.BaremeDao;
import com.gp.domain.Bareme;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class BaremeServiceImpl implements BaremeService {

	@Autowired
	private BaremeDao baremeDao;
	@Override
	public Bareme trouverParId(Integer num) {
		// TODO Auto-generated method stub
		return baremeDao.trouverParId(num);
	}

	@Override
	public void enregistrer(Bareme bareme) {
		baremeDao.enregistrer(bareme);

	}

	@Override
	public boolean supprimer(Bareme bareme) {
		// TODO Auto-generated method stub
		return baremeDao.supprimer(bareme);
	}

	@Override
	public List<Bareme> trouverParCaractere(Integer caractere) {
		// TODO Auto-generated method stub
		return baremeDao.trouverParCaractere(caractere);
	}

}
