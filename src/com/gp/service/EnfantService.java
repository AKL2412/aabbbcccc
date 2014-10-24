package com.gp.service;

import com.gp.domain.Enfant;

public interface EnfantService {
	public Enfant trouverParId(Integer id);
	public void enregistrer(Enfant etatcivile);
	public boolean supprimer(Enfant etatcivile);
}
