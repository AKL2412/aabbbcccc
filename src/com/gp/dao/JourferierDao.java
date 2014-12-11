package com.gp.dao;

import com.gp.domain.Tableferier;

public interface JourferierDao {
	public Tableferier trouverParId(Integer num);
	public void enregistrer(Tableferier ferier);
	public boolean supprimer(Tableferier ferier);
}
