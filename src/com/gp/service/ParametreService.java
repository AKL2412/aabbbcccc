package com.gp.service;

import com.gp.domain.Parametre;

public interface ParametreService {
	public Parametre trouverParId(Integer num);
	public void enregistrer(Parametre parametre);
	public boolean supprimer(Parametre parametre);
}
