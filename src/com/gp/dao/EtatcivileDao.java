package com.gp.dao;

import com.gp.domain.Etatcivile;

public interface EtatcivileDao {
	public Etatcivile trouverParId(Integer id);
	public void enregistrer(Etatcivile etatcivile);
	public boolean supprimer(Etatcivile etatcivile);
}
