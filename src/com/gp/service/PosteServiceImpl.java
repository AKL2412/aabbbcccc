package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.PosteDao;
import com.gp.domain.Poste;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class PosteServiceImpl implements PosteService {
	@Autowired
	private PosteDao posteDao;
	@Override
	public Poste trouverParId(Integer num) {
		// TODO Auto-generated method stub
		return posteDao.trouverParId(num);
	}

	@Override
	public void enregistrer(Poste poste) {
		// TODO Auto-generated method stub
		posteDao.enregistrer(poste);
	}

	@Override
	public boolean supprimer(Poste poste) {
		// TODO Auto-generated method stub
		return posteDao.supprimer(poste);
	}

}
