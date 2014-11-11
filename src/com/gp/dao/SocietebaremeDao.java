package com.gp.dao;

import com.gp.domain.Societebareme;

public interface SocietebaremeDao {
	public Societebareme trouverParId(Integer id);
	public void enregistrer(Societebareme bareme);
	public boolean supprimer(Societebareme bareme);
}
