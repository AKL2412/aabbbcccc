package com.gp.dao;

import com.gp.domain.Enfant;

public interface EnfantDao {
	public Enfant trouverParId(Integer id);
	public void enregistrer(Enfant etatcivile);
	public boolean supprimer(Enfant etatcivile);
}
