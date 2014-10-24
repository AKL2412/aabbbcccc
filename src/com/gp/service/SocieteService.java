package com.gp.service;

import java.util.List;

import com.gp.domain.Societe;

public interface SocieteService {
	public List<Societe> trouverParIntitule(String intitule);
	public void enregistrer(Societe societe);
	public boolean supprimer(Societe societe);
	public List<Societe> trouverTous();
	public Societe trouverParSlug(String slug);
}
