package com.gp.service;

import com.gp.domain.Societebareme;

public interface SocietebaremeService {
	public Societebareme trouverParId(Integer id);
	public void enregistrer(Societebareme bareme);
	public boolean supprimer(Societebareme bareme);
}
