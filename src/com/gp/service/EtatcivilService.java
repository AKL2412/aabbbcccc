package com.gp.service;

import com.gp.domain.Etatcivile;

public interface EtatcivilService {

	public Etatcivile trouverParId(Integer id);
	public void enregistrer(Etatcivile etatcivile);
	public boolean supprimer(Etatcivile etatcivile);
}
