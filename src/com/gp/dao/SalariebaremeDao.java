package com.gp.dao;

import com.gp.domain.Salariebareme;

public interface SalariebaremeDao {
	public Salariebareme trouverParId(Integer id);
	public void enregistrer(Salariebareme bareme);
	public boolean supprimer(Salariebareme bareme);
}
