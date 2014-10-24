package com.gp.dao;

import java.util.List;

import com.gp.domain.Utilisateur;

public interface UtilisateurDao {

	public Utilisateur trouverParLogin(String login);
	public Utilisateur trouverParId(Integer id);
	public void enregistrer(Utilisateur utilisateur);
	public boolean supprimer(Utilisateur utilisateur);
	public List<Utilisateur> obtenirTous();
}
