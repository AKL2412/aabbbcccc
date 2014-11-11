package com.gp.service;

import com.gp.domain.Salarie;

public interface SalarieService {
	public void enregistrer(Salarie s);
	public boolean supprimer(Salarie s);
	public Salarie trouverParId(Integer id);
}
