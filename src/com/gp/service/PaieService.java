package com.gp.service;

import com.gp.domain.Paie;

public interface PaieService {
	public Paie trouverParId(Integer id);
	public void enregistrer(Paie paie);
	public boolean supprimer(Paie paie);
}
