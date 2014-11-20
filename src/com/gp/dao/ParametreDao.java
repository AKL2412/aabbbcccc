package com.gp.dao;

import com.gp.domain.Parametre;

public interface ParametreDao {
	public Parametre trouverParId(Integer num);
	public void enregistrer(Parametre parametre);
	public boolean supprimer(Parametre parametre);
}
