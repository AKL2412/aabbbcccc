package com.gp.dao;

import com.gp.domain.Paie;

public interface PaieDao {
	public Paie trouverParId(Integer id);
	public void enregistrer(Paie paie);
	public boolean supprimer(Paie paie);
}
