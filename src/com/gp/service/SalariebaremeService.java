package com.gp.service;

import com.gp.domain.Salariebareme;

public interface SalariebaremeService {

	public Salariebareme trouverParId(Integer id);
	public void enregistrer(Salariebareme bareme);
	public boolean supprimer(Salariebareme bareme);
}
