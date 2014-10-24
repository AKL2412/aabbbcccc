package com.gp.service;

import java.util.List;

import com.gp.domain.Utilisateur;

public interface UtilisateurService {
	public Utilisateur trouverParLogin(String login);
	public void enregistrer(Utilisateur utilisateur);
	public boolean supprimer(Utilisateur utilisateur);
	public List<Utilisateur> obtenirTous();
}
