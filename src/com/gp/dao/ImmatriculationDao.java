package com.gp.dao;

import com.gp.domain.Immatriculation;

public interface ImmatriculationDao {
	public Immatriculation trouverParId(Integer id);
	public void enregistrer(Immatriculation immatriculation);
	public boolean supprimer(Immatriculation immatriculation);
}
