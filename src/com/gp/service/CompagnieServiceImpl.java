package com.gp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.CompagnieDao;
import com.gp.domain.Compagnie;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class CompagnieServiceImpl implements CompagnieService {

	@Autowired
	private CompagnieDao CompagnieDao;
	@Override
	public Compagnie trouverParId(Integer id) {
		// TODO Auto-generated method stub
		return CompagnieDao.trouverParId(id);
	}

	@Override
	public void enregistrer(Compagnie compagnie) {
		// TODO Auto-generated method stub
		CompagnieDao.enregistrer(compagnie);
	}

	@Override
	public boolean supprimer(Compagnie compagnie) {
		// TODO Auto-generated method stub
		return CompagnieDao.supprimer(compagnie);
	}

	@Override
	public List<Compagnie> trouverTous() {
		// TODO Auto-generated method stub
		return CompagnieDao.trouverTous();
	}

}
