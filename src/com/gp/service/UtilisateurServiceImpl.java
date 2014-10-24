package com.gp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.UtilisateurDao;
import com.gp.domain.Utilisateur;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class UtilisateurServiceImpl implements UtilisateurService {

	@Autowired
	private UtilisateurDao utilisateurDao;
	@Override
	public Utilisateur trouverParLogin(String login) {
		// TODO Auto-generated method stub
		return utilisateurDao.trouverParLogin(login);
	}

	@Override
	public void enregistrer(Utilisateur utilisateur) {
		// TODO Auto-generated method stub
		utilisateurDao.enregistrer(utilisateur);
	}

	@Override
	public boolean supprimer(Utilisateur utilisateur) {
		// TODO Auto-generated method stub
		return utilisateurDao.supprimer(utilisateur);
	}

	@Override
	public List<Utilisateur> obtenirTous() {
		// TODO Auto-generated method stub
		return utilisateurDao.obtenirTous();
	}

}
