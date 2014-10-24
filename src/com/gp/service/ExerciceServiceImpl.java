package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.ExerciceDao;
import com.gp.domain.Exercice;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class ExerciceServiceImpl implements ExerciceService {
	@Autowired
	private ExerciceDao exerciceDao;
	@Override
	public Exercice trouverParId(Integer id) {
		// TODO Auto-generated method stub
		return exerciceDao.trouverParId(id);
	}

	@Override
	public void enregistrer(Exercice exercice) {
		// TODO Auto-generated method stub
		exerciceDao.enregistrer(exercice);
	}

	@Override
	public boolean supprimer(Exercice exercice) {
		// TODO Auto-generated method stub
		return exerciceDao.supprimer(exercice);
	}

}
