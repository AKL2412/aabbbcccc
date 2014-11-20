package com.gp.service;

import com.gp.domain.Avance;

public interface AvanceService {
	public Avance trouverParId(Integer num);
	public void enregistrer(Avance avance);
	public boolean supprimer(Avance avance);
}
